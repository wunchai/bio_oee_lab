import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/machine_dao.dart';
import 'package:bio_oee_lab/data/network/machine_api_service.dart';

enum MachineSyncStatus { idle, syncing, success, failure }

class MachineRepository with ChangeNotifier {
  final MachineApiService _apiService;
  final MachineDao _machineDao;

  MachineSyncStatus _status = MachineSyncStatus.idle;
  String _syncMessage = '';

  MachineSyncStatus get status => _status;
  String get syncMessage => _syncMessage;

  MachineRepository({
    required MachineApiService apiService,
    required MachineDao machineDao,
  }) : _apiService = apiService,
       _machineDao = machineDao;

  // Watch machines from database
  Stream<List<DbMachine>> watchMachines(String query) {
    return _machineDao.watchMachines(query: query);
  }

  // Sync machines from API
  Future<bool> syncMachines(String userId) async {
    _status = MachineSyncStatus.syncing;
    _syncMessage = 'Starting machine sync...';
    notifyListeners();

    int pageIndex = 1;
    int totalPages = 1;
    int totalRecords = 0;
    const int pageSize = 10;

    try {
      // 1. Fetch first page
      _syncMessage = 'Fetching page 1...';
      notifyListeners();

      final firstPage = await _apiService.getMachines(
        userId,
        pageIndex,
        pageSize: pageSize,
      );
      totalPages = firstPage.totalPages;

      // 2. Delete all existing machines (Full Sync)
      await _machineDao.deleteAllMachines();

      // 3. Insert first page
      if (firstPage.machines.isNotEmpty) {
        await _machineDao.batchInsertMachines(firstPage.machines);
        totalRecords += firstPage.machines.length;
      }

      // 4. Fetch remaining pages
      if (totalPages > 1) {
        for (int i = 2; i <= totalPages; i++) {
          _syncMessage = 'Syncing page $i of $totalPages...';
          notifyListeners();

          if (kDebugMode) {
            print("Syncing machines page $i of $totalPages...");
          }

          final pageData = await _apiService.getMachines(
            userId,
            i,
            pageSize: pageSize,
          );

          if (pageData.machines.isNotEmpty) {
            await _machineDao.batchInsertMachines(pageData.machines);
            totalRecords += pageData.machines.length;
          }
        }
      }

      _status = MachineSyncStatus.success;
      _syncMessage = 'Synced $totalRecords machines successfully.';
      notifyListeners();
      return true;
    } catch (e) {
      _status = MachineSyncStatus.failure;
      _syncMessage =
          'Sync failed: ${e.toString().replaceAll('Exception: ', '')}';
      notifyListeners();
      return false;
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      _status = MachineSyncStatus.idle;
      notifyListeners();
    }
  }
}
