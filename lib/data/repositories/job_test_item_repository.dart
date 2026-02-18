import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/job_test_item_dao.dart';
import 'package:bio_oee_lab/data/network/job_test_item_api_service.dart';

class JobTestItemRepository with ChangeNotifier {
  final JobTestItemApiService _apiService;
  final JobTestItemDao _dao;

  JobTestItemRepository(this._apiService, this._dao);

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;

  String _syncStatus = '';
  String get syncStatus => _syncStatus;

  Future<void> syncJobTestItems(String userId) async {
    if (_isSyncing) return;
    _isSyncing = true;
    _syncStatus = 'Starting sync...';
    notifyListeners();

    try {
      int pageIndex = 1;
      int totalPages = 1;
      const int pageSize = 10; // Assuming larger page size for master data

      // Clear existing data before full sync (Full Refresh)
      await _dao.clearAll(); // <<< Uncommented

      while (pageIndex <= totalPages) {
        _syncStatus = 'Fetching page $pageIndex of $totalPages...';
        notifyListeners();

        final response = await _apiService.getJobTestItems(
          userId,
          pageIndex,
          pageSize: pageSize,
        );

        totalPages = response.totalPages;

        if (response.items.isNotEmpty) {
          // Insert or Replace
          await _dao.insertAll(response.items);
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

  Future<List<DbJobTestItem>> getAllItems() => _dao.getAll();
}
