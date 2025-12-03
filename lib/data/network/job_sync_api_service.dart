import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

class JobSyncResult {
  final String recId; // Or DocumentId for Documents
  final int execResult;
  final String? message;
  final int recordVersion;

  JobSyncResult({
    required this.recId,
    required this.execResult,
    this.message,
    required this.recordVersion,
  });

  factory JobSyncResult.fromJson(Map<String, dynamic> json) {
    // Handle both RecId (common) and DocumentId (for Documents)
    final id =
        json['RecId'] ??
        json['recId'] ??
        json['DocumentId'] ??
        json['documentId'] ??
        '';

    return JobSyncResult(
      recId: id,
      execResult: json['ExecResult'] ?? json['execResult'] ?? 0,
      message: json['Message'] ?? json['message'],
      recordVersion: json['RecordVersion'] ?? json['recordVersion'] ?? 0,
    );
  }
}

class JobSyncApiService {
  static const String _baseUrl = AppConfig.baseUrl;

  // Helper to parse response
  List<JobSyncResult> _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final execResult =
          jsonResponse['ExecResult'] ?? jsonResponse['execResult'];
      final dataList = jsonResponse['Data'] ?? jsonResponse['data'];

      // Case 1: Standard format
      if (execResult == 1 && dataList != null) {
        final List<dynamic> data = dataList;
        return data.map((e) => JobSyncResult.fromJson(e)).toList();
      }

      // Case 2: ExecResult is a JSON string
      if (execResult is String) {
        try {
          final parsedList = jsonDecode(execResult);
          if (parsedList is List) {
            return parsedList.map((e) => JobSyncResult.fromJson(e)).toList();
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
  }

  // 1. Sync Documents
  Future<List<JobSyncResult>> syncDocuments(
    List<DbDocument> items,
    String userId,
    String deviceId,
  ) async {
    if (items.isEmpty) return [];
    final url = Uri.parse('$_baseUrl/OEE_DOCUMENT_SYNC');

    final body = {
      "deviceId": deviceId,
      "userId": userId,
      "Data": items
          .map(
            (item) => {
              "documentId": item.documentId,
              "jobId": item.jobId,
              "documentName": item.documentName,
              "createDate": item.createDate,
              "status": item.status,
              "runningDate": item.runningDate,
              "endDate": item.endDate,
              "postDate": item.postDate,
              "cancleDate":
                  item.cancelDate, // Note: API might expect 'cancleDate'
              "deleteDate": item.deleteDate,
              "recordVersion": item.recordVersion,
            },
          )
          .toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      if (kDebugMode) print('Sync Documents Error: $e');
      rethrow;
    }
  }

  // 2. Sync Job Working Times
  Future<List<JobSyncResult>> syncJobWorkingTimes(
    List<DbJobWorkingTime> items,
    String userId,
    String deviceId,
  ) async {
    if (items.isEmpty) return [];
    final url = Uri.parse('$_baseUrl/OEE_JOB_WORKING_TIME_SYNC');

    final body = {
      "deviceId": deviceId,
      "userId": userId,
      "Data": items
          .map(
            (item) => {
              "recId": item.recId,
              "documentId": item.documentId,
              "userId": item.userId,
              "activityId": item.activityId,
              "startTime": item.startTime,
              "endTime": item.endTime,
              "status": item.status,
              "recordVersion": item.recordVersion,
            },
          )
          .toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      if (kDebugMode) print('Sync Working Times Error: $e');
      rethrow;
    }
  }

  // 3. Sync Job Test Sets
  Future<List<JobSyncResult>> syncJobTestSets(
    List<DbJobTestSet> items,
    String userId,
    String deviceId,
  ) async {
    if (items.isEmpty) return [];
    final url = Uri.parse('$_baseUrl/OEE_JOB_TEST_SET_SYNC');

    final body = {
      "deviceId": deviceId,
      "userId": userId,
      "Data": items
          .map(
            (item) => {
              "recId": item.recId,
              "documentId": item.documentId,
              "setItemNo": item.setItemNo,
              "registerDateTime": item.registerDateTime,
              "registerUser": item.registerUser,
              "status": item.status,
              "recordVersion": item.recordVersion,
            },
          )
          .toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      if (kDebugMode) print('Sync Test Sets Error: $e');
      rethrow;
    }
  }

  // 4. Sync Running Job Machines
  Future<List<JobSyncResult>> syncRunningJobMachines(
    List<DbRunningJobMachine> items,
    String userId,
    String deviceId,
  ) async {
    if (items.isEmpty) return [];
    final url = Uri.parse('$_baseUrl/OEE_RUNNING_JOB_MACHINE_SYNC');

    final body = {
      "deviceId": deviceId,
      "userId": userId,
      "Data": items
          .map(
            (item) => {
              "recId": item.recId,
              "documentId": item.documentId,
              "machineNo": item.machineNo,
              "registerDateTime": item.registerDateTime,
              "registerUser": item.registerUser,
              "status": item.status,
              "recordVersion": item.recordVersion,
            },
          )
          .toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      if (kDebugMode) print('Sync Machines Error: $e');
      rethrow;
    }
  }

  // 5. Sync Job Machine Event Logs
  Future<List<JobSyncResult>> syncJobMachineEventLogs(
    List<DbJobMachineEventLog> items,
    String userId,
    String deviceId,
  ) async {
    if (items.isEmpty) return [];
    final url = Uri.parse('$_baseUrl/OEE_JOB_MACHINE_EVENT_LOG_SYNC');

    final body = {
      "deviceId": deviceId,
      "userId": userId,
      "Data": items
          .map(
            (item) => {
              "recId": item.recId,
              "jobMachineRecId": item.jobMachineRecId,
              "startTime": item.startTime,
              "endTime": item.endTime,
              "status": item.status,
              "recordVersion": item.recordVersion,
            },
          )
          .toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      if (kDebugMode) print('Sync Machine Logs Error: $e');
      rethrow;
    }
  }

  // 6. Sync Job Machine Items
  Future<List<JobSyncResult>> syncJobMachineItems(
    List<DbJobMachineItem> items,
    String userId,
    String deviceId,
  ) async {
    if (items.isEmpty) return [];
    final url = Uri.parse('$_baseUrl/OEE_JOB_MACHINE_ITEM_SYNC');

    final body = {
      "deviceId": deviceId,
      "userId": userId,
      "Data": items
          .map(
            (item) => {
              "recId": item.recId,
              "documentId": item.documentId,
              "jobTestSetRecId": item.jobTestSetRecId,
              "jobMachineRecId": item.jobMachineRecId,
              "registerDateTime": item.registerDateTime,
              "registerUser": item.registerUser,
              "status": item.status,
              "recordVersion": item.recordVersion,
            },
          )
          .toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      if (kDebugMode) print('Sync Machine Items Error: $e');
      rethrow;
    }
  }
}
