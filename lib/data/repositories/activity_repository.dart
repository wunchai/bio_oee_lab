import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/activity_log_dao.dart';

import 'package:bio_oee_lab/data/network/activity_api_service.dart';

class ActivityRepository extends ChangeNotifier {
  final ActivityLogDao _dao;
  final ActivityApiService _apiService;
  final AppDatabase _db; // Added to access other tables

  ActivityRepository({
    required AppDatabase appDatabase,
    ActivityApiService? apiService,
  }) : _dao = appDatabase.activityLogDao,
       _db = appDatabase,
       _apiService = apiService ?? ActivityApiService();

  // Stream สำหรับแสดงรายการหน้าจอ
  Stream<List<ActivityLogWithMachine>> watchMyActivities(
    String userId, {
    String? query,
    int? status,
  }) {
    return _dao.watchActivitiesWithMachine(
      userId,
      query: query,
      status: status,
    );
  }

  // 🟢 เริ่มกิจกรรม (Start)
  Future<void> startActivity({
    required String machineNo,
    required String activityType, // "Setup" หรือ "Clean"
    required String userId,
    String? remark,
  }) async {
    try {
      // 1. Check if this machine already has an active activity (Status = 1)
      final existingActiveActivities = await _dao
          .select(_dao.activityLogs)
          .get()
          .then(
            (list) =>
                list.where((a) => a.machineNo == machineNo && a.status == 1),
          );

      if (existingActiveActivities.isNotEmpty) {
        throw Exception(
          'Machine "$machineNo" is already active. Please finish or delete its current activity before starting a new one.',
        );
      }

      // 2. Check if this machine is already actively running a job (status = 0 in DbRunningJobMachine)
      final existingRunningJobs = await _db.runningJobDetailsDao
          .select(_db.runningJobMachines)
          .get()
          .then(
            (list) =>
                list.where((m) => m.machineNo == machineNo && m.status == 0),
          );

      if (existingRunningJobs.isNotEmpty) {
        throw Exception(
          'Machine "$machineNo" is already running a job. Please add an "Event End" in the Machine Dashboard or delete the draft before starting a setup/clean activity.',
        );
      }

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

  // 🟢 เริ่มกิจกรรมแบบกำหนดเวลา (Auto Finish)
  Future<void> startActivityWithTime({
    required String machineNo,
    required String activityType, // "Clean"
    required String userId,
    required String startTime,
    required String endTime,
    String? remark,
  }) async {
    try {
      final newId = const Uuid().v4();

      final entry = ActivityLogsCompanion(
        recId: drift.Value(newId),
        machineNo: drift.Value(machineNo),
        activityType: drift.Value(activityType),
        operatorId: drift.Value(userId),
        startTime: drift.Value(startTime),
        endTime: drift.Value(endTime),
        status: const drift.Value(2), // 2 = Finished
        remark: drift.Value(remark),
        syncStatus: const drift.Value(0),
        recordVersion: const drift.Value(0),
      );

      await _dao.insertActivity(entry);
      if (kDebugMode)
        print(
          'Auto-Started and Finished Activity: $activityType on $machineNo',
        );
    } catch (e) {
      if (kDebugMode) print('Error in startActivityWithTime: $e');
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

  // 🗑️ ลบกิจกรรม (Soft Delete)
  Future<void> deleteActivity(String recId) async {
    try {
      final activity = await _dao.getActivityById(recId);
      if (activity == null) throw Exception('Activity not found');

      final updatedEntry = activity.copyWith(
        status: 3, // 3 = Deleted
        syncStatus: 0,
        recordVersion: activity.recordVersion + 1,
      );

      await _dao.updateActivity(updatedEntry);
      if (kDebugMode) print('Deleted Activity: $recId');
    } catch (e) {
      rethrow;
    }
  }

  // 🔄 Sync Data
  Future<void> syncActivityLogs(String userId, String deviceId) async {
    try {
      bool hasMore = true;
      while (hasMore) {
        final unsyncedLogs = await _dao.getUnsyncedActivities(limit: 10);

        if (unsyncedLogs.isEmpty) {
          hasMore = false;
          break;
        }

        // 2. Send to API
        final List<ActivitySyncResult> results = await _apiService
            .uploadActivityLogs(unsyncedLogs, userId, deviceId);

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

      notifyListeners();
    } catch (e) {
      if (kDebugMode) print('Sync Error: $e');
      rethrow;
    }
  }
}
