// lib/data/network/user_api_service.dart
import 'dart:convert';
import 'dart:async';
import 'dart:io'; // For SocketException
import 'package:http/http.dart' as http;

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/core/app_config.dart';
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

  Future<LoginResult> login(
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
          final List<dynamic> packagesJson =
              jsonResponse['packages'] as List<dynamic>;

          final UserData user = UserData.fromJson(userDataJson);
          final List<PackageData> packages = packagesJson
              .map((pkgJson) =>
                  PackageData.fromJson(pkgJson as Map<String, dynamic>))
              .toList();

          final String token = jsonResponse['token'] ?? ''; // (ดึง Token ถ้ามี)

          final loggedInUser =
              LoggedInUser(user: user, token: token, packages: packages);

          // (ส่งผลลัพธ์กลับไป แต่ใน LoginResult เรายังไม่ได้เก็บ User)
          // เดี๋ยวเราจะไปแก้ LoginRepository ให้เก็บ User ลง DB
          return LoginResult(status: LoginStatus.success);
        } catch (e) {
          // JSON ที่ Server ส่งกลับมาไม่ตรงโครงสร้างที่เราคาดหวัง
          return LoginResult(
              status: LoginStatus.serverError,
              message: 'Invalid server response format.');
        }
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        // --- 3.2 ข้อมูลผิด (Invalid Credentials) ---
        return LoginResult(
            status: LoginStatus.invalidCredentials,
            message: 'Invalid username or password.');
      } else {
        // --- 3.3 Server พัง (Server Error) ---
        return LoginResult(
            status: LoginStatus.serverError,
            message: 'Server error: ${response.statusCode}');
      }
    } on SocketException {
      // --- 4. ปิดอินเทอร์เน็ต (Network Error) ---
      return LoginResult(
          status: LoginStatus.networkError,
          message: 'Cannot connect to server. Please check network.');
    } on TimeoutException {
      // --- 5. Server ตอบช้า (Timeout) ---
      return LoginResult(
          status: LoginStatus.networkError,
          message: 'Server did not respond in time.');
    } catch (e) {
      // --- 6. Error ไม่ทราบสาเหตุ ---
      return LoginResult(
          status: LoginStatus.unknownError,
          message: 'An unknown error occurred: $e');
    }
  }
}
