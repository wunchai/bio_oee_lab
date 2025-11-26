import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

@DataClassName('DbMachine')
class Machines extends Table {
  // Primary Key (Auto Increment)
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // Machine Data
  TextColumn get machineId => text().named('machineId').nullable()();
  TextColumn get barcodeGuid => text().named('barcodeGuid').nullable()();
  TextColumn get machineNo => text().named('machineNo').nullable()();
  TextColumn get machineName => text().named('machineName').nullable()();
  TextColumn get status => text().named('status').nullable()();

  // Timestamp
  TextColumn get updatedAt => text().named('updatedAt').nullable()();
}
