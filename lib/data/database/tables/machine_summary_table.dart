import 'package:drift/drift.dart';

@DataClassName('DbMachineSummary')
class MachineSummaries extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // Machine Info
  TextColumn get machineId =>
      text().named('MachineID').unique()(); // One summary per machine
  TextColumn get machineName => text().named('MachineName').nullable()();
  TextColumn get status => text().named('Status').nullable()();

  // Current Job Info (Main Job)
  TextColumn get currentJobId => text().named('CurrentJobID').nullable()();
  TextColumn get currentJobName => text().named('CurrentJobName').nullable()();

  // OEE Metrics
  RealColumn get oeePercent =>
      real().named('OEE').withDefault(const Constant(0.0))();
  RealColumn get availability =>
      real().named('Availability').withDefault(const Constant(0.0))();
  RealColumn get performance =>
      real().named('Performance').withDefault(const Constant(0.0))();
  RealColumn get quality =>
      real().named('Quality').withDefault(const Constant(0.0))();

  // Meta
  TextColumn get updatedAt => text().named('UpdatedAt').nullable()();
}
