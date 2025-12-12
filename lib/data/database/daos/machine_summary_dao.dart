import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/machine_summary_table.dart';
import 'package:bio_oee_lab/data/database/tables/machine_summary_item_table.dart';
import 'package:bio_oee_lab/data/database/tables/machine_summary_event_table.dart';

part 'machine_summary_dao.g.dart';

@DriftAccessor(
  tables: [MachineSummaries, MachineSummaryItems, MachineSummaryEvents],
)
class MachineSummaryDao extends DatabaseAccessor<AppDatabase>
    with _$MachineSummaryDaoMixin {
  MachineSummaryDao(super.db);

  // --- Summary (Overview) ---
  Future<DbMachineSummary?> getSummary(String machineId) {
    return (select(
      machineSummaries,
    )..where((t) => t.machineId.equals(machineId))).getSingleOrNull();
  }

  Stream<DbMachineSummary?> watchSummary(String machineId) {
    return (select(
      machineSummaries,
    )..where((t) => t.machineId.equals(machineId))).watchSingleOrNull();
  }

  // --- Items (Test Sets) ---
  Future<List<DbMachineSummaryItem>> getSummaryItems(String machineId) {
    return (select(
      machineSummaryItems,
    )..where((t) => t.machineId.equals(machineId))).get();
  }

  Stream<List<DbMachineSummaryItem>> watchSummaryItems(String machineId) {
    return (select(
      machineSummaryItems,
    )..where((t) => t.machineId.equals(machineId))).watch();
  }

  // --- Events ---
  Future<List<DbMachineSummaryEvent>> getSummaryEvents(String machineId) {
    return (select(
      machineSummaryEvents,
    )..where((t) => t.machineId.equals(machineId))).get();
  }

  Stream<List<DbMachineSummaryEvent>> watchSummaryEvents(String machineId) {
    return (select(
      machineSummaryEvents,
    )..where((t) => t.machineId.equals(machineId))).watch();
  }

  // --- Transactional Insert (One Machine) ---
  Future<void> updateMachineSummary({
    required String machineId,
    required MachineSummariesCompanion summary,
    required List<MachineSummaryItemsCompanion> items,
    required List<MachineSummaryEventsCompanion> events,
  }) async {
    return transaction(() async {
      // 1. Delete old data for this machine
      await (delete(
        machineSummaries,
      )..where((t) => t.machineId.equals(machineId))).go();
      await (delete(
        machineSummaryItems,
      )..where((t) => t.machineId.equals(machineId))).go();
      await (delete(
        machineSummaryEvents,
      )..where((t) => t.machineId.equals(machineId))).go();

      // 2. Insert new data
      await into(machineSummaries).insert(summary);

      if (items.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(machineSummaryItems, items);
        });
      }

      if (events.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(machineSummaryEvents, events);
        });
      }
    });
  }
}
