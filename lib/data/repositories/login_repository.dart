// lib/data/repositories/login_repository.dart
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/user_dao.dart';
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
import 'package:bio_oee_lab/data/models/logged_in_user.dart';
import 'package:bio_oee_lab/data/models/login_result.dart';
import 'package:bio_oee_lab/data/network/user_api_service.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

class LoginRepository with ChangeNotifier {
  final UserDao _userDao;
  final UserApiService _userApiService;
  final DeviceInfoService _deviceInfoService;

  bool _isLoggedIn = false;
  DbUser? _loggedInUser;
  String? _token;
  String _lastErrorMessage = '';

  bool get isLoggedIn => _isLoggedIn;
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

  Future<LoginResult> login(String username, String password) async {
    _lastErrorMessage = '';

    final deviceId = _deviceInfoService.getLoginDeviceId();
    if (deviceId == 'unknown' || deviceId == 'error_getting_id') {
      return LoginResult(
        status: LoginStatus.unknownError,
        message: 'Could not get Device ID.',
      );
    }

    final DbUser? localUser = await _userDao.findUserByUserId(username);

    if (localUser == null) {
      return LoginResult(
        status: LoginStatus.userNotFoundOffline,
        message: 'User not found locally. Please press Sync User button.',
      );
    }

    final String? storedPassword = localUser.password;

    if (storedPassword == null) {
      return _performOnlineLogin(
        username: username,
        password: password,
        deviceId: deviceId,
        userToUpdate: localUser,
      );
    }

    return await _performOfflineLogin(
      enteredPassword: password,
      storedPassword: storedPassword,
      user: localUser,
    );
  }

  Future<void> logout() async {
    if (_loggedInUser != null && _loggedInUser!.userId != null) {
      await _userDao.updateUserSessionStatus(_loggedInUser!.userId!, false);
    }

    // 2. TODO: เคลียร์ Token จาก Secure Storage
    // await _secureStorage.delete(key: 'auth_token');

    _loggedInUser = null;
    _token = null;
    _isLoggedIn = false;

    notifyListeners();
  }

  Future<LoginResult> _performOnlineLogin({
    required String username,
    required String password,
    required String deviceId,
    required DbUser userToUpdate,
  }) async {
    try {
      final LoggedInUser loggedInUser = await _userApiService.login(
        username,
        password,
        deviceId,
      );

      final updatedUser = userToUpdate.copyWith(
        password: Value(password),
        userName: Value(loggedInUser.user.userName),
        userCode: Value(loggedInUser.user.userCode),
        position: Value(loggedInUser.user.position),
        status: loggedInUser.user.status,
        isLocalSessionActive: true,
      );

      await _userDao.insertUser(updatedUser);

      _setSuccessState(updatedUser, loggedInUser.token);
      return LoginResult(status: LoginStatus.success);
    } catch (e) {
      return _handleLoginError(e);
    }
  }

  Future<LoginResult> _performOfflineLogin({
    required String enteredPassword,
    required String storedPassword,
    required DbUser user,
  }) async {
    if (enteredPassword == storedPassword) {
      if (user.userId != null) {
        await _userDao.updateUserSessionStatus(user.userId!, true);
      }

      // TODO: โหลด Token ล่าสุดจาก Secure Storage
      _setSuccessState(user, null);
      return LoginResult(status: LoginStatus.success);
    } else {
      return LoginResult(
        status: LoginStatus.invalidCredentials,
        message: 'Invalid Password. (Offline)',
      );
    }
  }

  void _setSuccessState(DbUser user, String? token) {
    _loggedInUser = user;
    _token = token;
    _isLoggedIn = true;
    _lastErrorMessage = '';
    notifyListeners();
  }

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
