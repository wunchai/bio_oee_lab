import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/database/daos/job_dao.dart';
import 'package:bio_oee_lab/data/network/job_api_service.dart';
import 'package:bio_oee_lab/data/database/app_database.dart'; // For DbJob
import 'package:drift/drift.dart'; // For Value and Companions

enum JobSyncStatus { idle, syncing, success, failure }

class JobRepository with ChangeNotifier {
  final JobApiService _apiService;
  final JobDao _jobDao;

  JobSyncStatus _status = JobSyncStatus.idle;
  String _syncMessage = '';

  JobSyncStatus get status => _status;
  String get syncMessage => _syncMessage;

  JobRepository({required JobApiService apiService, required JobDao jobDao})
    : _apiService = apiService,
      _jobDao = jobDao;

  // ฟังก์ชันดึงงานจาก Database เพื่อแสดงผล
  Stream<List<DbJob>> watchJobs({String query = '', bool? isManual}) {
    return _jobDao.watchJobs(query: query, isManual: isManual);
  }

  // --- ฟังก์ชัน Sync หลัก (หัวใจสำคัญ) ---
  Future<bool> syncJobs(String userId) async {
    _status = JobSyncStatus.syncing;
    _syncMessage = 'Starting job sync...';
    notifyListeners();

    int pageIndex = 1;
    int totalPages = 1;
    int totalRecords = 0;
    const int pageSize = 10;

    try {
      // 1. ดึงหน้าแรกก่อน เพื่อดูว่ามีข้อมูลไหม และมีกี่หน้า
      _syncMessage = 'Fetching page 1...';
      notifyListeners();

      final firstPage = await _apiService.getJobs(
        userId,
        pageIndex,
        pageSize: pageSize,
      );
      totalPages = firstPage.totalPages;

      // 1.5 Sync Manual Jobs (Upload)
      // 1.5 Sync Manual Jobs (Upload) - Batched Loop
      while (true) {
        final unsyncedJobs = await _jobDao.getUnsyncedManualJobs(limit: 10);
        if (unsyncedJobs.isEmpty) break;

        _syncMessage = 'Uploading ${unsyncedJobs.length} manual jobs...';
        notifyListeners();

        int uploadedCount = 0;
        for (final job in unsyncedJobs) {
          final success = await _apiService.createJob(job);
          if (success) {
            await _jobDao.markJobAsSynced(job.jobId!);
            uploadedCount++;
          }
        }

        // Safety Break: If we failed to upload ANY jobs in this batch, we might be stuck in a loop if we don't handle retry logic properly.
        // For simple retry: if uploadedCount == 0 && unsyncedJobs.isNotEmpty, we should probably break to avoid infinite loop on persistent failure.
        if (uploadedCount == 0) {
          if (kDebugMode)
            print(
              "Warning: Failed to upload any jobs in batch. Stopping upload loop.",
            );
          break;
        }
      }

      // 2. ‼️ จุดสำคัญ: ลบเฉพาะข้อมูลที่ Sync มา (Manual Job เก็บไว้) ‼️
      await _jobDao.deleteSyncedJobs();

      // 3. บันทึกหน้าแรก
      if (firstPage.jobs.isNotEmpty) {
        await _jobDao.batchInsertJobs(firstPage.jobs);
        totalRecords += firstPage.jobs.length;
      }

      // 4. วนลูปดึงหน้าที่เหลือ (ถ้ามี)
      if (totalPages > 1) {
        for (int i = 2; i <= totalPages; i++) {
          _syncMessage = 'Syncing page $i of $totalPages...';
          notifyListeners();

          if (kDebugMode) {
            print("Syncing page $i of $totalPages...");
          }

          final pageData = await _apiService.getJobs(
            userId,
            i,
            pageSize: pageSize,
          );

          if (pageData.jobs.isNotEmpty) {
            await _jobDao.batchInsertJobs(pageData.jobs);
            totalRecords += pageData.jobs.length;

            if (kDebugMode) {
              print("batchInsertJobs page$i of $totalPages...");
            }
          }
        }
      }

      _status = JobSyncStatus.success;
      _syncMessage = 'Synced $totalRecords jobs successfully.';
      notifyListeners();
      return true;
    } catch (e) {
      _status = JobSyncStatus.failure;
      _syncMessage =
          'Sync failed: ${e.toString().replaceAll('Exception: ', '')}';
      notifyListeners();
      return false;
    } finally {
      // คืนค่าสถานะ Idle หลังจาก 2 วินาที
      await Future.delayed(const Duration(seconds: 2));
      _status = JobSyncStatus.idle;
      notifyListeners();
    }
  }

  // --- ฟังก์ชันสร้างงานแบบ Manual ---
  Future<void> createManualJob(DbJob job) async {
    await _jobDao.insertJob(
      JobsCompanion(
        jobId: Value(job.jobId),
        jobName: Value(job.jobName),
        machineName: Value(job.machineName),
        location: Value(job.location),
        jobStatus: Value(job.jobStatus),
        isManual: Value(true), // Explicitly set as manual
        isSynced: Value(false), // Needs sync
        createDate: Value(DateTime.now().toIso8601String()),
        createBy: Value('Manual'),
      ),
    );
    notifyListeners(); // Refresh list
  }
}
