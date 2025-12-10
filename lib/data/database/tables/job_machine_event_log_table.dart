import 'package:drift/drift.dart';

@DataClassName('DbJobMachineEventLog')
class JobMachineEventLogs extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // PK หลัก (GUID)
  TextColumn get recId => text().named('recID').unique()();

  // เชื่อมกับ RunningJobMachine (recID)
  TextColumn get jobMachineRecId => text().named('JobMachineRef').nullable()();

  // ผู้บันทึกรายการ
  TextColumn get recordUserId => text().named('RecordUserId').nullable()();

  TextColumn get startTime => text().named('StartTime').nullable()();
  TextColumn get endTime => text().named('EndTime').nullable()();

  // Start, Breakdown, etc.
  TextColumn get eventType => text().named('EventType').nullable()();

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
