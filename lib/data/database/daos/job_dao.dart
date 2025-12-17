// lib/data/database/daos/job_dao.dart
import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/job_table.dart';

part 'job_dao.g.dart';

@DriftAccessor(tables: [Jobs])
class JobDao extends DatabaseAccessor<AppDatabase> with _$JobDaoMixin {
  JobDao(AppDatabase db) : super(db);

  // Inserts a new job record.
  Future<int> insertJob(JobsCompanion entry) => into(jobs).insert(entry);

  // Updates an existing job record.
  Future<bool> updateJob(DbJob entry) => update(jobs).replace(entry);

  // Deletes a specific job record.
  Future<int> deleteJob(DbJob entry) => delete(jobs).delete(entry);

  /// NEW: Gets the latest lastSync timestamp from the jobs table.
  Future<String?> getLastSync() async {
    final result = await customSelect(
      'SELECT MAX(lastSync) FROM jobs',
    ).getSingleOrNull();
    return result?.data.values.first?.toString();
  }

  // NEW: Watches a stream of all job records.
  Stream<List<DbJob>> watchAllJobs() {
    return select(jobs).watch();
  }

  // NEW: Gets a single job record by its jobId.
  Future<DbJob?> getJobById(String jobId) {
    return (select(
      jobs,
    )..where((tbl) => tbl.jobId.equals(jobId))).getSingleOrNull();
  }

  // NEW: Deletes all job records.
  Future<int> deleteAllJobs() {
    return delete(jobs).go();
  }

  // NEW: Deletes ONLY synced jobs (isManual = false)
  Future<int> deleteSyncedJobs() {
    return (delete(jobs)..where((tbl) => tbl.isManual.equals(false))).go();
  }

  // NEW: Inserts multiple job records in a single batch.
  Future<void> insertAllJobs(List<JobsCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(jobs, entries);
    });
  }

  // ใช้งานตอน Sync: รับ List<DbJob> แล้วแปลงเป็น Companion เพื่อ Insert
  Future<void> batchInsertJobs(List<DbJob> jobList) {
    final companions = jobList.map((job) {
      return JobsCompanion(
        jobId: Value(job.jobId),
        jobName: Value(job.jobName),
        machineName: Value(job.machineName),
        documentId: Value(job.documentId),
        location: Value(job.location),
        jobStatus: Value(job.jobStatus),
        createDate: Value(job.createDate),
        createBy: Value(job.createBy),
        // uid จะ auto-increment เอง
      );
    }).toList();

    return batch((batch) {
      batch.insertAll(jobs, companions, mode: InsertMode.insert);
    });
  }

  // ฟังก์ชันสำหรับแสดงผลในหน้าจอ พร้อมค้นหา (Search) และ Filter (Manual/All)
  Stream<List<DbJob>> watchJobs({String? query, bool? isManual}) {
    // เริ่มต้น Query Table
    var stmt = select(jobs);

    // Filter by isManual if provided
    if (isManual != null) {
      stmt = stmt..where((tbl) => tbl.isManual.equals(isManual));
    }

    // Filter by Search Query
    if (query != null && query.isNotEmpty) {
      stmt = stmt
        ..where(
          (tbl) => tbl.jobName.contains(query) | tbl.jobId.contains(query),
        );
    }

    // Order by createDate descending (optional but good for UI)
    stmt = stmt
      ..orderBy([
        (t) => OrderingTerm(expression: t.createDate, mode: OrderingMode.desc),
      ]);

    return stmt.watch();
  }

  // NEW: Fetch unsynced manual jobs
  Future<List<DbJob>> getUnsyncedManualJobs({int limit = 10}) {
    return (select(jobs)
          ..where(
            (tbl) => tbl.isManual.equals(true) & tbl.isSynced.equals(false),
          )
          ..limit(limit))
        .get();
  }

  // NEW: Mark a job as synced
  Future<void> markJobAsSynced(String jobId) {
    return (update(jobs)..where((tbl) => tbl.jobId.equals(jobId))).write(
      const JobsCompanion(isSynced: Value(true)),
    );
  }
}
