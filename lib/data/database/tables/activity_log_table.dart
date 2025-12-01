import 'package:drift/drift.dart';

@DataClassName('DbActivityLog')
class ActivityLogs extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // PK (GUID)
  TextColumn get recId => text().named('recID').unique()();

  // เครื่องจักร หรือ Station ที่ทำกิจกรรม
  TextColumn get machineNo => text().named('MachineNo').nullable()();

  // ประเภทกิจกรรม: "Setup", "Clean"
  TextColumn get activityType => text().named('ActivityType').nullable()();

  // ผู้ดำเนินการ
  TextColumn get operatorId => text().named('OperatorId').nullable()();

  // เวลา
  TextColumn get startTime => text().named('StartTime').nullable()();
  TextColumn get endTime => text().named('EndTime').nullable()();

  // 1=Running, 2=Completed
  IntColumn get status =>
      integer().named('Status').withDefault(const Constant(1))();

  TextColumn get remark => text().named('Remark').nullable()();

  // Sync
  IntColumn get syncStatus =>
      integer().named('SyncStatus').withDefault(const Constant(0))();
  TextColumn get lastSync => text().named('LastSync').nullable()();

  // Versioning for concurrency control
  IntColumn get recordVersion =>
      integer().named('RecordVersion').withDefault(const Constant(0))();
}
