import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/check_in_dao.dart';

import 'package:uuid/uuid.dart';
import 'package:bio_oee_lab/data/network/check_in_api_service.dart';

class CheckInRepository {
  final CheckInDao _dao;
  final CheckInApiService _apiService;

  CheckInRepository({
    required AppDatabase appDatabase,
    CheckInApiService? apiService,
  }) : _dao = appDatabase.checkInDao,
       _apiService = apiService ?? CheckInApiService();

  // เตรียมข้อมูล Master Data
  Future<void> initData() async {
    await _dao.seedDefaultActivities();
  }

  Future<List<DbCheckInActivity>> getActivities() => _dao.getActivities();

  // Stream ดูสถานะปัจจุบัน
  Stream<DbCheckInLog?> watchCurrentStatus(String userId) =>
      _dao.watchCurrentActiveCheckIn(userId);

  // ดึงประวัติการ Check-In
  Future<List<DbCheckInLog>> getCheckInHistory(String userId) =>
      _dao.getCheckInHistory(userId);

  // 🟢 ฟังก์ชันหลัก: Check-In (พร้อม Auto Check-Out ของเก่า)
  Future<void> checkIn({
    required String locationCode,
    required String userId,
    required String activityName,
    String? remark,
  }) async {
    try {
      final now = DateTime.now().toIso8601String();
      final newId = const Uuid().v4();

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
        recId: drift.Value(newId),
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

  // 🔄 Sync Data
  Future<void> syncCheckInLogs(String userId, String deviceId) async {
    try {
      bool hasMore = true;
      while (hasMore) {
        final unsyncedLogs = await _dao.getUnsyncedCheckIns(limit: 10);

        if (unsyncedLogs.isEmpty) {
          hasMore = false;
          break;
        }

        // Filter out logs without recId (legacy data support or migration needed)
        // For now, we skip them or we could generate one on the fly.
        // Let's skip for safety.
        final validLogs = unsyncedLogs.where((l) => l.recId != null).toList();

        if (validLogs.isEmpty && unsyncedLogs.isNotEmpty) {
          // If we have unsynced logs but none have RecId, we might get stuck in a loop.
          // We should probably mark them as synced or ignore them.
          // For this implementation, let's assume new data has RecId.
          // To prevent infinite loop, we break if we can't process any.
          break;
        }

        // 2. Send to API
        final List<CheckInSyncResult> results = await _apiService
            .uploadCheckInLogs(validLogs, userId, deviceId);

        // 3. Update local status
        final now = DateTime.now().toIso8601String();
        for (final result in results) {
          if (result.execResult == 1) {
            await _dao.updateSyncStatus(
              result.recId,
              1,
              now,
              result.recordVersion,
            );
          }
        }

        // If we fetched less than 10, we are done
        if (unsyncedLogs.length < 10) {
          hasMore = false;
        }
      }
    } catch (e) {
      if (kDebugMode) print('Sync CheckIn Error: $e');
      rethrow;
    }
  }
}
