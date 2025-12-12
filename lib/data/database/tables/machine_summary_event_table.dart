import 'package:drift/drift.dart';

@DataClassName('DbMachineSummaryEvent')
class MachineSummaryEvents extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // Links to MachineSummary
  TextColumn get machineId => text().named('MachineID')();

  // Fields similar to JobMachineEventLogs
  TextColumn get recId => text().named('RecID')();
  TextColumn get eventType =>
      text().named('EventType').nullable()(); // START, STOP, etc.

  TextColumn get startTime => text().named('StartTime').nullable()();
  TextColumn get endTime => text().named('EndTime').nullable()();
  IntColumn get durationSeconds =>
      integer().named('DurationSeconds').nullable()();

  TextColumn get recordUserId => text().named('RecordUserId').nullable()();
}
