// lib/data/repositories/login_repository.dart
import 'package:drift/drift.dart' show Value;
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
  }) : _userDao = userDao,
       _userApiService = userApiService,
       _deviceInfoService = deviceInfoService {
    getLoggedInUserFromLocal();
  }

  /// (A) พยายามดึง User ที่ Login ค้างไว้ ออกจาก Database
  Future<void> getLoggedInUserFromLocal() async {
    try {
      final user = await _userDao.getLoggedInUser();
      if (user != null) {
        _setSuccessState(user, null); // Token ต้องโหลดจาก Secure Storage (TODO)
      } else {
        _isLoggedIn = false;
      }
    } catch (e) {
      _isLoggedIn = false;
    }
    notifyListeners();
  }

  // --- ⬇️⬇️⬇️ FIX 2: แก้ไขเมธอด login ทั้งหมด ⬇️⬇️⬇️ ---
  /// (B) ฟังก์ชันหลักในการ Login (Logic ใหม่)
  Future<LoginResult> login(String username, String password) async {
    _lastErrorMessage = '';

    // 1. ตรวจสอบ Device ID ก่อน
    final deviceId = _deviceInfoService.getLoginDeviceId();
    if (deviceId == 'unknown' || deviceId == 'error_getting_id') {
      return LoginResult(
        status: LoginStatus.unknownError,
        message: 'Could not get Device ID.',
      );
    }

    // 2. ค้นหา User ในฐานข้อมูล Offline
    final DbUser? localUser = await _userDao.findUserByUserId(username);

    // --- นี่คือ Logic ใหม่ตามที่คุณต้องการ ---
    // 3. ถ้าไม่เจอ User ในเครื่อง
    if (localUser == null) {
      // 🛑 คืนค่า Error ให้ไป Sync ก่อน (ตามที่คุณขอ)
      return LoginResult(
        status: LoginStatus.userNotFoundOffline,
        message: 'User not found locally. Please press Sync User button.',
      );
    }

    // 4. ถ้าเจอ User ในเครื่อง
    // ตรวจสอบ Password ที่เก็บไว้ (field 'userPassword' ในตาราง)
    final String? storedPassword = localUser.password;

    // 5. ถ้า Password ในเครื่องเป็น null (Login ครั้งแรก)
    if (storedPassword == null) {
      // ไปขั้นตอน Online Login (ครั้งแรก)
      return _performOnlineLogin(
        username: username,
        password: password, // Password ที่กรอก
        deviceId: deviceId,
        userToUpdate: localUser, // User ที่ต้องอัปเดต Password
      );
    }

    // 6. ถ้า Password ในเครื่องมีค่า (Login ครั้งต่อไป)
    // ไปขั้นตอน Offline Login
    return _performOfflineLogin(
      enteredPassword: password,
      storedPassword: storedPassword,
      user: localUser,
    );
  }
  // --- ⬆️⬆️⬆️ สิ้นสุดเมธอด login ⬆️⬆️⬆️ ---

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

  // --- ⬇️⬇️⬇️ FIX 3: เพิ่ม 3 เมธอด helper ใหม่ ⬇️⬇️⬇️ ---

  // (นี่คือเมธอด _performOnlineLogin(...) ในคลาส LoginRepository)
  Future<LoginResult> _performOnlineLogin({
    required String username,
    required String password,
    required String deviceId,
    required DbUser userToUpdate,
  }) async {
    try {
      // 1. ยิง API
      final LoggedInUser loggedInUser = await _userApiService.login(
        username,
        password,
        deviceId,
      );

      // 2. ถ้า API สำเร็จ, อัปเดต DbUser ในเครื่อง
      final updatedUser = userToUpdate.copyWith(
        // --- ⬇️⬇️⬇️ FIX 2: แก้ไขส่วนนี้ทั้งหมด ⬇️⬇️⬇️ ---
        password: Value(password), // <<< ใช้ 'pssword'
        userName: Value(loggedInUser.user.userName),
        userCode: Value(loggedInUser.user.userCode),
        position: Value(loggedInUser.user.position),
        status: loggedInUser.user.status,
        // --- ⬆️⬆️⬆️ -------------------------- ⬆️⬆️⬆️ ---
      );

      // 3. บันทึกทับ (Replace) ลง DB
      await _userDao.insertUser(updatedUser);

      // ... (ที่เหลือเหมือนเดิม)
      _setSuccessState(updatedUser, loggedInUser.token);
      return LoginResult(status: LoginStatus.success);
    } catch (e) {
      return _handleLoginError(e);
    }
  }

  /// Helper: กระบวนการ Login Offline (สำหรับครั้งต่อไป)
  LoginResult _performOfflineLogin({
    required String enteredPassword,
    required String storedPassword,
    required DbUser user,
  }) {
    // 1. เปรียบเทียบ Password ที่กรอก กับ Password ในเครื่อง
    if (enteredPassword == storedPassword) {
      // 2. สำเร็จ (Login Offline)
      // TODO: โหลด Token ล่าสุดจาก Secure Storage
      _setSuccessState(user, null); // (ตอนนี้ยังไม่มี Token)
      return LoginResult(status: LoginStatus.success);
    } else {
      // 3. ล้มเหลว (Password ผิด)
      return LoginResult(
        status: LoginStatus.invalidCredentials,
        message: 'Invalid Password. (Offline)',
      );
    }
  }

  /// Helper: จัดการสถานะเมื่อ Login สำเร็จ
  void _setSuccessState(DbUser user, String? token) {
    _loggedInUser = user;
    _token = token; // (Token นี้จะหายไปเมื่อปิดแอป ถ้ายังไม่ใช้ Secure Storage)
    _isLoggedIn = true;
    _lastErrorMessage = '';
    notifyListeners();
  }

  /// Helper: แปลง Exception จาก ApiService เป็น LoginResult
  LoginResult _handleLoginError(Object e) {
    _isLoggedIn = false;
    final String errorMessage = e.toString().replaceAll('Exception: ', '');
    _lastErrorMessage = errorMessage;

    LoginStatus errorStatus;
    if (errorMessage.contains('Invalid username or password')) {
      errorStatus = LoginStatus.invalidCredentials;
    } else if (errorMessage.contains('Cannot connect') ||
        errorMessage.contains('did not respond')) {
      errorStatus = LoginStatus.networkError;
    } else if (errorMessage.contains('Server error:')) {
      errorStatus = LoginStatus.serverError;
    } else {
      errorStatus = LoginStatus.unknownError;
    }

    notifyListeners();
    return LoginResult(status: errorStatus, message: _lastErrorMessage);
  }
}
