// lib/data/database/app_database.dart

import 'package:drift/drift.dart';
//import 'package:bio_oee_lab/data/database/shared.dart'; // สำหรับ connect()
//import 'package:drift/wasm.dart'; // สำหรับ WasmDatabase ใน connectWorker()
// Import the conditional connection.dart with an alias to avoid name conflicts
import 'package:bio_oee_lab/data/database/connection/connection.dart'
    as platform_connection; // <<< เปลี่ยนเป็น platform_connection

// Import all table definitions (should be present from previous steps)
// Table Imports
import 'package:bio_oee_lab/data/database/tables/job_table.dart';
import 'package:bio_oee_lab/data/database/tables/document_table.dart';
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
import 'package:bio_oee_lab/data/database/tables/job_test_set_table.dart';
import 'package:bio_oee_lab/data/database/tables/running_job_machine_table.dart';
import 'package:bio_oee_lab/data/database/tables/job_working_time_table.dart';
import 'package:bio_oee_lab/data/database/tables/job_machine_event_log_table.dart';
import 'package:bio_oee_lab/data/database/tables/job_machine_item_table.dart';
import 'package:bio_oee_lab/data/database/tables/pause_reason_table.dart';
import 'package:bio_oee_lab/data/database/tables/check_in_table.dart';
import 'package:bio_oee_lab/data/database/tables/activity_log_table.dart';
import 'package:bio_oee_lab/data/database/tables/machine_table.dart';
import 'package:bio_oee_lab/data/database/tables/sync_log_table.dart';
import 'package:bio_oee_lab/data/database/tables/machine_summary_table.dart';
import 'package:bio_oee_lab/data/database/tables/machine_summary_item_table.dart';
import 'package:bio_oee_lab/data/database/tables/machine_summary_event_table.dart';

// DAO Imports
import 'package:bio_oee_lab/data/database/daos/job_dao.dart';
import 'package:bio_oee_lab/data/database/daos/document_dao.dart';
import 'package:bio_oee_lab/data/database/daos/user_dao.dart';
import 'package:bio_oee_lab/data/database/daos/running_job_details_dao.dart';
import 'package:bio_oee_lab/data/database/daos/pause_reason_dao.dart';
import 'package:bio_oee_lab/data/database/daos/check_in_dao.dart';
import 'package:bio_oee_lab/data/database/daos/activity_log_dao.dart';
import 'package:bio_oee_lab/data/database/daos/machine_dao.dart';
import 'package:bio_oee_lab/data/database/daos/sync_log_dao.dart';
import 'package:bio_oee_lab/data/database/daos/machine_summary_dao.dart';

import 'tables/human_activity_type_table.dart';
import 'daos/human_activity_type_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Jobs,
    Documents,
    Users,
    JobTestSets,
    RunningJobMachines,
    JobWorkingTimes,
    JobMachineEventLogs,
    JobMachineItems,
    PauseReasons,
    CheckInActivities,
    CheckInLogs,
    ActivityLogs,
    Machines,
    SyncLogs,
    MachineSummaries, // <<< NEW
    MachineSummaryItems, // <<< NEW
    MachineSummaryEvents, // <<< NEW
    HumanActivityTypes,
  ],
  daos: [
    JobDao,
    DocumentDao,
    UserDao,
    RunningJobDetailsDao,
    PauseReasonDao,
    CheckInDao,
    ActivityLogDao,
    MachineDao,
    SyncLogDao,
    MachineSummaryDao, // <<< NEW
    HumanActivityTypeDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase._(DatabaseConnection connection) : super(connection);

  static AppDatabase? _instance;

  static Future<AppDatabase> instance() async {
    _instance ??= AppDatabase._(await platform_connection.connect());
    return _instance!;
  }

  @override
  int get schemaVersion => 23; // <<< Bump to 23

  // Define the migration strategy.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _createAllUpdatedAtTriggers(m);
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // ... (previous migrations)

      if (from < 18) {
        await m.createTable(machineSummaries);
        await m.createTable(machineSummaryItems);
        await m.createTable(machineSummaryEvents);
      }

      if (from < 19) {
        await m.addColumn(jobs, jobs.isManual);
      }

      if (from < 20) {
        await m.addColumn(jobs, jobs.isSynced);
      }

      if (from < 21) {
        await m.addColumn(humanActivityTypes, humanActivityTypes.recId);
        await m.addColumn(humanActivityTypes, humanActivityTypes.documentId);
        await m.addColumn(humanActivityTypes, humanActivityTypes.userId);
        await m.addColumn(humanActivityTypes, humanActivityTypes.updatedAt);
        await m.addColumn(humanActivityTypes, humanActivityTypes.lastSync);
        await m.addColumn(humanActivityTypes, humanActivityTypes.syncStatus);
        await m.addColumn(humanActivityTypes, humanActivityTypes.recordVersion);
        await _createUpdatedAtTrigger(m, 'human_activity_types', 'updatedAt');
      }

      if (from < 22) {
        await m.addColumn(jobs, jobs.recordVersion);
      }

      if (from < 23) {
        await m.addColumn(
          humanActivityTypes,
          humanActivityTypes.jobTestSetRecId,
        );
        await m.addColumn(jobWorkingTimes, jobWorkingTimes.jobTestSetRecId);
      }
    },
  );

  // --- *** จุดที่แก้ไข *** ---
  Future<void> _createUpdatedAtTrigger(
    Migrator m,
    String tableName,
    String columnName,
  ) async {
    // 1. ตรวจสอบชื่อตารางเพื่อเลือก Primary Key ที่ถูกต้อง
    final String primaryKeyColumn = 'uid';

    // 2. สร้าง Trigger สำหรับ AFTER UPDATE
    final triggerName = 'update_${tableName}_${columnName}';
    await m.database.customStatement('''
      CREATE TRIGGER IF NOT EXISTS $triggerName
      AFTER UPDATE ON $tableName
      FOR EACH ROW
      BEGIN
        -- 3. ใช้ primaryKeyColumn ที่เลือกไว้
        UPDATE $tableName SET $columnName = STRFTIME('%Y-%m-%dT%H:%M:%f', 'now') WHERE $primaryKeyColumn = OLD.$primaryKeyColumn;
      END;
      ''');

    // 4. สร้าง Trigger สำหรับ AFTER INSERT
    final insertTriggerName = 'update_${tableName}_${columnName}_on_insert';
    await m.database.customStatement('''
      CREATE TRIGGER IF NOT EXISTS $insertTriggerName
      AFTER INSERT ON $tableName
      FOR EACH ROW
      BEGIN
        -- 5. ใช้ primaryKeyColumn ที่เลือกไว้
        UPDATE $tableName SET $columnName = STRFTIME('%Y-%m-%dT%H:%M:%f', 'now') WHERE $primaryKeyColumn = NEW.$primaryKeyColumn;
      END;
      ''');
  }

  // Helper method to create triggers for all tables
  Future<void> _createAllUpdatedAtTriggers(Migrator m) async {
    await _createUpdatedAtTrigger(m, 'jobs', 'updatedAt');
    await _createUpdatedAtTrigger(m, 'documents', 'updatedAt');
    await _createUpdatedAtTrigger(m, 'users', 'updatedAt');
    await _createUpdatedAtTrigger(m, 'machines', 'updatedAt');
    await _createUpdatedAtTrigger(m, 'human_activity_types', 'updatedAt');
  }
}
