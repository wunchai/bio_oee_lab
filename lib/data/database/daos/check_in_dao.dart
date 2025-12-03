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

  Future<bool> updateCheckIn(DbCheckInLog entry) {
    // Increment recordVersion
    final updatedEntry = entry.copyWith(recordVersion: entry.recordVersion + 1);
    return update(checkInLogs).replace(updatedEntry);
  }

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

  // ดึงประวัติการ Check-In ของ User นี้
  Future<List<DbCheckInLog>> getCheckInHistory(String userId) {
    return (select(checkInLogs)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.checkInTime,
              mode: OrderingMode.desc,
            ),
          ]))
        .get();
  }

  // ดึงรายการที่ยังไม่ได้ Sync (syncStatus = 0) และมี recId (Migration support)
  Future<List<DbCheckInLog>> getUnsyncedCheckIns({int limit = 10}) {
    return (select(checkInLogs)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  // อัปเดตสถานะ Sync
  Future<void> updateSyncStatus(
    String recId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(checkInLogs)..where((t) => t.recId.equals(recId))).write(
      CheckInLogsCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }
}
