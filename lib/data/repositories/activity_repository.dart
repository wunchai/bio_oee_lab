import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/activity_log_dao.dart';

class ActivityRepository {
  final ActivityLogDao _dao;

  ActivityRepository({required AppDatabase appDatabase})
    : _dao = appDatabase.activityLogDao;

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
      );

      await _dao.updateActivity(updatedEntry);
      if (kDebugMode) print('Ended Activity: $recId');
    } catch (e) {
      rethrow;
    }
  }
}
