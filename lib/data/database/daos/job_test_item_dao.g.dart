// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_test_item_dao.dart';

// ignore_for_file: type=lint
mixin _$JobTestItemDaoMixin on DatabaseAccessor<AppDatabase> {
  $JobTestItemsTable get jobTestItems => attachedDatabase.jobTestItems;
  JobTestItemDaoManager get managers => JobTestItemDaoManager(this);
}

class JobTestItemDaoManager {
  final _$JobTestItemDaoMixin _db;
  JobTestItemDaoManager(this._db);
  $$JobTestItemsTableTableManager get jobTestItems =>
      $$JobTestItemsTableTableManager(_db.attachedDatabase, _db.jobTestItems);
}
