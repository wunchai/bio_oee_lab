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

  Future<bool> updateActivity(DbActivityLog entry) =>
      update(activityLogs).replace(entry);

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

  // ดึงรายการเดียวตาม ID
  Future<DbActivityLog?> getActivityById(String recId) {
    return (select(
      activityLogs,
    )..where((t) => t.recId.equals(recId))).getSingleOrNull();
  }
}
