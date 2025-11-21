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
    return (select(
      jobTestSets,
    )..where((tbl) => tbl.documentId.equals(docId))).watch();
  }

  // --- RunningJobMachine ---
  Future<int> insertMachine(RunningJobMachinesCompanion entry) =>
      into(runningJobMachines).insert(entry);
  Stream<List<DbRunningJobMachine>> watchMachinesByDocId(String docId) {
    return (select(
      runningJobMachines,
    )..where((tbl) => tbl.documentId.equals(docId))).watch();
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
}
