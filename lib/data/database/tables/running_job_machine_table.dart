import 'package:drift/drift.dart';

@DataClassName('DbRunningJobMachine')
class RunningJobMachines extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // PK หลัก (GUID)
  TextColumn get recId => text().named('recID').unique()();

  // เชื่อมกับ Running Job (Document)
  TextColumn get documentId => text().named('documentId').nullable()();

  TextColumn get machineNo => text().named('MachineNo').nullable()();
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
