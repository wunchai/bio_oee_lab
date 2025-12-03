import 'package:drift/drift.dart';

@DataClassName('DbJobWorkingTime')
class JobWorkingTimes extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // PK หลักสำหรับเชื่อมโยง (GUID)
  TextColumn get recId => text().named('recID').nullable()();

  // เชื่อมกับ Running Job (Document)
  TextColumn get documentId => text().named('documentId').nullable()();

  TextColumn get userId => text().named('UserId').nullable()();
  TextColumn get activityId =>
      text().named('ActivityID').nullable()(); // 1=Start, 2=Pause, etc.

  TextColumn get startTime => text().named('StartTime').nullable()();
  TextColumn get endTime => text().named('EndTime').nullable()();

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
