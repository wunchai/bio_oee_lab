import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:drift/drift.dart' as drift;
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

class JobActivitySyncResponse {
  final List<JobActivitiesCompanion> items;
  final int totalPages;

  JobActivitySyncResponse({required this.items, required this.totalPages});
}

class JobActivityApiService {
  final http.Client _client = http.Client();
  final String _baseUrl = AppConfig.baseUrl;

  Future<JobActivitySyncResponse> getJobActivities(
    String userId,
    int pageIndex, {
    int pageSize = 10,
  }) async {
    // Endpoint: /OEE_JOB_Activity_SYNC
    final Uri uri = Uri.parse('$_baseUrl/OEE_JOB_Activity_SYNC');

    final body = jsonEncode({
      'userId': userId,
      'pageIndex': pageIndex.toString(),
      'pageSize': pageSize.toString(),
    });

    if (kDebugMode) {
      print('--- JobActivitySync API Request (Page $pageIndex) ---');
      print(body);
    }

    try {
      final response = await _client
          .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

        final int totalPages =
            jsonResponse['TotalPages'] ?? jsonResponse['totalPages'] ?? 0;

        List<dynamic> list = [];
        var rawData = jsonResponse['Jobs'] ?? jsonResponse['jobs'];

        if (rawData != null) {
          if (rawData is String) {
            try {
              list = jsonDecode(rawData);
            } catch (e) {
              print('Error decoding JobActivities string: $e');
              list = [];
            }
          } else if (rawData is List) {
            list = rawData;
          }
        }

        final List<JobActivitiesCompanion> mappedItems = list.map((item) {
          final map = item as Map<String, dynamic>;
          return JobActivitiesCompanion.insert(
            rowId: drift.Value(int.tryParse(map['RowId']?.toString() ?? '')),
            oeeJobId: drift.Value(
              int.tryParse(map['OEEJobID']?.toString() ?? ''),
            ),
            testItemId: drift.Value(map['TestItemID']?.toString()),
            activityId: drift.Value(
              int.tryParse(map['ActivityID']?.toString() ?? ''),
            ),
            activityName: drift.Value(map['ActivityName']?.toString()),
            createDate: drift.Value(map['CreateDate']?.toString()),
          );
        }).toList();

        return JobActivitySyncResponse(
          items: mappedItems,
          totalPages: totalPages,
        );
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch JobActivities: $e');
      }
      throw Exception('Failed to fetch JobActivities: $e');
    }
  }
}
