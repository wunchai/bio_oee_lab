// lib/core/app_config.dart
import 'package:flutter/material.dart';

// Define your specific theme colors
// (คุณสามารถเปลี่ยนสีธีมหลักของแอปคุณได้ที่นี่)
const Color primaryThemeBlue = Color(0xFF3F51B5); // Indigo
const Color accentThemeAmber = Color(0xFFFFC107); // Amber
const Color scaffoldBackgroundLightGrey = Color(0xFFF5F5F5); // Light Grey
const Color darkText = Color(0xFF212121); // Dark grey for text
const Color lightText = Colors.white; // White for text on dark backgrounds

class AppConfig {
  // --- ⚠️ URL หลักของ API Server ---
  // <<< แก้ไข URL นี้ให้เป็นที่อยู่ Server ของคุณ
  static const String baseUrl = 'http://YOUR_OEE_SERVER_IP_OR_DOMAIN';

  // --- การตั้งค่าอื่นๆ (สามารถเพิ่มได้ในอนาคต) ---

  // ตัวอย่าง: ระยะเวลา timeout สำหรับการเชื่อมต่อ API (เป็นวินาที)
  // static const int connectTimeout = 30;
}
