// lib/core/app_theme.dart
import 'package:flutter/material.dart';
// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
//import 'package:bio_oee_lab/core/app_fonts.dart'; // <<< เราจะสร้างไฟล์นี้ในอนาคต (ตอนนี้ปล่อยไว้ก่อนได้)

// --- ⬇️⬇️⬇️ นี่คือสีเขียว "เมล็ดพันธุ์" (Seed Color) ที่เราจะใช้ ⬇️⬇️⬇️ ---
// (ผมเลือกใช้สีเขียวเข้มที่ดูสุขุม สบายตา)
const Color primaryGreenSeed = Color(0xFF2E7D32); // (Material Green 800)
// --- ⬆️⬆️⬆️ ------------------------------------------- ⬆️⬆️⬆️ ---

ThemeData appTheme() {
  // 1. สร้างชุดสี (Color Scheme) จากสีเมล็ดพันธุ์
  // Flutter (Material 3) จะสร้างชุดสีที่เข้ากันทั้งหมดให้เรา
  // (เช่น primary, onPrimary, secondary, onSecondary, surface, background)
  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: primaryGreenSeed,
    brightness: Brightness.light, // <<< ธีมสว่าง (Light Mode)
  );

  // 2. สร้าง ThemeData หลัก
  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme, // <<< ใช้ชุดสีที่เราสร้าง
    // --- การตั้งค่า AppBar ---
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surfaceContainer, // <<< สีพื้นหลัง AppBar
      foregroundColor: colorScheme.onSurface, // <<< สีตัวอักษร/ไอคอน บน AppBar
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryGreenSeed, // <<< (ตัวเลือก: ทำให้หัวข้อเป็นสีเขียวเข้ม)
      ),
    ),

    // --- การตั้งค่าปุ่ม ---
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary, // <<< สีพื้นหลังปุ่ม (สีเขียว)
        foregroundColor: colorScheme.onPrimary, // <<< สีตัวอักษรบนปุ่ม (สีขาว)
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <<< ทำให้ปุ่มโค้งมน
        ),
      ),
    ),

    // --- การตั้งค่าปุ่ม Outlined ---
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary, // <<< สีขอบและตัวอักษร (สีเขียว)
        side: BorderSide(color: colorScheme.primary, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // --- การตั้งค่าช่องกรอกข้อมูล (Text Fields) ---
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest, // <<< สีพื้นหลังช่องกรอก
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    ),

    // --- การตั้งค่าฟอนต์ (เผื่อไว้ในอนาคต) ---
    // (เราจะใช้ AppFonts.primaryFontFamily เมื่อเราตั้งค่าไฟล์ app_fonts.dart)
    // textTheme: appTextTheme(colorScheme),
    // fontFamily: AppFonts.primaryFontFamily,
  );
}

/*
// ❗️ (เราจะสร้าง 2 ส่วนนี้ในอนาคต ถ้าต้องการใช้ฟอนต์ OpenSans)

// --- ไฟล์: lib/core/app_fonts.dart ---
// class AppFonts {
//   static const String primaryFontFamily = 'OpenSans';
// }

// --- เพิ่มใน app_theme.dart ---
// TextTheme appTextTheme(ColorScheme colorScheme) {
//   return TextTheme(
//     headlineLarge: TextStyle(
//       fontFamily: AppFonts.primaryFontFamily,
//       fontWeight: FontWeight.bold,
//       fontSize: 32,
//       color: colorScheme.onSurface,
//     ),
//     // (ตั้งค่า text styles อื่นๆ ที่นี่)
//   );
// }
*/
