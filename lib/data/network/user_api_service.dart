// lib/data/network/user_api_service.dart
import 'dart:convert';
import 'dart:async';
import 'dart:io'; // For SocketException
import 'package:http/http.dart' as http;

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
  final String _loginUrl =
      '${AppConfig.baseUrl}/Login/Login'; // <<< ⚠️ คุณอาจต้องแก้ Path นี้ให้ตรงกับ API ของคุณ

  Future<LoggedInUser> login(
      String username, String password, String deviceId) async {
    final Uri uri = Uri.parse(_loginUrl);

    // 1. เตรียมข้อมูลที่จะส่ง (Body)
    final requestBody = jsonEncode({
      'userId': username,
      'password': password,
      'deviceId': deviceId,
    });

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
        // --- 3.1 สำเร็จ (Success) ---
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // (ตัวอย่างการแปลง JSON ที่ซับซ้อน)
        // คุณต้องแก้ส่วนนี้ให้ตรงกับ JSON ที่ Server คุณส่งกลับมา
        try {
          // สมมติว่า Server คืนค่า UserData และ PackageData มา
          final userDataJson = jsonResponse['user'] as Map<String, dynamic>;
          final DbUser user = DbUser.fromJson(userDataJson);

          final List<dynamic> packagesJson =
              jsonResponse['packages'] as List<dynamic>;

          final List<PackageData> packages = packagesJson
              .map((pkgJson) =>
                  PackageData.fromJson(pkgJson as Map<String, dynamic>))
              .toList();

          final String token = jsonResponse['token'] ?? ''; // (ดึง Token ถ้ามี)

          // 6. สร้างและคืนค่า LoggedInUser
          return LoggedInUser(user: user, token: token, packages: packages);
        } catch (e) {
          // ถ้าโครงสร้าง JSON ที่ Server ส่งมาไม่ตรงที่เราแก้
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
      throw Exception('An unknown error occurred: $e');
    }
  }
}
