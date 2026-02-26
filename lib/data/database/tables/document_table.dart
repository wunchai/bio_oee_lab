import 'package:drift/drift.dart';

// @Entity(tableName = "document")
@DataClassName('DbDocument')
class Documents extends Table {
  // @PrimaryKey(autoGenerate = true) var uid = 0
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // @ColumnInfo(name = "documentId") var documentId: String? = null
  TextColumn get documentId => text().named('documentId').nullable()();

  // @ColumnInfo(name = "jobId") var jobId: String? = null
  TextColumn get jobId => text().named('jobId').nullable()();

  // @ColumnInfo(name = "documentName") var documentName: String? = null
  TextColumn get documentName => text().named('documentName').nullable()();

  // @ColumnInfo(name = "userId") var userId: String? = null
  TextColumn get userId => text().named('userId').nullable()();

  // @ColumnInfo(name = "createDate") var createDate: String? = null
  TextColumn get createDate => text().named('createDate').nullable()();

  // @ColumnInfo(name = "status") var status: Int = 0
  // 0: Draft, 1: Running, 2: End, 3: Post, 9: Cancel, 10: Delete
  IntColumn get status =>
      integer().named('status').withDefault(const Constant(0))();

  // @ColumnInfo(name = "lastSync") var lastSync: String? = null
  TextColumn get lastSync => text().named('lastSync').nullable()();

  TextColumn get updatedAt => text().named('updatedAt').nullable()();

  // --- ⬇️ NEW COLUMNS (Running Job Features) ⬇️ ---

  // 4. Sync Status: 0 = Pending Sync, 1 = Synced
  IntColumn get syncStatus =>
      integer().named('syncStatus').withDefault(const Constant(0))();

  // 10. Date Fields for detailed tracking
  TextColumn get runningDate => text().named('RunningDate').nullable()();
  TextColumn get endDate => text().named('EndDate').nullable()();
  TextColumn get deleteDate => text().named('DeleteDate').nullable()();
  // Note: ใช้ 'cancelDate' เพื่อความถูกต้องของภาษา แต่ map กับ DB เป็น 'CancleDate' ตามที่คุณอาจจะเคยใช้
  TextColumn get cancelDate => text().named('CancleDate').nullable()();
  TextColumn get postDate => text().named('PostDate').nullable()();

  // --- ⬇️ NEW COLUMNS (Copied from Job) ⬇️ ---
  TextColumn get sampleNo => text().named('SampleNo').nullable()();
  TextColumn get sampleName => text().named('SampleName').nullable()();
  TextColumn get lotNo => text().named('LOTNO').nullable()();
  TextColumn get planAnalysisDate =>
      text().named('PlanAnalysisDate').nullable()();
  TextColumn get assignmentId => text().named('AssignmentID').nullable()();

  // Versioning
  IntColumn get recordVersion =>
      integer().named('RecordVersion').withDefault(const Constant(0))();
}
