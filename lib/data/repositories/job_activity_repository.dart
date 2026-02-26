import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/job_activity_dao.dart';
import 'package:bio_oee_lab/data/network/job_activity_api_service.dart';

class JobActivityRepository with ChangeNotifier {
  final JobActivityApiService _apiService;
  final JobActivityDao _dao;

  JobActivityRepository(this._apiService, this._dao);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  String _syncStatus = '';
  String get syncStatus => _syncStatus;

  Future<void> syncJobActivities(String userId) async {
    if (_isSyncing) return;
    _isSyncing = true;
    _syncStatus = 'Starting sync...';
    notifyListeners();

    try {
      int pageIndex = 1;
      int totalPages = 1;
      const int pageSize = 10; // Setup page size for job activities

      // Clear existing data before full sync (Full Refresh)
      await _dao.clearAll();

      while (pageIndex <= totalPages) {
        _syncStatus = 'Fetching page $pageIndex of $totalPages...';
        notifyListeners();

        final response = await _apiService.getJobActivities(
          userId,
          pageIndex,
          pageSize: pageSize,
        );

        totalPages = response.totalPages;

        if (response.items.isNotEmpty) {
          // Insert
          await _dao.insertJobActivities(response.items);
        }

        pageIndex++;
      }

      _syncStatus = 'Sync completed successfully.';
    } catch (e) {
      _syncStatus = 'Sync failed: $e';
      if (kDebugMode) {
        print(_syncStatus);
      }
      rethrow;
    } finally {
      _isSyncing = false;
      notifyListeners();
    }
  }

  Future<List<DbJobActivity>> getAllActivities() => _dao.getAllJobActivities();
}
