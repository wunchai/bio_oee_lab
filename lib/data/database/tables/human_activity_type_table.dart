import 'package:drift/drift.dart';

@DataClassName('DbHumanActivityType')
class HumanActivityTypes extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // PK หลักสำหรับเชื่อมโยง (GUID)
  TextColumn get recId => text().named('recID').nullable()();

  // เชื่อมกับ Running Job (Document)
  TextColumn get documentId => text().named('documentId').nullable()();

  TextColumn get userId => text().named('UserId').nullable()();

  // รหัสกิจกรรม (ใช้เป็น ID เวลาบันทึกใน JobWorkingTime)
  TextColumn get activityCode => text().named('ActivityCode').nullable()();

  // Test Set Link (New v23)
  TextColumn get jobTestSetRecId =>
      text().named('JobTestSetRecID').nullable()();

  // ชื่อกิจกรรมที่จะแสดงใน Dropdown
  TextColumn get activityName => text().named('ActivityName').nullable()();

  // 1=Active, 0=Inactive
  IntColumn get status =>
      integer().named('Status').withDefault(const Constant(1))();

  // Sync Fields
  TextColumn get updatedAt => text().named('updatedAt').nullable()();
  TextColumn get lastSync => text().named('lastSync').nullable()();
  IntColumn get syncStatus =>
      integer().named('syncStatus').withDefault(const Constant(0))();
  IntColumn get recordVersion =>
      integer().named('RecordVersion').withDefault(const Constant(0))();
}
