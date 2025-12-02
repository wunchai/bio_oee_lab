import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

class ActivitySyncResult {
  final String recId;
  final int execResult;
  final int recordVersion;

  ActivitySyncResult({
    required this.recId,
    required this.execResult,
    required this.recordVersion,
  });

  factory ActivitySyncResult.fromJson(Map<String, dynamic> json) {
    return ActivitySyncResult(
      recId: json['recId'] as String,
      execResult: json['execResult'] as int,
      recordVersion: json['recordVersion'] as int,
    );
  }
}

class ActivityApiService {
  final http.Client _client = http.Client();

  // Endpoint for uploading activity logs
  final String _uploadUrl = '${AppConfig.baseUrl}/OEE_ACTIVITY_LOG_SYNC';

  Future<List<ActivitySyncResult>> uploadActivityLogs(
    List<DbActivityLog> logs,
    String userId,
    String deviceId,
  ) async {
    final Uri uri = Uri.parse(_uploadUrl);

    // Convert logs to JSON
    final List<Map<String, dynamic>> jsonLogs = logs
        .map((log) => log.toJson())
        .toList();
    final String requestBody = jsonEncode({
      'userId': userId,
      'deviceId': deviceId,
      'jsonLogs': jsonLogs,
    });

    if (kDebugMode) {
      print('--- UPLOAD ACTIVITY LOGS (${logs.length} records) ---');
      print(requestBody);
    }

    try {
      final response = await _client
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: requestBody,
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final String jsonString = utf8.decode(response.bodyBytes);

        if (kDebugMode) {
          print('--- UPLOAD RESPONSE ---');
          print(jsonString);
        }

        final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

        // The key is 'ativityLogData' (typo in API)
        final String? nestedJsonString =
            jsonResponse['ativityLogData'] as String?;

        if (nestedJsonString != null) {
          final List<dynamic> nestedList = jsonDecode(nestedJsonString);
          return nestedList
              .map(
                (e) => ActivitySyncResult.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        }

        return [];
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Cannot connect to server. Please check network.');
    } on TimeoutException {
      throw Exception('Server did not respond in time.');
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }
}
