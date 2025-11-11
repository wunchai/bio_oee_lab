// lib/data/repositories/login_repository.dart
import 'package.flutter/material.dart';

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/user_dao.dart';
import 'package:bio_oee_lab/data/models/logged_in_user.dart';
import 'package:bio_oee_lab/data/models/login_result.dart';
import 'package:bio_oee_lab/data/network/user_api_service.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

// (นี่คือ Repository ที่ใช้ ChangeNotifier เพื่อแจ้งเตือน UI เมื่อสถานะเปลี่ยน)
class LoginRepository with ChangeNotifier {
  // --- 1. Dependencies (ส่วนประกอบที่ต้องใช้) ---
  final UserDao _userDao;
  final UserApiService _userApiService;
  final DeviceInfoService _deviceInfoService;

  // --- 2. State (สถานะปัจจุบัน) ---
  bool _isLoggedIn = false;
  UserData? _loggedInUser;
  String? _token;
  String _lastErrorMessage = '';

  // --- 3. Getters (ช่องทางให้ UI ดึงสถานะไปดู) ---
  bool get isLoggedIn => _isLoggedIn;
  UserData? get loggedInUser => _loggedInUser;
  String? get token => _token;
  String get lastErrorMessage => _lastErrorMessage;
  DeviceInfoService get deviceInfoService =>
      _deviceInfoService; // (เผื่อหน้า UI อยากเรียกใช้)

  // --- 4. Constructor (ตัวสร้าง) ---
  LoginRepository({
    required UserDao userDao,
    required UserApiService userApiService,
    required DeviceInfoService deviceInfoService,
  })  : _userDao = userDao,
        _userApiService = userApiService,
        _deviceInfoService = deviceInfoService {
    // (เมื่อ Repository ถูกสร้าง, ให้ลองโหลด User ที่เคย Login ค้างไว้)
    getLoggedInUserFromLocal();
  }

  // --- 5. Core Functions (ฟังก์ชันหลัก) ---

  /// (A) พยายามดึง User ที่ Login ค้างไว้ ออกจาก Database
  Future<void> getLoggedInUserFromLocal() async {
    try {
      final user = await _userDao.getLoggedInUser(); // (UserDao มาจาก Drift)
      if (user != null) {
        _loggedInUser = user;
        _isLoggedIn = true;
        // (คุณอาจจะต้องเก็บ Token ไว้ใน SecureStorage/SharedPrefs)
        // _token = await _secureStorage.read(key: 'auth_token');
      } else {
        _isLoggedIn = false;
      }
    } catch (e) {
      _isLoggedIn = false;
    }
    notifyListeners(); // (แจ้งเตือน UI ว่าตรวจสอบเสร็จแล้ว)
  }

  /// (B) ฟังก์ชันหลักในการ Login
  Future<LoginResult> login(String username, String password) async {
    _lastErrorMessage = ''; // (ล้าง Error เก่า)

    // 1. ดึง Device ID จาก Service
    final deviceId = _deviceInfoService.getLoginDeviceId();
    if (deviceId == 'unknown' || deviceId == 'error_getting_id') {
      return LoginResult(
          status: LoginStatus.unknownError,
          message: 'Could not get Device ID.');
    }

    // 2. เรียก ApiService (ตัวยิง API)
    final result = await _userApiService.login(username, password, deviceId);

    // 3. ตรวจสอบผลลัพธ์
    if (result.status == LoginStatus.success) {
      // --- 3.1 Login สำเร็จ ---

      // (ขั้นตอนนี้สำคัญ: Server ควรส่งข้อมูล User กลับมา
      // แต่ในโค้ด ApiService ของเรายังไม่ได้ผูกข้อมูลกลับมา
      // เราจะสมมติว่า ApiService ส่ง UserData กลับมาใน result.user)

      // *** ⚠️ สมมติว่า LoginResult ถูกแก้ให้มี UserData ***
      /* final UserData user = result.user; // (สมมติว่ามี)
      final String token = result.token; // (สมมติว่ามี)

      // ล้างข้อมูล User เก่าใน DB
      await _userDao.clearAllUsers(); 
      // บันทึก User ใหม่ลง DB
      await _userDao.insertUser(user.copyWith(isLoggedIn: Value(true)));

      _loggedInUser = user;
      _token = token;
      _isLoggedIn = true;
      */

      // ---
      // ⚠️ เนื่องจากตอนนี้ ApiService เรายังไม่คืนค่า UserData
      // เราจะใช้โค้ดจำลองง่ายๆ ไปก่อน
      // ---
      _isLoggedIn = true;
      _lastErrorMessage = '';

      notifyListeners(); // (แจ้งเตือน UI ว่า Login สำเร็จแล้ว)
      return LoginResult(status: LoginStatus.success);
    } else {
      // --- 3.2 Login ไม่สำเร็จ ---
      _isLoggedIn = false;
      _lastErrorMessage = result.message ?? 'Login failed.';
      notifyListeners(); // (แจ้งเตือน UI)
      return result; // (ส่งผลลัพธ์ที่ล้มเหลวกลับไป)
    }
  }

  /// (C) ฟังก์ชัน Logout
  Future<void> logout() async {
    // 1. ลบ User ออกจาก DB
    if (_loggedInUser != null) {
      await _userDao.clearAllUsers(); // (หรืออัปเดต isLoggedIn = false)
    }

    // 2. เคลียร์สถานะใน Repository
    _loggedInUser = null;
    _token = null;
    _isLoggedIn = false;

    notifyListeners(); // (แจ้งเตือน UI ว่า Logout แล้ว)
  }
}
