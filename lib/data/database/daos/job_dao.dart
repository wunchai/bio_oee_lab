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
        // NEW columns
        oeeJobId: Value(job.oeeJobId),
        analysisJobId: Value(job.analysisJobId),
        sampleNo: Value(job.sampleNo),
        sampleName: Value(job.sampleName),
        lotNo: Value(job.lotNo),
        setId: Value(job.setId),
        planAnalysisDate: Value(job.planAnalysisDate),
        createUser: Value(job.createUser),
        updateUser: Value(job.updateUser),
        updateDate: Value(job.updateDate),
        recUpdate: Value(job.recUpdate),
        assignmentId: Value(job.assignmentId),
      );
    }).toList();

    return batch((batch) {
      batch.insertAll(jobs, companions, mode: InsertMode.insert);
    });
  }

  // ฟังก์ชันสำหรับแสดงผลในหน้าจอ พร้อมค้นหา (Search) และ Filter
  Stream<List<DbJob>> watchJobs({
    String? query,
    bool? isManual,
    String? filterAssignmentId, // Filter by AssignmentID (exact match)
    String?
    filterRunningByUserId, // Filter jobs that have RUNNING documents for this user
  }) {
    // เริ่มต้น Query Table
    var stmt = select(jobs);

    // 1. Filter by isManual
    if (isManual != null) {
      stmt = stmt..where((tbl) => tbl.isManual.equals(isManual));
    }

    // 2. Filter by AssignmentID
    if (filterAssignmentId != null && filterAssignmentId.isNotEmpty) {
      stmt = stmt..where((tbl) => tbl.assignmentId.equals(filterAssignmentId));
    }

    // 3. Filter by Running Status (Complex Subquery)
    // Show only jobs that have at least one document with status=1 (Running) for this user
    if (filterRunningByUserId != null && filterRunningByUserId.isNotEmpty) {
      stmt = stmt
        ..where(
          (tbl) => existsQuery(
            select(db.documents)..where(
              (doc) =>
                  doc.jobId.equalsExp(tbl.jobId) &
                  doc.userId.equals(filterRunningByUserId) &
                  doc.status.equals(1), // 1 = Running
            ),
          ),
        );
    }

    // 4. Filter by Search Query
    if (query != null && query.isNotEmpty) {
      stmt = stmt
        ..where(
          (tbl) =>
              tbl.jobName.contains(query) |
              tbl.jobId.contains(query) |
              tbl.sampleNo.contains(query) | // Also search by SampleNo
              tbl.lotNo.contains(query), // Also search by LotNo
        );
    }

    // Order by createDate descending
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

  // NEW: Rename Job and reset sync status
  Future<void> updateJobName(String jobId, String newName) async {
    // 1. Get current record version
    final job = await (select(
      jobs,
    )..where((tbl) => tbl.jobId.equals(jobId))).getSingleOrNull();
    final currentVersion = job?.recordVersion ?? 0;

    // 2. Update
    await (update(jobs)..where((tbl) => tbl.jobId.equals(jobId))).write(
      JobsCompanion(
        jobName: Value(newName),
        isSynced: const Value(false),
        recordVersion: Value(currentVersion + 1),
      ),
    );
  }

  // NEW: Delete Job by ID
  Future<int> deleteJobById(String jobId) {
    return (delete(jobs)..where((tbl) => tbl.jobId.equals(jobId))).go();
  }
}
