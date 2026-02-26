// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_summary_dao.dart';

// ignore_for_file: type=lint
mixin _$MachineSummaryDaoMixin on DatabaseAccessor<AppDatabase> {
  $MachineSummariesTable get machineSummaries =>
      attachedDatabase.machineSummaries;
  $MachineSummaryItemsTable get machineSummaryItems =>
      attachedDatabase.machineSummaryItems;
  $MachineSummaryEventsTable get machineSummaryEvents =>
      attachedDatabase.machineSummaryEvents;
  MachineSummaryDaoManager get managers => MachineSummaryDaoManager(this);
}

class MachineSummaryDaoManager {
  final _$MachineSummaryDaoMixin _db;
  MachineSummaryDaoManager(this._db);
  $$MachineSummariesTableTableManager get machineSummaries =>
      $$MachineSummariesTableTableManager(
        _db.attachedDatabase,
        _db.machineSummaries,
      );
  $$MachineSummaryItemsTableTableManager get machineSummaryItems =>
      $$MachineSummaryItemsTableTableManager(
        _db.attachedDatabase,
        _db.machineSummaryItems,
      );
  $$MachineSummaryEventsTableTableManager get machineSummaryEvents =>
      $$MachineSummaryEventsTableTableManager(
        _db.attachedDatabase,
        _db.machineSummaryEvents,
      );
}
