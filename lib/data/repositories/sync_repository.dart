// lib/data/repositories/sync_repository.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/user_dao.dart';
import 'package:bio_oee_lab/data/database/daos/sync_log_dao.dart';
import 'package:bio_oee_lab/data/network/sync_api_service.dart';
import 'package:bio_oee_lab/data/repositories/job_repository.dart';
import 'package:bio_oee_lab/data/repositories/machine_repository.dart';
import 'package:bio_oee_lab/data/repositories/job_sync_repository.dart';
import 'package:bio_oee_lab/data/repositories/job_test_item_repository.dart'; // <<< NEW
import 'package:bio_oee_lab/data/models/user_sync_page.dart';

enum SyncStatus { idle, syncing, success, failure }

class SyncRepository with ChangeNotifier {
  final SyncApiService _syncApiService;
  final UserDao _userDao;
  final SyncLogDao _syncLogDao;
  final JobRepository _jobRepository;
  final MachineRepository _machineRepository;
  final JobSyncRepository _jobSyncRepository;

  SyncStatus _syncStatus = SyncStatus.idle;
  String _lastSyncMessage = '';
  int _totalUserCount = 0;

  SyncStatus get syncStatus => _syncStatus;
  String get lastSyncMessage => _lastSyncMessage;

  SyncRepository({
    required SyncApiService syncApiService,
    required UserDao userDao,
    required SyncLogDao syncLogDao,
    required JobRepository jobRepository,
    required MachineRepository machineRepository,
    required JobSyncRepository jobSyncRepository,
    required JobTestItemRepository jobTestItemRepository, // <<< NEW
  }) : _syncApiService = syncApiService,
       _userDao = userDao,
       _syncLogDao = syncLogDao,
       _jobRepository = jobRepository,
       _machineRepository = machineRepository,
       _jobSyncRepository = jobSyncRepository,
       _jobTestItemRepository = jobTestItemRepository; // <<< NEW

  final JobTestItemRepository _jobTestItemRepository;

  // --- Utility: Log to DB ---
  Future<void> _log(String type, int status, String message) async {
    final now = DateTime.now().toIso8601String();
    await _syncLogDao.insertLog(
      SyncLogsCompanion(
        syncType: Value(type),
        status: Value(status),
        message: Value(message),
        timestamp: Value(now),
      ),
    );
  }

  Stream<List<DbSyncLog>> watchRecentLogs() {
    return _syncLogDao.watchRecentLogs();
  }

  // --- 1. Sync Master Data (Download) ---
  Future<bool> syncMasterData(String userId) async {
    _syncStatus = SyncStatus.syncing;
    _lastSyncMessage = 'Syncing Master Data...';
    notifyListeners();
    await _log('Master', 0, 'Started Sync Master Data');

    try {
      // 1. Jobs
      _lastSyncMessage = 'Syncing Jobs...';
      notifyListeners();
      final jobsOk = await _jobRepository.syncJobs(userId);
      if (!jobsOk) throw Exception('Job Sync Failed');

      // 2. Machines
      _lastSyncMessage = 'Syncing Machines...';
      notifyListeners();
      final machinesOk = await _machineRepository.syncMachines(userId);
      if (!machinesOk) throw Exception('Machine Sync Failed');

      // 3. JobTestItems (NEW)
      _lastSyncMessage = 'Syncing Job Test Items...';
      notifyListeners();
      await _jobTestItemRepository.syncJobTestItems(userId); // Passed userId

      // Note: Users are typically synced on login or admin screen.
      // User requested "except user", so we skip user sync here.

      _syncStatus = SyncStatus.success;
      _lastSyncMessage = 'Master Data Synced Successfully';
      await _log('Master', 1, 'Success: Jobs & Machines synced.');
      notifyListeners();
      return true;
    } catch (e) {
      _syncStatus = SyncStatus.failure;
      _lastSyncMessage = 'Master Sync Failed: $e';
      await _log('Master', 2, 'Error: $e');
      notifyListeners();
      return false;
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      _syncStatus = SyncStatus.idle;
      notifyListeners();
    }
  }

  // --- 1.5 Sync Users (For Login Screen) ---
  Future<bool> syncAllUsers() async {
    _syncStatus = SyncStatus.syncing;
    _totalUserCount = 0; // (เริ่มนับใหม่)
    _lastSyncMessage = 'Preparing to sync...';
    notifyListeners();

    // --- ⬇️⬇️⬇️ FIX 1: กำหนด pageSize ที่นี่ ⬇️⬇️⬇️ ---
    // (ตามที่คุณใช้ทดสอบ)
    const int pageSize = 10;

    try {
      // 1. ดึงหน้าแรก (Page 1)
      _lastSyncMessage = 'Fetching page 1...';
      notifyListeners();

      if (kDebugMode) {
        print("Fetching page 1 : pageSize = $pageSize");
      }

      // --- ⬇️⬇️⬇️ FIX 2: ส่ง pageSize เข้าไป ⬇️⬇️⬇️ ---
      final UserSyncPage firstPage = await _syncApiService.getUsersPage(
        1,
        pageSize: pageSize,
      );

      // 2. ได้จำนวนหน้าทั้งหมด (เราแก้เป็น nullable ?? 0 ไว้แล้ว)
      final int totalPages = firstPage.totalPages ?? 0;
      if (totalPages <= 0) {
        throw Exception('No data found on server (TotalPages = $totalPages).');
      }

      _lastSyncMessage = 'Syncing $totalPages pages...';
      notifyListeners();

      // 3. ล้างข้อมูล User เก่าทั้งหมดใน DB
      await _userDao.clearAllUsers();

      // 4. ประมวลผลหน้าแรก
      List<DbUser> processedFirstPage = _processUserList(firstPage.users);
      await _userDao.batchInsertUsers(processedFirstPage);
      _totalUserCount += processedFirstPage.length;

      // 5. วน Loop ดึงหน้าที่เหลือ (ถ้ามี)
      if (totalPages > 1) {
        for (int i = 2; i <= totalPages; i++) {
          _lastSyncMessage =
              'Syncing page $i of $totalPages... ($_totalUserCount users)';
          notifyListeners();

          // 5.1 ดึงหน้าถัดไป
          // --- ⬇️⬇️⬇️ FIX 3: ส่ง pageSize ใน Loop ด้วย ⬇️⬇️⬇️ ---
          final UserSyncPage page = await _syncApiService.getUsersPage(
            i,
            pageSize: pageSize,
          );

          // 5.2 ประมวลผล (ล้าง Password)
          List<DbUser> processedPage = _processUserList(page.users);

          // 5.3 บันทึกลง DB ทีละชุด
          await _userDao.batchInsertUsers(processedPage);
          _totalUserCount += processedPage.length;
        }
      }

      // 6. สำเร็จ
      _syncStatus = SyncStatus.success;
      _lastSyncMessage =
          'Successfully synced $_totalUserCount users ($totalPages pages).';
      notifyListeners();
      return true;
    } catch (e) {
      // 7. ล้มเหลว
      _syncStatus = SyncStatus.failure;
      _lastSyncMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    } finally {
      // 8. กลับเป็น idle หลังผ่านไป 2 วินาที
      await Future.delayed(const Duration(seconds: 2));
      _syncStatus = SyncStatus.idle;
      notifyListeners();
    }
  }

  // Helper method to process user list (e.g. clear password)
  List<DbUser> _processUserList(List<DbUser> users) {
    return users.map((user) {
      // Example: Clear password if needed, or modify data
      // return user.copyWith(password: '');
      return user;
    }).toList();
  }

  // --- 2. Sync Data (Upload) ---
  Future<bool> syncTransactionalData(String userId, String deviceId) async {
    _syncStatus = SyncStatus.syncing;
    _lastSyncMessage = 'Syncing Transactional Data...';
    notifyListeners();
    await _log('Data', 0, 'Started Sync Data (Upload)');

    try {
      await _jobSyncRepository.syncAllJobData(userId, deviceId);

      _syncStatus = SyncStatus.success;
      _lastSyncMessage = 'Data Uploaded Successfully';
      await _log('Data', 1, 'Success: All data uploaded.');
      notifyListeners();
      return true;
    } catch (e) {
      _syncStatus = SyncStatus.failure;
      _lastSyncMessage = 'Data Upload Failed: $e';
      await _log('Data', 2, 'Error: $e');
      notifyListeners();
      return false;
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      _syncStatus = SyncStatus.idle;
      notifyListeners();
    }
  }
}
