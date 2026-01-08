import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/human_activity_type_table.dart';

part 'human_activity_type_dao.g.dart';

@DriftAccessor(tables: [HumanActivityTypes])
class HumanActivityTypeDao extends DatabaseAccessor<AppDatabase>
    with _$HumanActivityTypeDaoMixin {
  HumanActivityTypeDao(super.db);

  /// ดึงรายการกิจกรรมทั้งหมดที่ Active ของ Document นั้นๆ (Status = 1)
  /// เรียงตาม activityName
  /// ดึงรายการกิจกรรมทั้งหมดที่ Active ของ Document นั้นๆ (Status = 1)
  /// และ Optional: กรองตาม TestSet (ถ้ามี) หรือเอาที่มีค่า Null (Global)
  Future<List<DbHumanActivityType>> getActiveActivities(
    String documentId, {
    String? testSetRecId,
  }) {
    return (select(humanActivityTypes)
          ..where((tbl) {
            final docFilter =
                tbl.status.equals(1) & tbl.documentId.equals(documentId);

            // Logic: (testSetRecId == target OR testSetRecId IS NULL)
            // Fix: Check for null before using .equals
            Expression<bool> testSetFilter = tbl.jobTestSetRecId.isNull();
            if (testSetRecId != null) {
              testSetFilter =
                  tbl.jobTestSetRecId.equals(testSetRecId) | testSetFilter;
            }

            return docFilter & testSetFilter;
          })
          ..orderBy([(t) => OrderingTerm(expression: t.activityName)]))
        .get();
  }

  /// Stream Version: ดึงรายการกิจกรรมทั้งหมดที่ Active
  Stream<List<DbHumanActivityType>> watchActiveActivities(String documentId) {
    return (select(humanActivityTypes)
          ..where(
            (tbl) => tbl.status.equals(1) & tbl.documentId.equals(documentId),
          )
          ..orderBy([(t) => OrderingTerm(expression: t.activityName)]))
        .watch();
  }

  /// เพิ่มกิจกรรมใหม่
  Future<int> insertActivity(HumanActivityTypesCompanion entry) {
    return into(humanActivityTypes).insert(entry);
  }

  /// Seed Default Activities สำหรับ Document นี้ (ถ้ายังไม่มีข้อมูล)
  Future<void> seedDefaultActivities(String documentId, String userId) async {
    // เช็คว่ามีกิจกรรมของ Document นี้หรือยัง
    final existing = await (select(
      humanActivityTypes,
    )..where((tbl) => tbl.documentId.equals(documentId))).get();

    if (existing.isEmpty) {
      final now = DateTime.now().toIso8601String();
      final defaults = [
        _createDefault(documentId, userId, 'WORK', 'Work', now),
        _createDefault(documentId, userId, 'ASSEMBLY', 'Assembly', now),
        _createDefault(documentId, userId, 'INSPECTION', 'Inspection', now),
        _createDefault(
          documentId,
          userId,
          'MATERIAL',
          'Material Handling',
          now,
        ),
        _createDefault(documentId, userId, 'CLEANING', 'Cleaning', now),
        _createDefault(documentId, userId, 'OTHER', 'Other', now),
      ];

      await batch((batch) {
        batch.insertAll(humanActivityTypes, defaults);
      });
    }
  }

  HumanActivityTypesCompanion _createDefault(
    String docId,
    String uId,
    String code,
    String name,
    String now,
  ) {
    return HumanActivityTypesCompanion.insert(
      documentId: Value(docId),
      userId: Value(uId),
      activityCode: Value(code),
      activityName: Value(name),
      status: const Value(1),
      recId: Value(code), // ใช้ Code เป็น RecId ชั่วคราวสำหรับ Default
      updatedAt: Value(now),
      lastSync: const Value(null),
      syncStatus: const Value(0),
      recordVersion: const Value(0),
    );
  }
}
