// lib/main.dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// --- Import Core & Database (ที่เราคัดลอกมา) ---
// (โปรดตรวจสอบว่าชื่อ 'bio_oee_lab' ตรงกับชื่อโปรเจกต์ของคุณ)
import 'package:bio_oee_lab/core/app_theme.dart';
import 'package:bio_oee_lab/core/app_routes.dart';
import 'package:bio_oee_lab/core/app_providers.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

// (เรายังไม่ได้สร้าง LoginRepository, จะ import ในภายหลัง)
// import 'package:bio_oee_lab/data/repositories/login_repository.dart';

// (เรายังไม่ได้คัดลอก BackgroundTasks, จะ import ในภายหลัง)
// import 'package:bio_oee_lab/data/services/background_tasks.dart';

import 'package:workmanager/workmanager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> main() async {
  // ตรวจสอบให้แน่ใจว่า Flutter Engine พร้อมทำงานแล้ว
  WidgetsFlutterBinding.ensureInitialized();

  // (ทางเลือก) ทำให้ System Bar โปร่งใส
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  // --- 1. เริ่มต้นการเชื่อมต่อ Database ---
  // สร้าง Instance ของ AppDatabase (Singleton)
  final appDatabase = await AppDatabase.instance();

  // --- 2. (ยังไม่เริ่มต้น LoginRepository) ---
  // (เราจะทำในขั้นตอนถัดไปเมื่อสร้างหน้า Login)
  // await LoginRepository.initialize(appDatabase);
  // final loginRepository = LoginRepository();
  // await loginRepository.getLoggedInUserFromLocal();
  const bool isLoggedIn = false; // <<< บังคับให้เป็น false เพื่อไปหน้า Login

  // --- 3. โหลด Providers ทั้งหมด ---
  // (appProviders จะดึง database ไปสร้าง dependencies อื่นๆ)
  final providers = await appProviders(appDatabase);

  // --- 4. เริ่มรันแอป ---
  runApp(
    MultiProvider(
      providers: providers, // ใช้ Providers ที่เราเตรียมไว้
      child: MyApp(
        // บังคับให้ไปหน้า '/login' เสมอในตอนนี้
        initialRoute: isLoggedIn ? '/main_wrapper' : '/login',
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bio OEE Lab', // <<< แก้ชื่อแอป
      theme: appTheme(), // ใช้ Theme จาก core
      initialRoute: initialRoute,
      routes: appRoutes(), // ใช้ Routes จาก core
      debugShowCheckedModeBanner: false,
    );
  }
}
