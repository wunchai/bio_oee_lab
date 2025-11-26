import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/machine_table.dart';

part 'machine_dao.g.dart';

@DriftAccessor(tables: [Machines])
class MachineDao extends DatabaseAccessor<AppDatabase> with _$MachineDaoMixin {
  MachineDao(AppDatabase db) : super(db);

  // Insert a single machine
  Future<int> insertMachine(MachinesCompanion entry) =>
      into(machines).insert(entry);

  // Batch insert machines (Transaction)
  Future<void> batchInsertMachines(List<DbMachine> machineList) async {
    await batch((batch) {
      batch.insertAll(
        machines,
        machineList.map((m) {
          return MachinesCompanion(
            machineId: Value(m.machineId),
            barcodeGuid: Value(m.barcodeGuid),
            machineNo: Value(m.machineNo),
            machineName: Value(m.machineName),
            status: Value(m.status),
            updatedAt: Value(DateTime.now().toIso8601String()),
          );
        }).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  // Delete all machines
  Future<int> deleteAllMachines() => delete(machines).go();

  // Watch all machines (with optional search query)
  Stream<List<DbMachine>> watchMachines({String? query}) {
    if (query != null && query.isNotEmpty) {
      return (select(machines)..where(
            (tbl) =>
                tbl.machineName.contains(query) | tbl.machineNo.contains(query),
          ))
          .watch();
    }
    return select(machines).watch();
  }
}
