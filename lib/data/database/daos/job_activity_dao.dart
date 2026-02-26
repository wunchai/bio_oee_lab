import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/job_activity_table.dart';

part 'job_activity_dao.g.dart';

@DriftAccessor(tables: [JobActivities])
class JobActivityDao extends DatabaseAccessor<AppDatabase>
    with _$JobActivityDaoMixin {
  JobActivityDao(super.db);

  Future<List<DbJobActivity>> getAllJobActivities() =>
      select(jobActivities).get();

  Future<List<DbJobActivity>> getActivitiesByOeeJobId(int oeeJobId) {
    return (select(
      jobActivities,
    )..where((tbl) => tbl.oeeJobId.equals(oeeJobId))).get();
  }

  Future<void> insertJobActivities(
    List<JobActivitiesCompanion> activities,
  ) async {
    await batch((batch) {
      // Use insertOrIgnore or insertOrReplace if we have a primary key besides uid,
      // but since we auto-increment uid, we might just insert them or clear first.
      // Usually, sync clears first or uses some ID. We'll provide insertAll for now.
      batch.insertAll(jobActivities, activities);
    });
  }

  Future<void> clearAll() => delete(jobActivities).go();
}
