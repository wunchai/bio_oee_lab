// lib/data/services/device_info_service.dart
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb and kDebugMode
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  final _storage = const FlutterSecureStorage();

  String _deviceId = 'unknown';
  String _deviceSerial = 'unknown';
  String _deviceName = 'unknown';

  // --- Public Getters ---
  String get deviceId => _deviceId;
  String get deviceSerial => _deviceSerial;
  String get deviceName => _deviceName;

  // --- Constructor ---
  // (เราจะเรียกใช้ loadInfo() ทันทีที่ Service นี้ถูกสร้าง)
  DeviceInfoService() {
    loadInfo();
  }

  // --- Main Function ---
  Future<void> loadInfo() async {
    try {
      if (kIsWeb) {
        // --- 1. ถ้าเป็น Web ---
        WebBrowserInfo webInfo = await _deviceInfo.webBrowserInfo;
        _deviceName = webInfo.browserName.name;

        // Use persistent ID for Web
        final persistentId = await _getPersistentId();
        _deviceId = persistentId;
        _deviceSerial = persistentId; // Use UUID as serial for Web
      } else if (Platform.isAndroid) {
        // --- 2. ถ้าเป็น Android ---
        AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        _deviceId = androidInfo.id; // (ใช้ androidId - Persistent)
        _deviceSerial = androidInfo.serialNumber; // (อาจจะต้องขอ permission)
        _deviceName = '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        // --- 3. ถ้าเป็น iOS ---
        IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        _deviceName = '${iosInfo.name} ${iosInfo.model}';

        // Use persistent ID for iOS (Keychain)
        final persistentId = await _getPersistentId();
        _deviceId = persistentId;
        _deviceSerial = persistentId; // Use UUID as serial for iOS
      } else if (Platform.isWindows) {
        // --- 4. ถ้าเป็น Windows ---
        WindowsDeviceInfo windowsInfo = await _deviceInfo.windowsInfo;
        _deviceId = windowsInfo.computerName; // (ใช้ชื่อคอม)
        _deviceSerial = windowsInfo.deviceId; // (ID ของเครื่อง - Persistent)
        _deviceName = 'Windows PC';
      }
    } catch (e) {
      // ถ้า Error ก็ใช้ค่า default 'unknown'
      _deviceId = 'error_getting_id';
      _deviceSerial = 'error';
      _deviceName = 'error';
      if (kDebugMode) print('Error getting device info: $e');
    }
  }

  Future<String> _getPersistentId() async {
    const key = 'device_persistent_uuid';
    try {
      // Try to read from secure storage
      String? value = await _storage.read(key: key);

      if (value == null || value.isEmpty) {
        // If not found, generate new UUID
        value = const Uuid().v4();
        // Save to secure storage
        await _storage.write(key: key, value: value);
      }
      return value;
    } catch (e) {
      if (kDebugMode) print('Error accessing secure storage: $e');
      // Fallback if storage fails
      return const Uuid().v4();
    }
  }

  /// ดึงข้อมูล Device ID/Serial ที่จะใช้ยืนยันตัวตนกับ Server
  /// (แอปต้นแบบใช้ Serial, ถ้าไม่มีใช้ ID)
  String getLoginDeviceId() {
    if (_deviceSerial != 'unknown' &&
        _deviceSerial != 'error' &&
        _deviceSerial.isNotEmpty &&
        _deviceSerial != 'ios' &&
        _deviceSerial != 'web') {
      return _deviceSerial;
    }
    // ถ้า Serial ไม่มี, ให้ใช้ Device ID แทน
    return _deviceId;
  }
}
