import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/database/daos/job_dao.dart';
import 'package:bio_oee_lab/data/network/job_api_service.dart';
import 'package:bio_oee_lab/data/database/app_database.dart'; // For DbJob

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
  Stream<List<DbJob>> watchJobs(String query) {
    return _jobDao.watchJobs(query: query);
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

      // 2. ‼️ จุดสำคัญ: ลบข้อมูลเก่าทิ้งทั้งหมดก่อนเขียนใหม่ ‼️
      await _jobDao.deleteAllJobs();

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
}
