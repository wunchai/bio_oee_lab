// lib/data/database/tables/job_table.dart
import 'package:drift/drift.dart';

// This annotation tells drift to create a class named DbJob
// for this table, similar to your Kotlin DbJob.kt
@DataClassName('DbJob')
class Jobs extends Table {
  // @PrimaryKey(autoGenerate = true) var uid = 0
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // @ColumnInfo(name = "jobId") var jobId: String? = null
  TextColumn get jobId => text().named('jobId').nullable()();

  // @ColumnInfo(name = "JobName") var jobName: String? = null
  TextColumn get jobName => text().named('JobName').nullable()();

  // @ColumnInfo(name = "MachineName") var machineName : String? = null
  TextColumn get machineName => text().named('MachineName').nullable()();

  // @ColumnInfo(name = "DocumentId") var documentId : String? = null
  TextColumn get documentId => text().named('DocumentId').nullable()();

  // @ColumnInfo(name = "Location") var location: String? = null
  TextColumn get location => text().named('Location').nullable()();

  // @ColumnInfo(name = "JobStatus") var jobStatus: Int = 0
  IntColumn get jobStatus =>
      integer().named('JobStatus').withDefault(const Constant(0))();

  // @ColumnInfo(name = "lastSync") var lastSync: String? = null
  TextColumn get lastSync => text()
      .named('lastSync')
      .nullable()(); // Assuming lastSync is stored as ISO 8601 string

  // NEW: Add CreateDate and CreateBy based on API response
  TextColumn get createDate => text().named('CreateDate').nullable()();
  TextColumn get createBy => text().named('CreateBy').nullable()();
  // Primary key definition if not auto-incrementing UID
  // For DbJob, 'jobId' could potentially be a primary key if unique and not null
  // Example: Set<Column> get primaryKey => {jobId};
  TextColumn get updatedAt =>
      text().named('updatedAt').nullable()(); // Stores ISO 8601 string

  // NEW: Flag for manual jobs
  BoolColumn get isManual =>
      boolean().named('IsManual').withDefault(const Constant(false))();

  // NEW: Flag for sync status (True = Synced/FromAPI, False = Pending Upload)
  BoolColumn get isSynced =>
      boolean().named('IsSynced').withDefault(const Constant(true))();

  // NEW: Versioning for sync
  IntColumn get recordVersion =>
      integer().named('RecordVersion').withDefault(const Constant(0))();

  // New columns from API
  IntColumn get oeeJobId => integer().named('OEEJobID').nullable()();
  IntColumn get analysisJobId => integer().named('AnalysisJobID').nullable()();
  TextColumn get sampleNo => text().named('SampleNo').nullable()();
  TextColumn get sampleName => text().named('SampleName').nullable()();
  TextColumn get lotNo => text().named('LOTNO').nullable()();
  IntColumn get setId => integer().named('SetID').nullable()();
  TextColumn get planAnalysisDate =>
      text().named('PlanAnalysisDate').nullable()();
  TextColumn get createUser => text().named('CreateUser').nullable()();
  TextColumn get updateUser => text().named('UpdateUser').nullable()();
  TextColumn get updateDate => text().named('UpdateDate').nullable()();
  IntColumn get recUpdate => integer().named('RecUpdate').nullable()();
  TextColumn get assignmentId => text().named('AssignmentID').nullable()();
}
