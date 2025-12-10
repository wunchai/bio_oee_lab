import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart'; // import
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/services/device_info_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoRepository {
  final AppDatabase _db;
  final DeviceInfoService _deviceInfoService;

  InfoRepository({
    required AppDatabase appDatabase,
    required DeviceInfoService deviceInfoService,
  }) : _db = appDatabase,
       _deviceInfoService = deviceInfoService;

  Future<Map<String, String>> getDeviceInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return {
      'deviceId': _deviceInfoService.deviceId,
      'deviceSerial': _deviceInfoService.deviceSerial,
      'deviceName': _deviceInfoService.deviceName,
      'appVersion': '${packageInfo.version} (${packageInfo.buildNumber})',
    };
  }

  Future<Map<String, int>> getUnsyncedCounts() async {
    final activityLogsCount = await (_db.select(
      _db.activityLogs,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    final checkInLogsCount = await (_db.select(
      _db.checkInLogs,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    final jobMachineEventLogsCount = await (_db.select(
      _db.jobMachineEventLogs,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    final jobWorkingTimesCount = await (_db.select(
      _db.jobWorkingTimes,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    final jobTestSetsCount = await (_db.select(
      _db.jobTestSets,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    final runningJobMachinesCount = await (_db.select(
      _db.runningJobMachines,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    final jobMachineItemsCount = await (_db.select(
      _db.jobMachineItems,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    final documentsCount = await (_db.select(
      _db.documents,
    )..where((t) => t.syncStatus.equals(0))).get().then((rows) => rows.length);

    return {
      'Documents': documentsCount,
      'Activity Logs': activityLogsCount,
      'Check-In Logs': checkInLogsCount,
      'Job Working Times': jobWorkingTimesCount,
      'Job Machine Events': jobMachineEventLogsCount,
      'Job Machine Items': jobMachineItemsCount,
      'Running Job Machines': runningJobMachinesCount,
      'Job Test Sets': jobTestSetsCount,
    };
  }

  Future<Map<String, String>> getLastUpdateTimes() async {
    Future<String> getLastUpdate(
      TableInfo table,
      GeneratedColumn<String> col,
    ) async {
      final query = _db.select(table)
        ..orderBy([
          (t) => OrderingTerm(expression: col, mode: OrderingMode.desc),
        ])
        ..limit(1);

      final result = await query.getSingleOrNull();
      if (result != null) {
        // We need to dynamically access the column value.
        // Since we don't have a common interface for the row data that exposes the column easily without reflection or dynamic,
        // and Drift rows are strongly typed.
        // However, we know the column we are querying.
        // A cleaner way in Drift might be to select only that column.

        final queryCol = _db.selectOnly(table)
          ..addColumns([col])
          ..orderBy([OrderingTerm(expression: col, mode: OrderingMode.desc)])
          ..limit(1);

        final row = await queryCol.getSingleOrNull();
        return row?.read(col) ?? '-';
      }
      return '-';
    }

    return {
      'Jobs': await getLastUpdate(_db.jobs, _db.jobs.updatedAt),
      'Documents': await getLastUpdate(_db.documents, _db.documents.updatedAt),
      'Users': await getLastUpdate(_db.users, _db.users.updatedAt),
      'Machines': await getLastUpdate(_db.machines, _db.machines.updatedAt),
    };
  }
}
