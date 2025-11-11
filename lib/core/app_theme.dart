// lib/core/app_theme.dart
import 'package:flutter/material.dart';
import 'app_config.dart'; // <<< ใช้สีที่เรากำหนดไว้

ThemeData appTheme() {
  return ThemeData(
    // ใช้ Material 3
    useMaterial3: true,

    // 1. Color Scheme (โทนสี)
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryThemeBlue, // สีหลัก
      primary: primaryThemeBlue,
      secondary: accentThemeAmber, // สีรอง
      background: scaffoldBackgroundLightGrey, // สีพื้นหลัง
      brightness: Brightness.light, // ธีมสว่าง
    ),

    // 2. AppBar Theme (ธีมของแถบด้านบน)
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryThemeBlue,
      foregroundColor: lightText, // สีของตัวอักษรและไอคอนบน AppBar
      elevation: 4.0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: lightText,
      ),
    ),

    // 3. Text Theme (ธีมของตัวอักษร)
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: darkText),
      headlineMedium: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: darkText),
      headlineSmall: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: darkText),

      titleLarge: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w500, color: darkText),
      titleMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: darkText),
      titleSmall: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: darkText),

      bodyLarge: TextStyle(fontSize: 16.0, color: darkText),
      bodyMedium: TextStyle(fontSize: 14.0, color: darkText),
      bodySmall: TextStyle(fontSize: 12.0, color: Colors.black54),

      labelLarge: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: lightText), // Text on buttons
    ),

    // 4. Button Themes (ธีมปุ่ม)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryThemeBlue, // สีพื้นหลังปุ่ม
        foregroundColor: lightText, // สีตัวอักษรบนปุ่ม
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryThemeBlue, // สีตัวอักษรปุ่ม Text
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    // 5. Input Decoration Theme (ธีมของช่องกรอกข้อมูล)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryThemeBlue, width: 2),
      ),
      labelStyle: const TextStyle(color: darkText),
      floatingLabelStyle: const TextStyle(color: primaryThemeBlue),
    ),

    // 6. Card Theme (ธีมของการ์ด)
    cardTheme: CardThemeData(
      // <<< ✅ แก้ไขตรงนี้
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
