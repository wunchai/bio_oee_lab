import 'package:drift/drift.dart';

@DataClassName('DbJobTestItem')
class JobTestItems extends Table {
  IntColumn get uid => integer().autoIncrement()();
  IntColumn get rowId => integer().nullable()();
  IntColumn get oeeJobId => integer().nullable()();
  TextColumn get testItemId => text().nullable()();
  TextColumn get testItemName => text().nullable()();
  TextColumn get createDate => text().nullable()();
}
