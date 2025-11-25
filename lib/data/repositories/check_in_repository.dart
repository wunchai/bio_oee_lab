import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/check_in_dao.dart';

class CheckInRepository {
  final CheckInDao _dao;

  CheckInRepository({required AppDatabase appDatabase})
    : _dao = appDatabase.checkInDao;

  // เตรียมข้อมูล Master Data
  Future<void> initData() async {
    await _dao.seedDefaultActivities();
  }

  Future<List<DbCheckInActivity>> getActivities() => _dao.getActivities();

  // Stream ดูสถานะปัจจุบัน
  Stream<DbCheckInLog?> watchCurrentStatus(String userId) =>
      _dao.watchCurrentActiveCheckIn(userId);

  // 🟢 ฟังก์ชันหลัก: Check-In (พร้อม Auto Check-Out ของเก่า)
  Future<void> checkIn({
    required String locationCode,
    required String userId,
    required String activityName,
    String? remark,
  }) async {
    try {
      final now = DateTime.now().toIso8601String();

      // 1. หาว่ามีอันเก่าค้างอยู่ไหม?
      final activeLog = await _dao.getCurrentActiveCheckIn(userId);

      // 2. ถ้ามี -> Check-Out ออกก่อน (Auto)
      if (activeLog != null) {
        final closedLog = activeLog.copyWith(
          checkOutTime: drift.Value(now),
          status: 2, // 2=Completed
          syncStatus: 0, // รอ Sync การออก
        );
        await _dao.updateCheckIn(closedLog);
        if (kDebugMode) print('Auto Check-Out from: ${activeLog.locationCode}');
      }

      // 3. Check-In อันใหม่
      final newLog = CheckInLogsCompanion(
        locationCode: drift.Value(locationCode),
        userId: drift.Value(userId),
        activityName: drift.Value(activityName),
        remark: drift.Value(remark),
        checkInTime: drift.Value(now),
        status: const drift.Value(1), // 1=Active
        syncStatus: const drift.Value(0),
      );

      await _dao.insertCheckIn(newLog);
      if (kDebugMode) print('Check-In at: $locationCode ($activityName)');
    } catch (e) {
      if (kDebugMode) print('CheckIn Error: $e');
      rethrow;
    }
  }

  // ฟังก์ชัน Manual Check-Out (เผื่อ User อยากกดออกเองโดยไม่สแกนใหม่)
  Future<void> checkOut(String userId) async {
    final now = DateTime.now().toIso8601String();
    final activeLog = await _dao.getCurrentActiveCheckIn(userId);

    if (activeLog != null) {
      final closedLog = activeLog.copyWith(
        checkOutTime: drift.Value(now),
        status: 2,
        syncStatus: 0,
      );
      await _dao.updateCheckIn(closedLog);
    }
  }
}
