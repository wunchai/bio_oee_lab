// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_activity_dao.dart';

// ignore_for_file: type=lint
mixin _$JobActivityDaoMixin on DatabaseAccessor<AppDatabase> {
  $JobActivitiesTable get jobActivities => attachedDatabase.jobActivities;
  JobActivityDaoManager get managers => JobActivityDaoManager(this);
}

class JobActivityDaoManager {
  final _$JobActivityDaoMixin _db;
  JobActivityDaoManager(this._db);
  $$JobActivitiesTableTableManager get jobActivities =>
      $$JobActivitiesTableTableManager(_db.attachedDatabase, _db.jobActivities);
}
