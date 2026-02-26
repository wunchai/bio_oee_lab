import 'package:drift/drift.dart';

@DataClassName('DbJobActivity')
class JobActivities extends Table {
  IntColumn get uid => integer().autoIncrement()();
  IntColumn get rowId => integer().nullable()();
  IntColumn get oeeJobId => integer().nullable()();
  TextColumn get testItemId => text().nullable()();
  IntColumn get activityId => integer().nullable()();
  TextColumn get activityName => text().nullable()();
  TextColumn get createDate => text().nullable()();
}
