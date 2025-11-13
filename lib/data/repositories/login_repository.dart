// lib/data/repositories/login_repository.dart
import 'package:flutter/material.dart';

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/user_dao.dart'; // <<< import Dao
// ⬇️⬇️⬇️ FIX 1: import DbUser ที่ถูกต้อง ⬇️⬇️⬇️
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
// ⬇️⬇️⬇️ FIX 2: import LoggedInUser ⬇️⬇️⬇️
import 'package:bio_oee_lab/data/models/logged_in_user.dart';
import 'package:bio_oee_lab/data/models/login_result.dart';
import 'package:bio_oee_lab/data/network/user_api_service.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

class LoginRepository with ChangeNotifier {
  final UserDao _userDao;
  final UserApiService _userApiService;
  final DeviceInfoService _deviceInfoService;

  bool _isLoggedIn = false;
  // ⬇️⬇️⬇️ FIX 3: เปลี่ยน Type เป็น DbUser ⬇️⬇️⬇️
  DbUser? _loggedInUser;
  String? _token;
  String _lastErrorMessage = '';

  bool get isLoggedIn => _isLoggedIn;
  // ⬇️⬇️⬇️ FIX 4: เปลี่ยน Type เป็น DbUser ⬇️⬇️⬇️
  DbUser? get loggedInUser => _loggedInUser;
  String? get token => _token;
  String get lastErrorMessage => _lastErrorMessage;
  DeviceInfoService get deviceInfoService => _deviceInfoService;

  LoginRepository({
    required UserDao userDao,
    required UserApiService userApiService,
    required DeviceInfoService deviceInfoService,
  })  : _userDao = userDao,
        _userApiService = userApiService,
        _deviceInfoService = deviceInfoService {
    getLoggedInUserFromLocal();
  }

  /// (A) พยายามดึง User ที่ Login ค้างไว้ ออกจาก Database
  Future<void> getLoggedInUserFromLocal() async {
    try {
      // ⬇️⬇️⬇️ FIX 5: เรียกใช้เมธอดที่เราสร้างใน Dao ⬇️⬇️⬇️
      final user = await _userDao.getLoggedInUser();
      if (user != null) {
        _loggedInUser = user;
        _isLoggedIn = true;
        // (ในอนาคต: เราต้องโหลด Token จาก Secure Storage ที่นี่ด้วย)
        // _token = await _secureStorage.read(key: 'auth_token');
      } else {
        _isLoggedIn = false;
      }
    } catch (e) {
      _isLoggedIn = false;
    }
    notifyListeners();
  }

  /// (B) ฟังก์ชันหลักในการ Login
  Future<LoginResult> login(String username, String password) async {
    _lastErrorMessage = '';
    final deviceId = _deviceInfoService.getLoginDeviceId();
    if (deviceId == 'unknown' || deviceId == 'error_getting_id') {
      return LoginResult(
          status: LoginStatus.unknownError,
          message: 'Could not get Device ID.');
    }

    try {
      // 1. เรียก ApiService (ซึ่งจะ throw Exception ถ้าพลาด)
      final LoggedInUser loggedInUser =
          await _userApiService.login(username, password, deviceId);

      // 2. ถ้า API สำเร็จ, บันทึก User ลง DB
      await _userDao.insertUser(loggedInUser.user);

      // 3. TODO: บันทึก Token ลง Secure Storage

      // 4. อัปเดต State ของ Repository
      _loggedInUser = loggedInUser.user;
      _token = loggedInUser.token;
      _isLoggedIn = true;
      _lastErrorMessage = '';

      // 5. แจ้งเตือน UI และคืนค่าสำเร็จ
      notifyListeners();
      return LoginResult(status: LoginStatus.success);
    } catch (e) {
      // --- ⬇️⬇️⬇️ FIX: นี่คือส่วนที่แก้ไข ⬇️⬇️⬇️ ---
      // 6. ถ้า ApiService โยน Exception ออกมา
      _isLoggedIn = false;
      final String errorMessage = e.toString().replaceAll('Exception: ', '');
      _lastErrorMessage = errorMessage;

      // สร้าง LoginStatus โดยดูจากข้อความ Error ที่เรา throw มาจาก ApiService
      LoginStatus errorStatus;
      if (errorMessage.contains('Invalid username or password')) {
        errorStatus = LoginStatus.invalidCredentials;
      } else if (errorMessage.contains('Cannot connect') ||
          errorMessage.contains('did not respond')) {
        errorStatus = LoginStatus.networkError;
      } else if (errorMessage.contains('Server error:')) {
        errorStatus = LoginStatus.serverError;
      } else {
        // ถ้าไม่เข้าเงื่อนไขไหนเลย ให้เป็น unknownError
        errorStatus = LoginStatus.unknownError;
      }

      notifyListeners();
      // คืนค่า LoginResult ที่มี Status และ Message ที่ถูกต้อง
      return LoginResult(status: errorStatus, message: _lastErrorMessage);
      // --- ⬆️⬆️⬆️ สิ้นสุดส่วนที่แก้ไข ⬆️⬆️⬆️ ---
    }
  }

  /// (C) ฟังก์ชัน Logout
  Future<void> logout() async {
    // ⬇️⬇️⬇️ FIX 7: เรียกใช้เมธอดที่เราสร้างใน Dao ⬇️⬇️⬇️
    await _userDao.clearAllUsers();

    // 2. TODO: เคลียร์ Token จาก Secure Storage
    // await _secureStorage.delete(key: 'auth_token');

    // 3. เคลียร์สถานะใน Repository
    _loggedInUser = null;
    _token = null;
    _isLoggedIn = false;

    notifyListeners();
  }
}
