// lib/data/network/sync_api_service.dart
import 'dart:convert';
import 'dart:async';
import 'dart:io'; // For SocketException
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/models/user_sync_page.dart';
import 'package:bio_oee_lab/data/database/tables/user_table.dart';

class SyncApiService {
  final http.Client _client = http.Client();

  // ⚠️ คุณต้องตรวจสอบ Endpoint นี้กับ Server ของคุณ
  // (ผมเดาว่าชื่อ /User/GetUsers หรือ /api/User/GetUsers)
  final String _getUsersUrl = '${AppConfig.baseUrl}/OEE_USER_SYNC';

  Future<UserSyncPage> getUsersPage(int pageIndex, {int pageSize = 100}) async {
    final Uri uri = Uri.parse(_getUsersUrl);

    final String requestBody = jsonEncode({
      'pageIndex': pageIndex.toString(),
      'pageSize': pageSize.toString(),
    });

    if (kDebugMode) {
      print('--- SYNC API RequestBody (Page $pageIndex) ---');
      print(requestBody);
    }

    try {
      // --- ⬇️⬇️⬇️ FIX 3: เปลี่ยน .get เป็น .post ⬇️⬇️⬇️ ---
      final response = await _client
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: requestBody, // <<< ส่ง Body ที่เราสร้าง
          )
          .timeout(const Duration(seconds: 60));
      // --- ⬆️⬆️⬆️ ----------------------------------- ⬆️⬆️⬆️ ---

      if (response.statusCode == 200) {
        // C# คืนค่าเป็น Stream เราจึงต้อง decode bodyBytes
        final String jsonString = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

        if (kDebugMode) {
          print('--- SYNC API RESPONSE (Page $pageIndex) ---');
          print(jsonString);
        }

        try {
          // Model ใหม่ของเรา (จากขั้นตอนที่ 1) จะจัดการ
          // "Users" ที่เป็น String ได้เอง

          return UserSyncPage.fromJson(jsonResponse);
        } catch (e) {
          if (kDebugMode) {
            print('Error parsing UserSyncPage: $e');
          }
          throw Exception('Failed to parse user page: $e');
        }
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

  /// ดึงรายชื่อผู้ใช้ทั้งหมดจาก Server
  Future<List<DbUser>> getAllUsers() async {
    final Uri uri = Uri.parse(_getUsersUrl);

    try {
      // (ในอนาคต: อาจจะต้องใส่ Token สำหรับยืนยันตัวตน)
      // final String? token = await _secureStorage.read(key: 'auth_token');
      final response = await _client
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              // 'Authorization': 'Bearer $token',
            },
          )
          .timeout(const Duration(seconds: 60)); // (การ Sync อาจใช้เวลานาน)

      if (response.statusCode == 200) {
        // เราคาดหวังว่า Server จะส่ง JSON List `[...]` กลับมา
        final List<dynamic> jsonResponse = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

        try {
          // แปลง JSON แต่ละก้อนใน List ให้เป็น DbUser
          return jsonResponse
              .map(
                (userJson) => DbUser.fromJson(userJson as Map<String, dynamic>),
              )
              .toList();
        } catch (e) {
          // ถ้าโครงสร้าง JSON ที่ได้มาไม่ตรงกับ DbUser.fromJson
          throw Exception('Failed to parse user list: $e');
        }
      } else {
        // Server Error (500, 404, ฯลฯ)
        throw Exception('Server error: ${response.statusCode}');
      }
    } on SocketException {
      // Network Error
      throw Exception('Cannot connect to server. Please check network.');
    } on TimeoutException {
      // Timeout Error
      throw Exception('Server did not respond in time.');
    } catch (e) {
      // Error อื่นๆ
      throw Exception('An unknown error occurred: $e');
    }
  }
}
