// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_dao.dart';

// ignore_for_file: type=lint
mixin _$CheckInDaoMixin on DatabaseAccessor<AppDatabase> {
  $CheckInActivitiesTable get checkInActivities =>
      attachedDatabase.checkInActivities;
  $CheckInLogsTable get checkInLogs => attachedDatabase.checkInLogs;
  CheckInDaoManager get managers => CheckInDaoManager(this);
}

class CheckInDaoManager {
  final _$CheckInDaoMixin _db;
  CheckInDaoManager(this._db);
  $$CheckInActivitiesTableTableManager get checkInActivities =>
      $$CheckInActivitiesTableTableManager(
        _db.attachedDatabase,
        _db.checkInActivities,
      );
  $$CheckInLogsTableTableManager get checkInLogs =>
      $$CheckInLogsTableTableManager(_db.attachedDatabase, _db.checkInLogs);
}
