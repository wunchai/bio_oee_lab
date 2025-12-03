import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/document_dao.dart';
import 'package:bio_oee_lab/data/database/daos/running_job_details_dao.dart';
import 'package:bio_oee_lab/data/network/job_sync_api_service.dart';

class JobSyncRepository {
  final DocumentDao _documentDao;
  final RunningJobDetailsDao _runningJobDetailsDao;
  final JobSyncApiService _apiService;

  JobSyncRepository({
    required AppDatabase appDatabase,
    required JobSyncApiService apiService,
  }) : _documentDao = appDatabase.documentDao,
       _runningJobDetailsDao = appDatabase.runningJobDetailsDao,
       _apiService = apiService;

  Future<void> syncAllJobData(String userId, String deviceId) async {
    try {
      if (kDebugMode) print('Starting Job Data Sync...');

      // 1. Sync Documents
      await _syncDocuments(userId, deviceId);

      // 2. Sync Working Times
      await _syncWorkingTimes(userId, deviceId);

      // 3. Sync Test Sets
      await _syncTestSets(userId, deviceId);

      // 4. Sync Machines
      await _syncMachines(userId, deviceId);

      // 5. Sync Machine Logs
      await _syncMachineLogs(userId, deviceId);

      // 6. Sync Machine Items
      await _syncMachineItems(userId, deviceId);

      if (kDebugMode) print('Job Data Sync Completed.');
    } catch (e) {
      if (kDebugMode) print('Job Data Sync Error: $e');
      rethrow;
    }
  }

  // --- Helper Methods ---

  Future<void> _syncDocuments(String userId, String deviceId) async {
    bool hasMore = true;
    while (hasMore) {
      final items = await _documentDao.getUnsyncedDocuments(limit: 10);
      if (items.isEmpty) {
        hasMore = false;
        break;
      }

      final results = await _apiService.syncDocuments(items, userId, deviceId);
      final now = DateTime.now().toIso8601String();

      for (final result in results) {
        if (result.execResult == 1) {
          await _documentDao.updateSyncStatus(
            result.recId,
            1,
            now,
            result.recordVersion,
          );
        }
      }

      if (items.length < 10) hasMore = false;
    }
  }

  Future<void> _syncWorkingTimes(String userId, String deviceId) async {
    bool hasMore = true;
    while (hasMore) {
      final items = await _runningJobDetailsDao.getUnsyncedWorkingTimes(
        limit: 10,
      );
      if (items.isEmpty) {
        hasMore = false;
        break;
      }

      final results = await _apiService.syncJobWorkingTimes(
        items,
        userId,
        deviceId,
      );
      final now = DateTime.now().toIso8601String();

      for (final result in results) {
        if (result.execResult == 1) {
          await _runningJobDetailsDao.updateWorkingTimeSyncStatus(
            result.recId,
            1,
            now,
            result.recordVersion,
          );
        }
      }

      if (items.length < 10) hasMore = false;
    }
  }

  Future<void> _syncTestSets(String userId, String deviceId) async {
    bool hasMore = true;
    while (hasMore) {
      final items = await _runningJobDetailsDao.getUnsyncedTestSets(limit: 10);
      if (items.isEmpty) {
        hasMore = false;
        break;
      }

      final results = await _apiService.syncJobTestSets(
        items,
        userId,
        deviceId,
      );
      final now = DateTime.now().toIso8601String();

      for (final result in results) {
        if (result.execResult == 1) {
          await _runningJobDetailsDao.updateTestSetSyncStatus(
            result.recId,
            1,
            now,
            result.recordVersion,
          );
        }
      }

      if (items.length < 10) hasMore = false;
    }
  }

  Future<void> _syncMachines(String userId, String deviceId) async {
    bool hasMore = true;
    while (hasMore) {
      final items = await _runningJobDetailsDao.getUnsyncedMachines(limit: 10);
      if (items.isEmpty) {
        hasMore = false;
        break;
      }

      final results = await _apiService.syncRunningJobMachines(
        items,
        userId,
        deviceId,
      );
      final now = DateTime.now().toIso8601String();

      for (final result in results) {
        if (result.execResult == 1) {
          await _runningJobDetailsDao.updateMachineSyncStatus(
            result.recId,
            1,
            now,
            result.recordVersion,
          );
        }
      }

      if (items.length < 10) hasMore = false;
    }
  }

  Future<void> _syncMachineLogs(String userId, String deviceId) async {
    bool hasMore = true;
    while (hasMore) {
      final items = await _runningJobDetailsDao.getUnsyncedMachineLogs(
        limit: 10,
      );
      if (items.isEmpty) {
        hasMore = false;
        break;
      }

      final results = await _apiService.syncJobMachineEventLogs(
        items,
        userId,
        deviceId,
      );
      final now = DateTime.now().toIso8601String();

      for (final result in results) {
        if (result.execResult == 1) {
          await _runningJobDetailsDao.updateMachineLogSyncStatus(
            result.recId,
            1,
            now,
            result.recordVersion,
          );
        }
      }

      if (items.length < 10) hasMore = false;
    }
  }

  Future<void> _syncMachineItems(String userId, String deviceId) async {
    bool hasMore = true;
    while (hasMore) {
      final items = await _runningJobDetailsDao.getUnsyncedMachineItems(
        limit: 10,
      );
      if (items.isEmpty) {
        hasMore = false;
        break;
      }

      final results = await _apiService.syncJobMachineItems(
        items,
        userId,
        deviceId,
      );
      final now = DateTime.now().toIso8601String();

      for (final result in results) {
        if (result.execResult == 1) {
          await _runningJobDetailsDao.updateMachineItemSyncStatus(
            result.recId,
            1,
            now,
            result.recordVersion,
          );
        }
      }

      if (items.length < 10) hasMore = false;
    }
  }
}
