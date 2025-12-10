// lib/data/database/app_database.dart

import 'package:drift/drift.dart';
//import 'package:bio_oee_lab/data/database/shared.dart'; // สำหรับ connect()
//import 'package:drift/wasm.dart'; // สำหรับ WasmDatabase ใน connectWorker()
// Import the conditional connection.dart with an alias to avoid name conflicts
import 'package:bio_oee_lab/data/database/connection/connection.dart'
    as platform_connection; // <<< เปลี่ยนเป็น platform_connection

// Import all table definitions (should be present from previous steps)
// Import all table definitions (should be present from previous steps)
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
import 'package:bio_oee_lab/data/database/tables/sync_log_table.dart'; // <<< NEW

// Import DAO definitions
import 'package:bio_oee_lab/data/database/daos/job_dao.dart';
import 'package:bio_oee_lab/data/database/daos/document_dao.dart';
import 'package:bio_oee_lab/data/database/daos/user_dao.dart';
import 'package:bio_oee_lab/data/database/daos/running_job_details_dao.dart';
import 'package:bio_oee_lab/data/database/daos/pause_reason_dao.dart';
import 'package:bio_oee_lab/data/database/daos/check_in_dao.dart';
import 'package:bio_oee_lab/data/database/daos/activity_log_dao.dart';
import 'package:bio_oee_lab/data/database/daos/machine_dao.dart';
import 'package:bio_oee_lab/data/database/daos/sync_log_dao.dart'; // <<< NEW

// This line tells drift to generate a file named app_database.g.dart
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
    ActivityLogs,
    Machines,
    SyncLogs, // <<< NEW: Add SyncLogs table
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
    SyncLogDao, // <<< NEW: Add SyncLogDao
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
  int get schemaVersion => 17;

  // Define the migration strategy.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      await _createAllUpdatedAtTriggers(m);
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // Removed DocumentRecords migration
      }
      if (from < 3) {
        // Add 'updatedAt' column to all *newly added* tables or tables that didn't have it before v3
        await m.addColumn(jobs, jobs.updatedAt);
        await m.addColumn(documents, documents.updatedAt);
        await m.addColumn(users, users.updatedAt);

        await _createAllUpdatedAtTriggers(m);
      }
      if (from < 4) {
        // <<< NEW: If upgrading from version 3 to 4
        // Re-create all triggers to include AFTER INSERT
        await _createAllUpdatedAtTriggers(m);
      }
      if (from < 5) {
        // <<< NEW: If upgrading from version 4 to 5
        // Add the new 'isLocalSessionActive' column to Users table
        await m.addColumn(users, users.isLocalSessionActive);
        // Optionally, set a default value for existing rows if needed (e.g., all existing users are active)
        // await m.customStatement('UPDATE users SET isLocalSessionActive = 1;');
      }
      // --- 2. เพิ่ม Logic การ Migration สำหรับเวอร์ชัน 6 ---
      if (from < 6) {
        // เพิ่มคอลัมน์ uiType เข้าไปในตาราง documentMachines
        // await m.addColumn(documentMachines, documentMachines.uiType);
      }
      if (from < 7) {
        // await m.createTable(
        //   checkSheetMasterImages,
        // ); // ใช้ m.createTable สำหรับตารางใหม่
        // await _createUpdatedAtTrigger(
        //   m,
        //   'checksheet_master_images',
        //   'updatedAt',
        // );
      }
      if (from < 8) {
        // await m.addColumn(
        //   checkSheetMasterImages,
        //   checkSheetMasterImages.newImage,
        // );
      }
      if (from < 11) {
        await m.deleteTable(users.actualTableName);
        await m.createTable(users);
        await _createUpdatedAtTrigger(m, 'users', 'updatedAt');
      }
      if (from < 12) {
        await m.deleteTable(users.actualTableName);
        await m.createTable(users);
        await _createUpdatedAtTrigger(m, 'users', 'updatedAt');
      }
      if (from < 14) {
        await m.deleteTable(users.actualTableName);
        await m.createTable(users);
        await _createUpdatedAtTrigger(m, 'users', 'updatedAt');
      }
      if (from < 16) {
        await m.addColumn(activityLogs, activityLogs.recordVersion);
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
    await _createUpdatedAtTrigger(
      m,
      'machines',
      'updatedAt',
    ); // <<< NEW: Add trigger for machines
  }
}
