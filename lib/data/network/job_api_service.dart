import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

// คลาสสำหรับรับค่า Return กลับไป (รวมข้อมูลงาน และ จำนวนหน้า)
class JobSyncResponse {
  final List<DbJob> jobs;
  final int totalPages;

  JobSyncResponse({required this.jobs, required this.totalPages});
}

class JobApiService {
  final http.Client _client = http.Client();
  final String _baseUrl = AppConfig.baseUrl;

  Future<bool> createJob(DbJob job) async {
    final Uri uri = Uri.parse('$_baseUrl/OEE_JOB_CREATE'); // Assumed Endpoint
    final body = jsonEncode({
      'JobName': job.jobName,
      'CreateBy': job.createBy,
      'CreateDate': job.createDate,
      // Add other fields if API supports them
    });

    if (kDebugMode) {
      print('--- Create Manual Job API Request ---');
      print(body);
    }

    try {
      final response = await _client
          .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 30));

      if (kDebugMode) {
        print('--- Create Manual Job API Response ---');
        print('Status: ${response.statusCode}');
        print('Body: ${response.body}');
      }

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to create manual job: $e');
      }
      return false;
    }
  }

  Future<JobSyncResponse> getJobs(
    String userId,
    int pageIndex, {
    int pageSize = 10,
  }) async {
    // ตรวจสอบ URL API ของคุณอีกทีนะครับ
    final Uri uri = Uri.parse('$_baseUrl/OEE_JOB_SYNC');

    final body = jsonEncode({
      'userId': userId,
      'pageIndex': pageIndex.toString(),
      'pageSize': pageSize.toString(),
    });

    if (kDebugMode) {
      print('--- JobSync API RequestBody (Page $pageIndex) ---');
      print(body);
    }

    try {
      final response = await _client
          .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

        final String jsonString = utf8.decode(response.bodyBytes);
        if (kDebugMode) {
          print('--- JobSync API RESPONSE (Page $pageIndex) ---');
          print(jsonString);
        }

        // 1. อ่าน TotalPages (รองรับทั้งตัวเล็กตัวใหญ่)
        final int totalPages =
            jsonResponse['TotalPages'] ?? jsonResponse['totalPages'] ?? 0;

        // 2. อ่าน List Jobs (รองรับ Key 'Jobs', 'jobs', 'Data' แล้วแต่ API)
        List<dynamic> list = [];

        // ⭐️ FIX 1: เพิ่มการดักจับ Key 'Users' (เพราะ API ส่งผิดมาเป็น Users)
        var rawData =
            jsonResponse['Jobs'] ??
            jsonResponse['jobs'] ??
            jsonResponse['Users'] ?? // <<< ดักไว้ตรงนี้
            jsonResponse['users'];

        if (rawData != null) {
          if (rawData is String) {
            // ⭐️ FIX 2: แก้ปัญหา Stringified JSON "[...]"
            try {
              list = jsonDecode(rawData);
            } catch (e) {
              print('Error decoding jobs string: $e');
              list = [];
            }
          } else if (rawData is List) {
            list = rawData;
          }
        }

        // 3. Manual Mapping (ป้องกัน Error Null/Type mismatch)
        final List<DbJob> mappedJobs = list.map((item) {
          final map = item as Map<String, dynamic>;
          return DbJob(
            uid: 0, // ให้ DB รันเอง
            jobId: map['JobId']?.toString() ?? map['jobId']?.toString(),
            jobName: map['JobName']?.toString() ?? map['jobName']?.toString(),
            machineName:
                map['MachineName']?.toString() ??
                map['machineName']?.toString(),
            documentId:
                map['DocumentId']?.toString() ?? map['documentId']?.toString(),
            location:
                map['Location']?.toString() ?? map['location']?.toString(),
            // แปลง Status เป็น int เสมอ
            jobStatus:
                int.tryParse(
                  map['Status']?.toString() ??
                      map['JobStatus']?.toString() ??
                      '0',
                ) ??
                0,
            createDate: map['CreateDate']?.toString(),
            createBy: map['CreateBy']?.toString(),
            lastSync: DateTime.now().toIso8601String(),
            updatedAt: null,
            isManual: false, // Default for API fetched jobs
            isSynced: true, // API jobs are always synced
            recordVersion: 0,
            oeeJobId: int.tryParse(map['OEEJobID']?.toString() ?? ''),
            analysisJobId: int.tryParse(map['AnalysisJobID']?.toString() ?? ''),
            sampleNo: map['SampleNo']?.toString(),
            sampleName: map['SampleName']?.toString(),
            lotNo: map['LOTNO']?.toString(),
            setId: int.tryParse(map['SetID']?.toString() ?? ''),
            planAnalysisDate: map['PlanAnalysisDate']?.toString(),
            createUser: map['CreateUser']?.toString(),
            updateUser: map['UpdateUser']?.toString(),
            updateDate: map['UpdateDate']?.toString(),
            recUpdate: int.tryParse(map['RecUpdate']?.toString() ?? ''),
            assignmentId: map['AssignmentID']?.toString(),
          );
        }).toList();

        return JobSyncResponse(jobs: mappedJobs, totalPages: totalPages);
      } else {
        if (kDebugMode) {
          print('Server error: ${response.statusCode}');
        }

        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch jobs: $e');
      }
      throw Exception('Failed to fetch jobs: $e');
    }
  }
}
