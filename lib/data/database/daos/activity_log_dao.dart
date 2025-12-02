import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/activity_log_table.dart';

part 'activity_log_dao.g.dart';

@DriftAccessor(tables: [ActivityLogs])
class ActivityLogDao extends DatabaseAccessor<AppDatabase>
    with _$ActivityLogDaoMixin {
  ActivityLogDao(AppDatabase db) : super(db);

  Future<int> insertActivity(ActivityLogsCompanion entry) =>
      into(activityLogs).insert(entry);

  Future<bool> updateActivity(DbActivityLog entry) {
    // Increment recordVersion
    final updatedEntry = entry.copyWith(recordVersion: entry.recordVersion + 1);
    return update(activityLogs).replace(updatedEntry);
  }

  // ดึงกิจกรรมที่กำลังทำอยู่ (Status=1) ของ User นี้
  Stream<List<DbActivityLog>> watchActiveActivities(String userId) {
    return (select(activityLogs)
          ..where((t) => t.operatorId.equals(userId) & t.status.equals(1))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.startTime, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  // ดึงกิจกรรมตาม Filter
  Stream<List<DbActivityLog>> watchActivities(
    String userId, {
    String? query,
    int? status,
  }) {
    return (select(activityLogs)
          ..where((t) {
            var predicate = t.operatorId.equals(userId);

            if (status != null) {
              predicate &= t.status.equals(status);
            } else {
              // Default behavior: status = 1 (Running)
              predicate &= t.status.equals(1);
            }

            if (query != null && query.isNotEmpty) {
              predicate &=
                  t.machineNo.contains(query) | t.activityType.contains(query);
            }

            return predicate;
          })
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.startTime, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  // ดึงรายการเดียวตาม ID
  Future<DbActivityLog?> getActivityById(String recId) {
    return (select(
      activityLogs,
    )..where((t) => t.recId.equals(recId))).getSingleOrNull();
  }

  // ดึงรายการที่ยังไม่ได้ Sync (syncStatus = 0)
  Future<List<DbActivityLog>> getUnsyncedActivities({int limit = 10}) {
    return (select(activityLogs)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  // อัปเดตสถานะ Sync โดยไม่เพิ่ม recordVersion
  Future<void> updateSyncStatus(
    String recId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(activityLogs)..where((t) => t.recId.equals(recId))).write(
      ActivityLogsCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }
}
