import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/activity_log_dao.dart';

import 'package:bio_oee_lab/data/network/activity_api_service.dart';

class ActivityRepository extends ChangeNotifier {
  final ActivityLogDao _dao;
  final ActivityApiService _apiService;

  ActivityRepository({
    required AppDatabase appDatabase,
    ActivityApiService? apiService,
  }) : _dao = appDatabase.activityLogDao,
       _apiService = apiService ?? ActivityApiService();

  // Stream สำหรับแสดงรายการหน้าจอ
  Stream<List<DbActivityLog>> watchMyActivities(String userId) {
    return _dao.watchActiveActivities(userId);
  }

  // 🟢 เริ่มกิจกรรม (Start)
  Future<void> startActivity({
    required String machineNo,
    required String activityType, // "Setup" หรือ "Clean"
    required String userId,
    String? remark,
  }) async {
    try {
      final now = DateTime.now().toIso8601String();
      final newId = const Uuid().v4();

      final entry = ActivityLogsCompanion(
        recId: drift.Value(newId),
        machineNo: drift.Value(machineNo),
        activityType: drift.Value(activityType),
        operatorId: drift.Value(userId),
        startTime: drift.Value(now),
        status: const drift.Value(1), // 1 = Running
        remark: drift.Value(remark),
        syncStatus: const drift.Value(0),
        recordVersion: const drift.Value(0),
      );

      await _dao.insertActivity(entry);
      if (kDebugMode) print('Started Activity: $activityType on $machineNo');
    } catch (e) {
      if (kDebugMode) print('Error starting activity: $e');
      rethrow;
    }
  }

  // 🔴 จบกิจกรรม (End)
  Future<void> endActivity(String recId) async {
    try {
      final activity = await _dao.getActivityById(recId);
      if (activity == null) throw Exception('Activity not found');

      final now = DateTime.now().toIso8601String();

      final updatedEntry = activity.copyWith(
        endTime: drift.Value(now),
        status: 2, // 2 = Completed
        syncStatus: 0,
        recordVersion: activity.recordVersion + 1,
      );

      await _dao.updateActivity(updatedEntry);
      if (kDebugMode) print('Ended Activity: $recId');
    } catch (e) {
      rethrow;
    }
  }

  // 🔄 Sync Data
  Future<void> syncActivityLogs() async {
    try {
      bool hasMore = true;
      while (hasMore) {
        final unsyncedLogs = await _dao.getUnsyncedActivities(limit: 10);

        if (unsyncedLogs.isEmpty) {
          hasMore = false;
          break;
        }

        // 2. Send to API
        final successRecIds = await _apiService.uploadActivityLogs(
          unsyncedLogs,
        );

        // 3. Update local status
        final now = DateTime.now().toIso8601String();
        for (final recId in successRecIds) {
          await _dao.updateSyncStatus(recId, 1, now);
        }

        // If we fetched less than 10, we are done
        if (unsyncedLogs.length < 10) {
          hasMore = false;
        }
      }

      notifyListeners();
    } catch (e) {
      if (kDebugMode) print('Sync Error: $e');
      rethrow;
    }
  }
}
