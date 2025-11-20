// lib/core/app_providers.dart
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/network/user_api_service.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';
import 'package:bio_oee_lab/data/network/sync_api_service.dart';
import 'package:bio_oee_lab/data/repositories/sync_repository.dart';
import 'package:bio_oee_lab/data/network/job_api_service.dart';
import 'package:bio_oee_lab/data/repositories/job_repository.dart';
import 'package:bio_oee_lab/data/repositories/document_repository.dart';

// ฟังก์ชันนี้จะเตรียม Provider ทั้งหมดที่แอปต้องใช้
Future<List<SingleChildWidget>> appProviders(AppDatabase appDatabase) async {
  // --- 1. สร้าง Services (ที่ Repository ต้องใช้) ---
  // (เราสร้าง Service พวกนี้ไว้ใช้แค่ครั้งเดียว)
  final deviceInfoService = DeviceInfoService();
  final userApiService = UserApiService();
  final syncApiService = SyncApiService();
  final jobApiService = JobApiService();

  // สร้าง Instance ของ Database (เราได้รับมาจาก main.dart)
  final dbProvider = Provider<AppDatabase>.value(value: appDatabase);

  // --- ⚠️ สร้าง Repository Providers (จะทะยอยเปิดใช้) ---

  // สร้าง LoginRepository (ตัวนี้ใช้ ChangeNotifier)
  // มันต้องใช้ UserDao (จาก db), userApiService, และ deviceInfoService
  final loginRepository = LoginRepository(
    userDao: appDatabase.userDao, // <<< ดึง Dao มาจาก Database
    userApiService: userApiService,
    deviceInfoService: deviceInfoService,
  );

  final syncRepository = SyncRepository(
    syncApiService: syncApiService,
    userDao: appDatabase.userDao, // <<< ใช้ UserDao เหมือนกัน
  );

  final jobRepository = JobRepository(
    apiService: jobApiService,
    jobDao: appDatabase.jobDao, // ดึงจาก DB ตัวหลัก
  );

  final documentRepository = DocumentRepository(
    appDatabase: appDatabase, // ส่ง database เข้าไป
  );

  // --- คืนค่า List ของ Providers ทั้งหมด ---
  return [
    // 1. Database Provider
    dbProvider,

    // 2. Service Providers (เผื่อหน้าอื่นอยากใช้ DeviceInfo)
    Provider<DeviceInfoService>.value(value: deviceInfoService),

    // 3. Repository Providers (ที่ใช้ ChangeNotifier)
    ChangeNotifierProvider<LoginRepository>(
      create: (context) => loginRepository,

      // (เพิ่ม Repository อื่นๆ ที่นี่)
    ),

    ChangeNotifierProvider<SyncRepository>(create: (context) => syncRepository),
    ChangeNotifierProvider.value(value: jobRepository),
    Provider<DocumentRepository>.value(value: documentRepository),
  ];
}
