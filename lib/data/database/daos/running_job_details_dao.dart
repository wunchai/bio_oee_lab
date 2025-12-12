import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/job_test_set_table.dart';
import 'package:bio_oee_lab/data/database/tables/running_job_machine_table.dart';
import 'package:bio_oee_lab/data/database/tables/job_working_time_table.dart';
import 'package:bio_oee_lab/data/database/tables/job_machine_event_log_table.dart';
import 'package:bio_oee_lab/data/database/tables/job_machine_item_table.dart';

part 'running_job_details_dao.g.dart';

@DriftAccessor(
  tables: [
    JobTestSets,
    RunningJobMachines,
    JobWorkingTimes,
    JobMachineEventLogs,
    JobMachineItems,
  ],
)
class RunningJobDetailsDao extends DatabaseAccessor<AppDatabase>
    with _$RunningJobDetailsDaoMixin {
  RunningJobDetailsDao(AppDatabase db) : super(db);

  Future<bool> updateWorkingTime(DbJobWorkingTime entry) {
    return update(jobWorkingTimes).replace(entry);
  }

  // --- JobTestSet ---
  Future<int> insertTestSet(JobTestSetsCompanion entry) =>
      into(jobTestSets).insert(entry);
  Stream<List<DbJobTestSet>> watchTestSetsByDocId(String docId) {
    return (select(jobTestSets)..where(
          (tbl) => tbl.documentId.equals(docId) & tbl.status.isNotValue(9),
        ))
        .watch();
  }

  // --- RunningJobMachine ---
  Future<int> insertMachine(RunningJobMachinesCompanion entry) =>
      into(runningJobMachines).insert(entry);
  Stream<List<DbRunningJobMachine>> watchMachinesByDocId(String docId) {
    return (select(runningJobMachines)..where(
          (tbl) => tbl.documentId.equals(docId) & tbl.status.isNotValue(9),
        ))
        .watch();
  }

  // Delete Job Test Set (Soft Delete)
  Future<void> deleteJobTestSet(String recId) {
    return (update(jobTestSets)..where((t) => t.recId.equals(recId))).write(
      JobTestSetsCompanion(
        status: const Value(9),
        syncStatus: const Value(0),
        recordVersion: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  // Delete Running Job Machine (Soft Delete)
  Future<void> deleteRunningJobMachine(String recId) {
    return (update(
      runningJobMachines,
    )..where((t) => t.recId.equals(recId))).write(
      RunningJobMachinesCompanion(
        status: const Value(9),
        syncStatus: const Value(0),
        recordVersion: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  // --- JobWorkingTime (User Logs) ---
  Future<int> insertWorkingTime(JobWorkingTimesCompanion entry) =>
      into(jobWorkingTimes).insert(entry);

  // ดึง Log ล่าสุดของ User ใน Document นี้ (เพื่อดูว่า Start หรือ Pause อยู่)
  Future<DbJobWorkingTime?> getLastUserLog(String docId, String userId) {
    return (select(jobWorkingTimes)
          ..where(
            (tbl) => tbl.documentId.equals(docId) & tbl.userId.equals(userId),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.uid, mode: OrderingMode.desc),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Stream<List<DbJobWorkingTime>> watchUserLogs(String docId) {
    return (select(jobWorkingTimes)
          ..where((tbl) => tbl.documentId.equals(docId))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.startTime, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  // --- JobMachineEventLog ---
  Future<int> insertMachineLog(JobMachineEventLogsCompanion entry) =>
      into(jobMachineEventLogs).insert(entry);

  // --- JobMachineItem ---
  Future<int> insertMachineItem(JobMachineItemsCompanion entry) =>
      into(jobMachineItems).insert(entry);

  // --- Sync Methods ---

  // 1. Working Times
  Future<List<DbJobWorkingTime>> getUnsyncedWorkingTimes({int limit = 10}) {
    return (select(jobWorkingTimes)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  Future<void> updateWorkingTimeSyncStatus(
    String recId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(jobWorkingTimes)..where((t) => t.recId.equals(recId))).write(
      JobWorkingTimesCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }

  // 2. Test Sets
  Future<List<DbJobTestSet>> getUnsyncedTestSets({int limit = 10}) {
    return (select(jobTestSets)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  Future<void> updateTestSetSyncStatus(
    String recId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(jobTestSets)..where((t) => t.recId.equals(recId))).write(
      JobTestSetsCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }

  // 3. Machines
  Future<List<DbRunningJobMachine>> getUnsyncedMachines({int limit = 10}) {
    return (select(runningJobMachines)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  Future<void> updateMachineSyncStatus(
    String recId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(
      runningJobMachines,
    )..where((t) => t.recId.equals(recId))).write(
      RunningJobMachinesCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }

  // 4. Machine Logs
  Future<List<DbJobMachineEventLog>> getUnsyncedMachineLogs({int limit = 10}) {
    return (select(jobMachineEventLogs)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  Future<void> updateMachineLogSyncStatus(
    String recId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(
      jobMachineEventLogs,
    )..where((t) => t.recId.equals(recId))).write(
      JobMachineEventLogsCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }

  // 5. Machine Items
  Future<List<DbJobMachineItem>> getUnsyncedMachineItems({int limit = 10}) {
    return (select(jobMachineItems)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  Future<void> updateMachineItemSyncStatus(
    String recId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(jobMachineItems)..where((t) => t.recId.equals(recId))).write(
      JobMachineItemsCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }

  // --- Watchers for UI ---
  Stream<List<DbJobMachineEventLog>> watchMachineLogs(String machineRecId) {
    return (select(jobMachineEventLogs)
          ..where((t) => t.jobMachineRecId.equals(machineRecId))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.startTime, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  // Find the last open event (endTime is null) for a machine
  Future<DbJobMachineEventLog?> getLastOpenMachineLog(String machineRecId) {
    return (select(jobMachineEventLogs)
          ..where(
            (t) =>
                t.jobMachineRecId.equals(machineRecId) &
                t.endTime.isNull() &
                t.status.equals(1), // Active
          )
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.startTime, mode: OrderingMode.desc),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  // Update a machine Log
  Future<bool> updateMachineLog(DbJobMachineEventLog entry) {
    return update(jobMachineEventLogs).replace(entry);
  }

  Stream<List<DbJobMachineItem>> watchMachineItems(String machineRecId) {
    return (select(jobMachineItems)
          ..where((t) => t.jobMachineRecId.equals(machineRecId))
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.registerDateTime,
              mode: OrderingMode.desc,
            ),
          ]))
        .watch();
  }

  // Delete Machine Log (Soft Delete)
  Future<void> deleteMachineLog(String recId) {
    return (update(
      jobMachineEventLogs,
    )..where((t) => t.recId.equals(recId))).write(
      JobMachineEventLogsCompanion(
        status: const Value(9), // 9 = Deleted
        syncStatus: const Value(0), // Mark for sync
        recordVersion: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }

  // Delete Machine Item (Soft Delete)
  Future<void> deleteMachineItem(String recId) {
    return (update(jobMachineItems)..where((t) => t.recId.equals(recId))).write(
      JobMachineItemsCompanion(
        status: const Value(9), // 9 = Deleted
        syncStatus: const Value(0), // Mark for sync
        recordVersion: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );
  }
}
