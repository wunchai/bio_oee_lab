import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/check_in_table.dart';

part 'check_in_dao.g.dart';

@DriftAccessor(tables: [CheckInActivities, CheckInLogs])
class CheckInDao extends DatabaseAccessor<AppDatabase> with _$CheckInDaoMixin {
  CheckInDao(AppDatabase db) : super(db);

  // --- Activities ---
  Future<List<DbCheckInActivity>> getActivities() =>
      select(checkInActivities).get();

  Future<void> seedDefaultActivities() async {
    final count = await (select(checkInActivities)).get().then((l) => l.length);
    if (count == 0) {
      await batch((batch) {
        batch.insertAll(checkInActivities, [
          CheckInActivitiesCompanion(
            activityName: const Value('None (Default)'),
          ),
          CheckInActivitiesCompanion(activityName: const Value('Setup')),
          CheckInActivitiesCompanion(activityName: const Value('Monitoring')),
          CheckInActivitiesCompanion(activityName: const Value('Execute')),
        ]);
      });
    }
  }

  // --- Logs ---
  Future<int> insertCheckIn(CheckInLogsCompanion entry) =>
      into(checkInLogs).insert(entry);

  Future<bool> updateCheckIn(DbCheckInLog entry) =>
      update(checkInLogs).replace(entry);

  // หา CheckIn ล่าสุดที่ยังไม่ CheckOut (Status=1) ของ User นี้
  Future<DbCheckInLog?> getCurrentActiveCheckIn(String userId) {
    return (select(checkInLogs)
          ..where((t) => t.userId.equals(userId) & t.status.equals(1))
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.checkInTime,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  // Stream สำหรับแสดงสถานะหน้าจอ Realtime
  Stream<DbCheckInLog?> watchCurrentActiveCheckIn(String userId) {
    return (select(checkInLogs)
          ..where((t) => t.userId.equals(userId) & t.status.equals(1)))
        .watchSingleOrNull();
  }
}
