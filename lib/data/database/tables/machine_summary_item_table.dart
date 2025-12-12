import 'package:drift/drift.dart';

@DataClassName('DbMachineSummaryItem')
class MachineSummaryItems extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // Links to MachineSummary (Though technically independent, it's grouped by machine)
  TextColumn get machineId => text().named('MachineID')();

  // Fields similar to JobMachineItems
  TextColumn get recId => text().named('RecID')();
  TextColumn get jobTestSetRecId =>
      text().named('JobTestSetRecID').nullable()();

  // Display Names (From API)
  TextColumn get testSetName => text().named('TestSetName').nullable()();
  TextColumn get jobName => text().named('JobName').nullable()();

  TextColumn get registerDateTime =>
      text().named('RegisterDateTime').nullable()();
  TextColumn get registerUser => text().named('RegisterUser').nullable()();
  TextColumn get status => text().named('Status').nullable()();
}
