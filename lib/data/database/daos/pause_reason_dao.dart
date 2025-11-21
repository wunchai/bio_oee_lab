import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/pause_reason_table.dart';

part 'pause_reason_dao.g.dart';

@DriftAccessor(tables: [PauseReasons])
class PauseReasonDao extends DatabaseAccessor<AppDatabase>
    with _$PauseReasonDaoMixin {
  PauseReasonDao(AppDatabase db) : super(db);

  // ดึงเฉพาะรายการที่ Active มาแสดง
  Future<List<DbPauseReason>> getActiveReasons() {
    return (select(pauseReasons)..where((t) => t.status.equals(1))).get();
  }

  // เพิ่มเหตุผล (เผื่อมีหน้าจอตั้งค่าในอนาคต)
  Future<int> insertReason(PauseReasonsCompanion entry) =>
      into(pauseReasons).insert(entry);

  // 🛠️ Helper: สร้างข้อมูลจำลอง (ถ้าตารางว่าง)
  Future<void> seedDefaultReasons() async {
    final count = await (select(pauseReasons)).get().then((l) => l.length);
    if (count == 0) {
      await batch((batch) {
        batch.insertAll(pauseReasons, [
          PauseReasonsCompanion(
            reasonCode: const Value('01'),
            reasonName: const Value('Lunch (พักเที่ยง)'),
          ),
          PauseReasonsCompanion(
            reasonCode: const Value('02'),
            reasonName: const Value('Break (พักเบรค)'),
          ),
          PauseReasonsCompanion(
            reasonCode: const Value('03'),
            reasonName: const Value('Meeting (ประชุม)'),
          ),
          PauseReasonsCompanion(
            reasonCode: const Value('04'),
            reasonName: const Value('Machine Breakdown (เครื่องเสีย)'),
          ),
          PauseReasonsCompanion(
            reasonCode: const Value('05'),
            reasonName: const Value('Material Shortage (ของหมด)'),
          ),
          PauseReasonsCompanion(
            reasonCode: const Value('99'),
            reasonName: const Value('Other (อื่นๆ)'),
          ),
        ]);
      });
    }
  }
}
