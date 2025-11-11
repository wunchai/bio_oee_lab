// lib/data/services/device_info_service.dart
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // For checking Web

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

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
        _deviceId =
            webInfo.userAgent ?? 'web_user_agent'; // (Web ไม่มี ID ที่แน่นอน)
        _deviceSerial = 'web';
        _deviceName = webInfo.browserName.name;
      } else if (Platform.isAndroid) {
        // --- 2. ถ้าเป็น Android ---
        AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        _deviceId = androidInfo.id; // (ใช้ androidId)
        _deviceSerial = androidInfo.serialNumber; // (อาจจะต้องขอ permission)
        _deviceName = '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        // --- 3. ถ้าเป็น iOS ---
        IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        _deviceId = iosInfo.identifierForVendor ??
            'ios_id_unknown'; // (ID ที่เปลี่ยนได้)
        _deviceSerial = 'ios'; // (iOS ไม่ให้ Serial)
        _deviceName = '${iosInfo.name} ${iosInfo.model}';
      } else if (Platform.isWindows) {
        // --- 4. ถ้าเป็น Windows ---
        WindowsDeviceInfo windowsInfo = await _deviceInfo.windowsInfo;
        _deviceId = windowsInfo.computerName; // (ใช้ชื่อคอม)
        _deviceSerial = windowsInfo.deviceId; // (ID ของเครื่อง)
        _deviceName = 'Windows PC';
      }
    } catch (e) {
      // ถ้า Error ก็ใช้ค่า default 'unknown'
      _deviceId = 'error_getting_id';
      _deviceSerial = 'error';
      _deviceName = 'error';
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
