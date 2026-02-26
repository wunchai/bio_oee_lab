// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_activity_type_dao.dart';

// ignore_for_file: type=lint
mixin _$HumanActivityTypeDaoMixin on DatabaseAccessor<AppDatabase> {
  $HumanActivityTypesTable get humanActivityTypes =>
      attachedDatabase.humanActivityTypes;
  HumanActivityTypeDaoManager get managers => HumanActivityTypeDaoManager(this);
}

class HumanActivityTypeDaoManager {
  final _$HumanActivityTypeDaoMixin _db;
  HumanActivityTypeDaoManager(this._db);
  $$HumanActivityTypesTableTableManager get humanActivityTypes =>
      $$HumanActivityTypesTableTableManager(
        _db.attachedDatabase,
        _db.humanActivityTypes,
      );
}
