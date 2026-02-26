// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_job_details_dao.dart';

// ignore_for_file: type=lint
mixin _$RunningJobDetailsDaoMixin on DatabaseAccessor<AppDatabase> {
  $JobTestSetsTable get jobTestSets => attachedDatabase.jobTestSets;
  $RunningJobMachinesTable get runningJobMachines =>
      attachedDatabase.runningJobMachines;
  $JobWorkingTimesTable get jobWorkingTimes => attachedDatabase.jobWorkingTimes;
  $JobMachineEventLogsTable get jobMachineEventLogs =>
      attachedDatabase.jobMachineEventLogs;
  $JobMachineItemsTable get jobMachineItems => attachedDatabase.jobMachineItems;
  $DocumentsTable get documents => attachedDatabase.documents;
  $MachinesTable get machines => attachedDatabase.machines;
  RunningJobDetailsDaoManager get managers => RunningJobDetailsDaoManager(this);
}

class RunningJobDetailsDaoManager {
  final _$RunningJobDetailsDaoMixin _db;
  RunningJobDetailsDaoManager(this._db);
  $$JobTestSetsTableTableManager get jobTestSets =>
      $$JobTestSetsTableTableManager(_db.attachedDatabase, _db.jobTestSets);
  $$RunningJobMachinesTableTableManager get runningJobMachines =>
      $$RunningJobMachinesTableTableManager(
        _db.attachedDatabase,
        _db.runningJobMachines,
      );
  $$JobWorkingTimesTableTableManager get jobWorkingTimes =>
      $$JobWorkingTimesTableTableManager(
        _db.attachedDatabase,
        _db.jobWorkingTimes,
      );
  $$JobMachineEventLogsTableTableManager get jobMachineEventLogs =>
      $$JobMachineEventLogsTableTableManager(
        _db.attachedDatabase,
        _db.jobMachineEventLogs,
      );
  $$JobMachineItemsTableTableManager get jobMachineItems =>
      $$JobMachineItemsTableTableManager(
        _db.attachedDatabase,
        _db.jobMachineItems,
      );
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db.attachedDatabase, _db.documents);
  $$MachinesTableTableManager get machines =>
      $$MachinesTableTableManager(_db.attachedDatabase, _db.machines);
}
