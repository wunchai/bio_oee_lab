import 'package:drift/drift.dart';

@DataClassName('DbSyncLog')
class SyncLogs extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // 'Master' or 'Data'
  TextColumn get syncType => text().named('SyncType')();

  // 0=Start, 1=Success, 2=Error
  IntColumn get status => integer().named('Status')();

  // Error message or success summary
  TextColumn get message => text().named('Message').nullable()();

  // ISO8601 String
  TextColumn get timestamp => text().named('Timestamp')();
}
