import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/job_test_item_table.dart';

part 'job_test_item_dao.g.dart';

@DriftAccessor(tables: [JobTestItems])
class JobTestItemDao extends DatabaseAccessor<AppDatabase>
    with _$JobTestItemDaoMixin {
  JobTestItemDao(AppDatabase db) : super(db);

  Future<void> insertAll(List<JobTestItemsCompanion> items) async {
    await batch((batch) {
      batch.insertAll(jobTestItems, items, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> clearAll() async {
    await delete(jobTestItems).go();
  }

  Future<List<DbJobTestItem>> getAll() => select(jobTestItems).get();
}
