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

  /// Seed Activities จาก Master (JobActivity)
  /// ใช้ oeeJobId และ testItemId เพื่อกรองกิจกรรมที่ตรงกัน
  Future<void> seedDefaultActivities(
    String documentId,
    String userId, {
    int? oeeJobId,
    String? testItemId,
    String? testSetRecId,
  }) async {
    // เช็คว่ามีกิจกรรมของ Document และ TestSet นี้หรือยัง
    final existing =
        await (select(humanActivityTypes)..where((tbl) {
              Expression<bool> testSetFilter = tbl.jobTestSetRecId.isNull();
              if (testSetRecId != null) {
                testSetFilter = tbl.jobTestSetRecId.equals(
                  testSetRecId,
                ); // Not fallback to null here, we want exact match for this test set
              }
              return tbl.documentId.equals(documentId) & testSetFilter;
            }))
            .get();

    if (existing.isEmpty) {
      final now = DateTime.now().toIso8601String();
      List<HumanActivityTypesCompanion> newActivities = [];

      // 1. ลองหาจาก Master (JobActivities) ก่อน ถ้ามีข้อมูล
      if (oeeJobId != null && testItemId != null) {
        final masterActivities = await db.jobActivityDao
            .getActivitiesByOeeJobId(oeeJobId);
        final matchedActivities = masterActivities
            .where((a) => a.testItemId == testItemId)
            .toList();

        if (matchedActivities.isNotEmpty) {
          newActivities = matchedActivities.map((a) {
            final code =
                a.activityId?.toString() ??
                'ACT_${DateTime.now().millisecondsSinceEpoch}';
            final name = a.activityName ?? 'Unknown Activity';

            return HumanActivityTypesCompanion.insert(
              documentId: Value(documentId),
              userId: Value(userId),
              activityCode: Value(code),
              activityName: Value(name),
              status: const Value(1),
              recId: Value(code), // ใช้ Code เป็น RecId
              updatedAt: Value(now),
              jobTestSetRecId: Value(testSetRecId), // ผูกกับ TestSet
              lastSync: const Value(null),
              syncStatus: const Value(0),
              recordVersion: const Value(0),
            );
          }).toList();
        }
      }

      if (newActivities.isNotEmpty) {
        await batch((batch) {
          batch.insertAll(humanActivityTypes, newActivities);
        });
      }
    }
  }
}
