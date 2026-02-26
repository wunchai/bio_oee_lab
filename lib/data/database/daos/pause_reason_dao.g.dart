// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pause_reason_dao.dart';

// ignore_for_file: type=lint
mixin _$PauseReasonDaoMixin on DatabaseAccessor<AppDatabase> {
  $PauseReasonsTable get pauseReasons => attachedDatabase.pauseReasons;
  PauseReasonDaoManager get managers => PauseReasonDaoManager(this);
}

class PauseReasonDaoManager {
  final _$PauseReasonDaoMixin _db;
  PauseReasonDaoManager(this._db);
  $$PauseReasonsTableTableManager get pauseReasons =>
      $$PauseReasonsTableTableManager(_db.attachedDatabase, _db.pauseReasons);
}
