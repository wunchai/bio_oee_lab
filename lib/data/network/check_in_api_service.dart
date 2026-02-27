import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

class CheckInSyncResult {
  final String recId;
  final int execResult;
  final String? message;
  final int recordVersion;

  CheckInSyncResult({
    required this.recId,
    required this.execResult,
    this.message,
    required this.recordVersion,
  });

  factory CheckInSyncResult.fromJson(Map<String, dynamic> json) {
    return CheckInSyncResult(
      recId: json['RecId'] ?? json['recId'] ?? '',
      execResult: json['ExecResult'] ?? json['execResult'] ?? 0,
      message: json['Message'] ?? json['message'],
      recordVersion: json['RecordVersion'] ?? json['recordVersion'] ?? 0,
    );
  }
}

class CheckInApiService {
  // TODO: Move to config

  static const String _baseUrl = AppConfig.baseUrl;

  Future<List<CheckInSyncResult>> uploadCheckInLogs(
    List<DbCheckInLog> logs,
    String userId,
    String deviceId,
  ) async {
    if (logs.isEmpty) return [];

    final url = Uri.parse('$_baseUrl/OEE_CHECKIN_LOG_SYNC');

    final body = {
      "deviceId": deviceId,
      "userId": userId,
      "Data": logs.map((log) {
        return {
          "recId": log.recId,
          "locationCode": log.locationCode,
          "userId": log.userId,
          "activityName": log.activityName,
          "remark": log.remark,
          "checkInTime": log.checkInTime,
          "checkOutTime": log.checkOutTime,
          "status": log.status,
          "recordVersion": log.recordVersion,
        };
      }).toList(),
    };

    try {
      if (kDebugMode) {
        print('Syncing CheckIn Logs: ${logs.length} items');
        print('Body: ${jsonEncode(body)}');
      }

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        final execResult =
            jsonResponse['ExecResult'] ?? jsonResponse['execResult'];
        final dataList = jsonResponse['Data'] ?? jsonResponse['data'];

        // Case 1: Standard format
        if (execResult == 1 && dataList != null) {
          final List<dynamic> data = dataList;
          return data.map((e) => CheckInSyncResult.fromJson(e)).toList();
        }

        // Case 2: ExecResult is a JSON string containing the list
        if (execResult is String) {
          try {
            final parsedList = jsonDecode(execResult);
            if (parsedList is List) {
              return parsedList
                  .map((e) => CheckInSyncResult.fromJson(e))
                  .toList();
            }
          } catch (e) {
            if (kDebugMode) print('Error parsing ExecResult string: $e');
          }
        }
      }

      if (kDebugMode) {
        print('Sync Failed: ${response.statusCode} - ${response.body}');
      }
      return [];
    } catch (e) {
      if (kDebugMode) print('Sync Exception: $e');
      rethrow;
    }
  }
}
