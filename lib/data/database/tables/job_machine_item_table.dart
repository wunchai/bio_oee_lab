import 'package:drift/drift.dart';

@DataClassName('DbJobMachineItem')
class JobMachineItems extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // PK หลัก (GUID)
  TextColumn get recId => text().named('recID').unique()();

  // เชื่อมกับ Running Job (Document)
  TextColumn get documentId => text().named('documentId').nullable()();

  // เชื่อมกับ JobTestSet (recID) -> ว่าทำ Test Set ไหน
  TextColumn get jobTestSetRecId => text().named('JobTestSetRef').nullable()();

  // ⬇️⬇️⬇️ เพิ่มส่วนนี้ครับ (แก้ตามที่คุณยืนยัน) ⬇️⬇️⬇️
  // เชื่อมกับ RunningJobMachine (recID) -> ว่าใช้เครื่องจักรเครื่องไหน
  TextColumn get jobMachineRecId => text().named('JobMachineRef').nullable()();

  TextColumn get registerDateTime =>
      text().named('registerDateTime').nullable()();
  TextColumn get registerUser => text().named('registerUser').nullable()();

  IntColumn get status =>
      integer().named('status').withDefault(const Constant(0))();
  TextColumn get updatedAt => text().named('updatedAt').nullable()();
  TextColumn get lastSync => text().named('lastSync').nullable()();
  IntColumn get syncStatus =>
      integer().named('syncStatus').withDefault(const Constant(0))();

  // Versioning
  IntColumn get recordVersion =>
      integer().named('RecordVersion').withDefault(const Constant(0))();
}
