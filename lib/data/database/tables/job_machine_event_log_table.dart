import 'package:drift/drift.dart';

@DataClassName('DbJobMachineEventLog')
class JobMachineEventLogs extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // เชื่อมกับ RunningJobMachine (recID)
  TextColumn get jobMachineRecId => text().named('JobMachineRef').nullable()();

  TextColumn get startTime => text().named('StartTime').nullable()();
  TextColumn get endTime => text().named('EndTime').nullable()();

  IntColumn get status =>
      integer().named('status').withDefault(const Constant(0))();
  TextColumn get updatedAt => text().named('updatedAt').nullable()();
  TextColumn get lastSync => text().named('lastSync').nullable()();
  IntColumn get syncStatus =>
      integer().named('syncStatus').withDefault(const Constant(0))();
}
