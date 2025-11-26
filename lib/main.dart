// lib/main.dart
import 'dart:async';

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
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/network/user_api_service.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';

// (เรายังไม่ได้คัดลอก BackgroundTasks, จะ import ในภายหลัง)
// import 'package:bio_oee_lab/data/services/background_tasks.dart';

Future<void> main() async {
  // ตรวจสอบให้แน่ใจว่า Flutter Engine พร้อมทำงานแล้ว
  WidgetsFlutterBinding.ensureInitialized();

  // (ทางเลือก) ทำให้ System Bar โปร่งใส
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );

  // --- 1. เริ่มต้นการเชื่อมต่อ Database ---
  // สร้าง Instance ของ AppDatabase (Singleton)
  final appDatabase = await AppDatabase.instance();

  // --- 2. เริ่มต้น LoginRepository ---
  // สร้าง dependencies ที่จำเป็น
  final userApiService = UserApiService();
  final deviceInfoService = DeviceInfoService();
  // รอให้โหลดข้อมูลเครื่องเสร็จก่อน
  await deviceInfoService.loadInfo();

  final loginRepository = LoginRepository(
    userDao: appDatabase.userDao,
    userApiService: userApiService,
    deviceInfoService: deviceInfoService,
  );

  // ตรวจสอบว่ามี User Login ค้างไว้หรือไม่
  await loginRepository.getLoggedInUserFromLocal();
  final bool isLoggedIn = loginRepository.isLoggedIn;

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
