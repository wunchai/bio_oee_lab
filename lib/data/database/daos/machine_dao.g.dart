// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_dao.dart';

// ignore_for_file: type=lint
mixin _$MachineDaoMixin on DatabaseAccessor<AppDatabase> {
  $MachinesTable get machines => attachedDatabase.machines;
  MachineDaoManager get managers => MachineDaoManager(this);
}

class MachineDaoManager {
  final _$MachineDaoMixin _db;
  MachineDaoManager(this._db);
  $$MachinesTableTableManager get machines =>
      $$MachinesTableTableManager(_db.attachedDatabase, _db.machines);
}
