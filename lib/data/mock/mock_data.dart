import 'package:bio_oee_lab/data/database/app_database.dart';

class MockData {
  static final DbJob demoJob1 = DbJob(
    uid: 0,
    jobId: 'DEMO-001',
    jobName: 'Demo Job 1 (Production A)',
    machineName: 'Machine A',
    location: 'Factory 1',
    jobStatus: 1, // Active
    createDate: DateTime.now()
        .subtract(const Duration(days: 1))
        .toIso8601String(),
    createBy: 'Demo User',
    documentId: 'DOC-DEMO-001',
    recordVersion: 0,
    isManual: false,
    isSynced: true,
  );

  static final DbJob demoJob2 = DbJob(
    uid: 0,
    jobId: 'DEMO-002',
    jobName: 'Demo Job 2 (Production B)',
    machineName: 'Machine B',
    location: 'Factory 1',
    jobStatus: 0, // Inactive
    createDate: DateTime.now()
        .subtract(const Duration(days: 2))
        .toIso8601String(),
    createBy: 'Demo User',
    documentId: 'DOC-DEMO-002',
    isManual: false,
    recordVersion: 0,
    isSynced: true,
  );

  static final List<DbJob> jobs = [demoJob1, demoJob2];
}
