// lib/data/network/user_api_service.dart
import 'dart:convert';
import 'dart:async';
import 'dart:io'; // For SocketException
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
import 'package:bio_oee_lab/data/models/login_result.dart';
import 'package:bio_oee_lab/data/models/package_data.dart';
import 'package:bio_oee_lab/data/models/logged_in_user.dart';

class UserApiService {
  // สร้าง http client ไว้ใช้ซ้ำ
  final http.Client _client = http.Client();

  // นี่คือ URL ของ API ที่จะยิง (เราดึงมาจาก AppConfig)
  final String _getUsersUrl = '${AppConfig.baseUrl}/OEE_USER_LOGIN';

  Future<LoggedInUser> login(
    String userId,
    String password,
    String deviceId,
  ) async {
    final Uri uri = Uri.parse(_getUsersUrl);

    // 1. เตรียมข้อมูลที่จะส่ง (Body)
    final requestBody = jsonEncode({'userId': userId, 'password': password});

    if (kDebugMode) {
      print('--- LOGIN API RequestBody ---');
      print(requestBody);
    }

    try {
      // 2. ยิง POST Request
      final response = await _client
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: requestBody,
          )
          .timeout(const Duration(seconds: 30)); // (ตั้งเวลา Timeout 30 วินาที)

      // 3. ตรวจสอบผลลัพธ์
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('--- LOGIN API Response ---');
          print(response.body);
        }

        // --- 3.1 สำเร็จ (Success) ---
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // ⬇️⬇️⬇️ --- เริ่มส่วนที่แก้ไข --- ⬇️⬇️⬇️
        try {
          if (kDebugMode) {
            print('--- user  Start---');
          }

          final List<dynamic> userListJson =
              jsonResponse['user'] as List<dynamic>;
          if (userListJson.isEmpty) {
            throw Exception('User list in response is empty.');
          }
          final Map<String, dynamic> userDataJson =
              userListJson[0] as Map<String, dynamic>;

          // ⬇️⬇️⬇️ --- เริ่มส่วนที่แก้ไข --- ⬇️⬇️⬇️

          // ลบบรรทัดนี้ทิ้ง (นี่คือตัวปัญหา):
          // final DbUser user = DbUser.fromJson(userDataJson);

          // ⭐️ แทนที่ด้วยการ Manual Mapping (DTO Pattern) ⭐️
          // (เราต้องสร้าง DbUser object โดยระบุทุก field
          // อ้างอิงจาก user_table.dart)
          final DbUser user = DbUser(
            // 1. uid ไม่ได้มาจาก API, ใส่ค่า default (0 หรือ 1)
            //    (ไม่มีผลอะไร เพราะนี่เป็นแค่ DTO ชั่วคราว)
            uid: 0,

            // 2. แมพค่าจาก JSON (Map)
            userId: userDataJson['userId'] as String?,
            userCode: userDataJson['userCode'] as String?,
            userName: userDataJson['userName'] as String?,
            position: userDataJson['position'] as String?,

            // 3. ⭐️⭐️⭐️ นี่คือการแก้ปัญหา ⭐️⭐️⭐️
            //    ดึงจาก 'Status' (S ใหญ่)
            status: userDataJson['Status'] as int? ?? 0,

            // 4. เติม field ที่เหลือให้ครบ (ที่ API ไม่ได้ส่งมา)
            password: null,
            lastSync: null,
            updatedAt: null,
            isLocalSessionActive: false,
          );

          if (kDebugMode) {
            print('--- packages  Start---');
          }
          final List<dynamic> packagesJson =
              jsonResponse['packages'] as List<dynamic>;

          final List<PackageData> packages = packagesJson.map((pkgJson) {
            final map = pkgJson as Map<String, dynamic>;

            // ⚠️ Manual Mapping: แก้ปัญหา Key ตัวเล็ก และแปลง String เป็น int/bool
            return PackageData(
              // แปลง String "1" -> int 1
              packageId: int.tryParse(map['packageId'].toString()) ?? 0,

              packageName: map['packageName']?.toString() ?? '',

              description: map['description']?.toString() ?? '',

              // แปลง String "1" -> bool true
              isActive: (map['isActive'].toString() == '1'),
            );
          }).toList();
          if (kDebugMode) {
            print('--- token  Start---');
          }
          // 3. ดึง Token (API ส่ง Key 'token' เป็น List)
          final List<dynamic> tokenListJson =
              jsonResponse['token'] as List<dynamic>;
          if (tokenListJson.isEmpty) {
            throw Exception('Token list in response is empty.');
          }
          // เข้าถึง object ตัวแรกใน List แล้วดึง 'token' ที่อยู่ข้างใน
          final String token = tokenListJson[0]['token'] ?? '';

          if (kDebugMode) {
            print('--- LoggedInUser  Start---');
          }
          // 6. สร้างและคืนค่า LoggedInUser
          return LoggedInUser(user: user, token: token, packages: packages);
        } catch (e) {
          // ถ้าโครงสร้าง JSON ที่ Server ส่งมาไม่ตรงที่เราแก้
          print(
            'Error parsing JSON response: $e',
          ); // <<< เพิ่ม print เพื่อ Debug
          throw Exception('Invalid server response format.');
        }
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        // ⬇️⬇️⬇️ FIX 5: เปลี่ยนจาก return เป็น throw ⬇️⬇️⬇️
        throw Exception('Invalid username or password.');
      } else {
        // ⬇️⬇️⬇️ FIX 6: เปลี่ยนจาก return เป็น throw ⬇️⬇️⬇️
        throw Exception('Server error: ${response.statusCode}');
      }
    } on SocketException {
      // ⬇️⬇️⬇️ FIX 7: เปลี่ยนจาก return เป็น throw ⬇️⬇️⬇️
      throw Exception('Cannot connect to server. Please check network.');
    } on TimeoutException {
      // ⬇️⬇️⬇️ FIX 8: เปลี่ยนจาก return เป็น throw ⬇️⬇️⬇️
      throw Exception('Server did not respond in time.');
    } catch (e) {
      // ส่งต่อ Error อื่นๆ
      if (kDebugMode) {
        print('An unknown error occurred: $e');
      }
      throw Exception('An unknown error occurred: $e');
    }
  }
}
