import 'package:flutter/foundation.dart'; // สำหรับ kDebugMode
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/document_dao.dart';
import 'package:bio_oee_lab/data/database/daos/job_dao.dart'; // Import JobDao
import 'package:bio_oee_lab/data/database/daos/running_job_details_dao.dart';
import 'package:bio_oee_lab/data/database/daos/activity_log_dao.dart';
import 'package:bio_oee_lab/data/database/daos/pause_reason_dao.dart'; // New Import
import 'dart:convert'; // For JSON

/// Repository for managing document data.
class DocumentRepository {
  final DocumentDao _documentDao;
  final RunningJobDetailsDao _runningJobDetailsDao;
  final ActivityLogDao _activityLogDao;
  final PauseReasonDao _pauseReasonDao;
  final JobDao _jobDao;

  DocumentRepository({required AppDatabase appDatabase})
    : _documentDao = appDatabase.documentDao,
      _runningJobDetailsDao = appDatabase.runningJobDetailsDao,
      _activityLogDao = appDatabase.activityLogDao,
      _pauseReasonDao = appDatabase.pauseReasonDao,
      _jobDao = appDatabase.jobDao;

  /// ฟังก์ชัน: เพิ่ม Machine จากการสแกน QR Code หรือ Manual Input
  Future<void> addMachineByQrCode({
    String? documentId,
    required String qrCode,
    required String userId,
  }) async {
    try {
      // 1. เช็คว่ามี Machine นี้กำลังทำงานอยู่แล้วหรือไม่ (Status = 0)
      final existingMachine = await _runningJobDetailsDao
          .select(_runningJobDetailsDao.runningJobMachines)
          .get()
          .then(
            (list) => list.where((m) => m.machineNo == qrCode && m.status == 0),
          );

      if (existingMachine.isNotEmpty) {
        throw Exception(
          'Machine "$qrCode" is already active. Please End its event before adding again.',
        );
      }

      // 1.5 เช็คว่า Machine นี้มีกิจกรรม Setup/Clean ค้างอยู่หรือไม่ (Status = 1)ใน DbActivityLog
      final existingActivity = await _activityLogDao
          .select(_activityLogDao.activityLogs)
          .get()
          .then(
            (list) => list.where((a) => a.machineNo == qrCode && a.status == 1),
          );

      if (existingActivity.isNotEmpty) {
        throw Exception(
          'Machine "$qrCode" is currently in a Setup/Clean activity. Please finish the activity in the Machine Setup screen before adding it to a job.',
        );
      }

      final now = DateTime.now().toIso8601String();
      final newRecId = const Uuid().v4(); // สร้าง ID ใหม่

      final entry = RunningJobMachinesCompanion(
        recId: drift.Value(newRecId),
        documentId: drift.Value(documentId),
        machineNo: drift.Value(qrCode), // เก็บค่า QR Code (Machine No)
        registerDateTime: drift.Value(now),
        registerUser: drift.Value(userId),
        status: const drift.Value(0), // 0 = Active
        syncStatus: const drift.Value(0), // 0 = รอ Sync
      );

      // บันทึกลง Database
      await _runningJobDetailsDao.insertMachine(entry);

      if (kDebugMode) {
        print('Added Machine: $qrCode for Doc: $documentId');
      }
    } catch (e) {
      if (kDebugMode) print('Error adding machine: $e');
      rethrow;
    }
  }

  /// ฟังก์ชัน: เพิ่ม Test Set จากการสแกน QR Code
  Future<void> addTestSetByQrCode({
    required String documentId,
    required String qrCode,
    required String userId,
    int? rowId,
    int? oeeJobId, // <<< New Parameter
    String? testItemName,
  }) async {
    try {
      final now = DateTime.now().toIso8601String();
      final newRecId = const Uuid().v4(); // สร้าง ID ใหม่

      final entry = JobTestSetsCompanion(
        recId: drift.Value(newRecId),
        documentId: drift.Value(documentId),
        setItemNo: drift.Value(qrCode), // เก็บค่า QR Code ที่อ่านได้
        oeeJobId: drift.Value(oeeJobId), // <<< New Value
        rowId: drift.Value(rowId),
        testItemName: drift.Value(testItemName),
        registerDateTime: drift.Value(now),
        registerUser: drift.Value(userId),
        status: const drift.Value(0), // 0 = Active
        syncStatus: const drift.Value(0), // 0 = รอ Sync
      );

      // บันทึกลง Database
      await _runningJobDetailsDao.insertTestSet(entry);

      if (kDebugMode) {
        print('Added Test Set: $qrCode for Doc: $documentId');
      }
    } catch (e) {
      if (kDebugMode) print('Error adding test set: $e');
      rethrow;
    }
  }

  // -----------------------------------------------------------------------------
  // 🟢 ส่วนจัดการสถานะและเวลา (Running Job Logic)
  // -----------------------------------------------------------------------------

  Future<void> handleUserAction({
    required String documentId,
    required String userId,
    required String
    activityType, // This is now the ID (e.g. '1', '2' or 'Work')
    String? activityName, // Optional: The human readable name
    required int newDocStatus, // 1=Running, 2=End
    String? jobTestSetId, // New (v23)
  }) async {
    try {
      final now = DateTime.now().toIso8601String();

      // -----------------------------------------------------------------------
      // 0. Global Pause Interception (End Global Breaks)
      // -----------------------------------------------------------------------
      // If the user starts a non-pause activity (meaning they resumed "Work"),
      // we must instantly terminate any active global Lunch Break / Meeting
      // and transition all OTHER background jobs into an auto-switch pause.
      if (!activityType.startsWith('PAUSE_')) {
        await _resolveGlobalPause(userId, resumingDocId: documentId);
      }

      // -----------------------------------------------------------------------
      // 0.5. Auto-Pause other running jobs (Single Active Job Policy)
      // -----------------------------------------------------------------------
      final otherActiveLogs = await _runningJobDetailsDao
          .getOpenActivitiesByUserId(userId, excludeDocId: documentId);

      for (final otherLog in otherActiveLogs) {
        // Only pause if it's NOT already paused (e.g. if they are working on Doc A)
        // If they are taking a break on Doc A (PAUSE_...), we might leave it or switch it?
        // Requirement: "Activity in Job 1 must be stopped... and create record pause"
        // Let's assume we force pause everything.
        if (otherLog.activityId != null &&
            !otherLog.activityId!.startsWith('PAUSE_')) {
          // 0.1 Close the active work log
          final closedOtherLog = otherLog.copyWith(
            endTime: drift.Value(now),
            updatedAt: drift.Value(now),
            status: 1,
            syncStatus: 0,
          );
          await _runningJobDetailsDao.updateWorkingTime(closedOtherLog);

          // 0.2 Insert Auto-Pause Log for that document
          // This ensures that when they go back to that job, it shows as Paused.
          await _runningJobDetailsDao.insertWorkingTime(
            JobWorkingTimesCompanion(
              recId: drift.Value(const Uuid().v4()),
              documentId: drift.Value(otherLog.documentId), // Same Doc
              userId: drift.Value(userId),
              activityId: const drift.Value('PAUSE_SWITCH_JOB'),
              activityName: const drift.Value('Auto Pause (Switch Job)'),
              startTime: drift.Value(now),
              // Open-ended pause
              status: const drift.Value(1),
              syncStatus: const drift.Value(0),
              updatedAt: drift.Value(now),
              jobTestSetRecId: drift.Value(
                otherLog.jobTestSetRecId,
              ), // Keep context? Or null?
            ),
          );

          if (kDebugMode) {
            print('Auto-Paused Job in Doc: ${otherLog.documentId}');
          }
        }
      }

      // 1. หา Log ล่าสุดที่ยังเปิดอยู่ (Current Document)
      final lastLog = await _runningJobDetailsDao.getLastUserLog(
        documentId,
        userId,
      );

      // 2. ปิด Log เก่า (ถ้ามี)
      if (lastLog != null && lastLog.endTime == null) {
        final closedLog = lastLog.copyWith(
          // ⚠️ FIX: Nullable fields ต้องใช้ drift.Value()
          endTime: drift.Value(now),
          updatedAt: drift.Value(now),

          // ⚠️ FIX: Non-Nullable fields ใช้ค่าตรงๆ
          status: 1,
          syncStatus: 0,
        );
        await _runningJobDetailsDao.updateWorkingTime(closedLog);
      }

      // 3. เปิด Log ใหม่
      // (Modified to allow logging even if End, per user request)
      final newLog = JobWorkingTimesCompanion(
        recId: drift.Value(const Uuid().v4()), // Generate UUID
        documentId: drift.Value(documentId),
        userId: drift.Value(userId),
        activityId: drift.Value(activityType),
        activityName: drift.Value(
          activityName ?? activityType,
        ), // Use ID as Name if Name not provided
        startTime: drift.Value(now),
        // EndTime ปล่อย null ไว้ (แสดงถึงจุดที่จบงาน)
        status: const drift.Value(1),
        syncStatus: const drift.Value(0),
        updatedAt: drift.Value(now),
        jobTestSetRecId: drift.Value(jobTestSetId), // New (v23)
      );
      await _runningJobDetailsDao.insertWorkingTime(newLog);

      // 4. อัปเดตสถานะของ Document หลัก
      await updateDocumentStatus(documentId, newDocStatus);

      if (kDebugMode) {
        print(
          'User Action: $activityType ($activityName) | DocStatus: $newDocStatus | Time: $now | TestSet: $jobTestSetId',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error handling user action: $e');
      rethrow;
    }
  }

  /// NEW: ลบเอกสารที่ยังเป็น Draft (Status = 0) พร้อมกับข้อมูลที่เกี่ยวข้อง
  Future<void> deleteDraftDocument(DbDocument doc) async {
    if (doc.status != 0) {
      throw Exception('Only Draft documents can be deleted.');
    }

    final docId = doc.documentId;
    if (docId == null) return;

    try {
      // 1. ลบข้อมูลที่เกี่ยวข้องในตาราง TestSets และ Machines
      await _runningJobDetailsDao.deleteTestSetsByDocumentId(docId);
      await _runningJobDetailsDao.deleteMachinesByDocumentId(docId);

      // 2. ลบตัวเอกสารเอง (Hard Delete)
      await _documentDao.deleteDocument(doc);

      if (kDebugMode) {
        print('Hard deleted Draft Document: $docId and its related details.');
      }
    } catch (e) {
      if (kDebugMode) print('Error deleting draft document: $e');
      rethrow;
    }
  }

  // -----------------------------------------------------------------------------
  // 🟢 ส่วนจัดการกิจกรรม (Activity Log)(สร้าง, ก๊อปปี้, ลบ) - เหมือนเดิม
  // -----------------------------------------------------------------------------

  // -----------------------------------------------------------------------------
  // 🟡 ส่วนจัดการ Document (เดิม)
  // -----------------------------------------------------------------------------

  Stream<int> watchActiveDocCount(String userId) {
    return _documentDao.watchActiveDocumentCount(userId);
  }

  Stream<int> watchActiveDocCountByJob(String userId, String jobId) {
    return _documentDao.watchActiveDocumentCountByJob(userId, jobId);
  }

  /// 1. สร้าง Running Job จาก Job ที่เลือก (Create from Job)
  Future<String> createDocumentFromJob({
    required DbJob job,
    required String userId,
  }) async {
    try {
      final newDocId = const Uuid().v4();

      final newDocumentEntry = DocumentsCompanion(
        documentId: drift.Value(newDocId),
        jobId: drift.Value(job.jobId),
        documentName: drift.Value(job.jobName),
        userId: drift.Value(userId),
        status: const drift.Value(0), // Draft
        syncStatus: const drift.Value(0),
        createDate: drift.Value(DateTime.now().toIso8601String()),
        lastSync: drift.Value(DateTime.now().toIso8601String()),
        // Copied from Job for fast UI retrieval
        sampleNo: drift.Value(job.sampleNo),
        sampleName: drift.Value(job.sampleName),
        lotNo: drift.Value(job.lotNo),
        planAnalysisDate: drift.Value(job.planAnalysisDate),
        assignmentId: drift.Value(job.assignmentId),
      );

      await _documentDao.insertDocument(newDocumentEntry);
      if (kDebugMode) {
        print('Created Draft Document: $newDocId from Job: ${job.jobId}');
      }
      return newDocId;
    } catch (e) {
      if (kDebugMode) {
        print('Error creating document from job: $e');
      }
      throw Exception('Failed to start job: $e');
    }
  }

  /// 2. ฟังก์ชันเปลี่ยนสถานะ (Handle Status Changes & Timestamps)
  Future<void> updateDocumentStatus(String documentId, int newStatus) async {
    try {
      final doc = await _documentDao.getDocument(documentId);
      if (doc == null) throw Exception('Document not found');

      // เตรียมข้อมูลที่จะอัปเดต
      var updateCompanion = DocumentsCompanion(
        documentId: drift.Value(documentId),
        status: drift.Value(newStatus),
        syncStatus: const drift.Value(0), // เปลี่ยนสถานะต้อง Sync ใหม่
        updatedAt: drift.Value(DateTime.now().toIso8601String()),
      );

      // บันทึกเวลาตามสถานะที่เปลี่ยน
      final now = DateTime.now().toIso8601String();

      switch (newStatus) {
        case 1: // Running
          updateCompanion = updateCompanion.copyWith(
            runningDate: drift.Value(now),
          );
          break;
        case 2: // End
          updateCompanion = updateCompanion.copyWith(endDate: drift.Value(now));
          break;
        case 3: // Post
          updateCompanion = updateCompanion.copyWith(
            postDate: drift.Value(now),
          );
          break;
        case 9: // Cancel
          updateCompanion = updateCompanion.copyWith(
            cancelDate: drift.Value(now),
          );
          break;
        case 10: // Delete
          updateCompanion = updateCompanion.copyWith(
            deleteDate: drift.Value(now),
          );
          break;
      }

      // ⚠️ FIX: ส่ง Value Object เข้าไปตรงๆ แทนการดึง .value ออกมา
      // (ถ้า field ไหนใน companion เป็น Value.absent() มันจะไม่ไปทับของเก่าใน doc)
      await _documentDao.updateDocument(
        doc.copyWith(
          status: updateCompanion.status.value,
          syncStatus: updateCompanion.syncStatus.value,
          runningDate: updateCompanion.runningDate,
          endDate: updateCompanion.endDate,
          postDate: updateCompanion.postDate,
          cancelDate: updateCompanion.cancelDate,
          deleteDate: updateCompanion.deleteDate,
          updatedAt: updateCompanion.updatedAt,
        ),
      );

      if (kDebugMode) {
        print(
          'Updated Document $documentId to Status $newStatus (SyncStatus=0)',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating status: $e');
      }
      rethrow;
    }
  }

  /// (ฟังก์ชันเดิม) สร้างเอกสารใหม่แบบ Manual
  Future<void> newDocument({
    required String documentName,
    required String jobId,
    required String userId,
  }) async {
    try {
      final newDocId = _generateUniqueDocumentId(jobId);

      final newDocumentEntry = DocumentsCompanion(
        documentId: drift.Value(newDocId),
        documentName: drift.Value(documentName),
        jobId: drift.Value(jobId),
        userId: drift.Value(userId),
        createDate: drift.Value(DateTime.now().toIso8601String()),
        status: const drift.Value(0),
        lastSync: drift.Value(DateTime.now().toIso8601String()),
      );

      await _documentDao.insertDocument(newDocumentEntry);
      if (kDebugMode) {
        print('New document created: $documentName (ID: $newDocId)');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating new document: $e');
      }
      throw Exception('Failed to create new document: $e');
    }
  }

  /// (ฟังก์ชันเดิม) คัดลอกเอกสาร
  Future<void> copyDocument({
    required String originalDocumentId,
    required String newDocumentName,
    required String newJobId,
    required String userId,
  }) async {
    try {
      final originalDoc = await _documentDao.getDocument(originalDocumentId);

      if (originalDoc == null) {
        throw Exception('Original document not found: $originalDocumentId');
      }

      final newDocId = _generateUniqueDocumentId(newJobId);

      final copiedDocumentEntry = DocumentsCompanion(
        documentId: drift.Value(newDocId),
        documentName: drift.Value(newDocumentName),
        jobId: drift.Value(newJobId),
        userId: drift.Value(userId),
        createDate: drift.Value(DateTime.now().toIso8601String()),
        status: drift.Value(originalDoc.status),
        lastSync: drift.Value(DateTime.now().toIso8601String()),
      );

      await _documentDao.insertDocument(copiedDocumentEntry);

      if (kDebugMode) {
        print(
          'Document $originalDocumentId copied to $newDocumentName (ID: $newDocId)',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error copying document: $e');
      }
      throw Exception('Failed to copy document: $e');
    }
  }

  /// (ฟังก์ชันเดิม) ลบเอกสาร
  Future<void> deleteDocument({
    required int uid,
    required String documentId,
  }) async {
    try {
      final docToDelete = await _documentDao.getDocument(documentId);
      if (docToDelete == null) {
        throw Exception('Document not found for deletion: $documentId');
      }

      await _documentDao.deleteDocument(docToDelete);
      if (kDebugMode) {
        print('Document deleted: $documentId');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting document: $e');
      }
      throw Exception('Failed to delete document: $e');
    }
  }

  /// NEW: Delete all documents for a specific Job ID
  Future<void> deleteDocumentsByJobId(String jobId) async {
    try {
      await _documentDao.deleteDocumentsByJobId(jobId);
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting documents for job $jobId: $e');
      }
      rethrow;
    }
  }

  String _generateUniqueDocumentId(String jobId) {
    return '${jobId}_${DateTime.now().millisecondsSinceEpoch}';
  }

  Stream<List<DbDocument>> watchActiveDocuments(
    String userId, {
    String? query,
    List<int>? statusFilter,
  }) {
    return _documentDao.watchActiveDocuments(
      userId,
      query: query,
      statusFilter: statusFilter,
    );
  }

  /// 🟠 Post Document (Status 3)
  Future<void> postDocument(String documentId) async {
    try {
      final doc = await _documentDao.getDocument(documentId);
      if (doc == null) throw Exception('Document not found');

      // Update to Status 3 (Post)
      // Reset Sync Status to 0
      // Increment Record Version
      // Set Post Date
      final now = DateTime.now().toIso8601String();
      final newVersion = (doc.recordVersion) + 1;

      await _documentDao.updateDocument(
        doc.copyWith(
          status: 3,
          syncStatus: 0,
          recordVersion: newVersion,
          postDate: drift.Value(now),
          updatedAt: drift.Value(now),
        ),
      );

      if (kDebugMode) {
        print('Posted Document $documentId (Version: $newVersion)');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error posting document: $e');
      }
      rethrow;
    }
  }

  Future<void> uploadPendingDocuments() async {
    try {
      // 1. ดึงเอกสารที่ syncStatus = 0 (ยังไม่ได้ซิงค์)
      // (ในอนาคต: ดึงจาก DB จริงๆ)

      // 2. ส่งขึ้น API (เรียก ApiService)
      // await _documentApiService.syncDocuments(...);

      // จำลองการทำงาน (Fake Upload)
      await Future.delayed(const Duration(seconds: 2));

      print('Manual Sync Completed!');
    } catch (e) {
      print('Manual Sync Failed: $e');
      throw Exception('Sync failed: $e');
    }
  }

  // --- Machine Events & Items ---

  Future<void> addMachineEvent({
    required String machineRecId,
    required String activityType, // 'Start' or 'Breakdown'
    required String userId,
  }) async {
    final now = DateTime.now();
    final nowStr = now.toIso8601String();

    // 1. Close previous open event (if any)
    final lastLog = await _runningJobDetailsDao.getLastOpenMachineLog(
      machineRecId,
    );

    if (lastLog != null) {
      // Close it
      final closedLog = lastLog.copyWith(
        endTime: drift.Value(nowStr),
        recordVersion: DateTime.now().millisecondsSinceEpoch, // Update version
        syncStatus: 0, // Mark for sync
        // Note: recordUserId remains unchanged as per requirement
      );
      await _runningJobDetailsDao.updateMachineLog(closedLog);
    }

    // 2. Insert New Log
    // If Start -> Open (endTime null)
    // If Stop/Breakdown -> Closed (endTime = startTime)
    final isTerminal =
        activityType == 'Stop' ||
        activityType == 'Breakdown' ||
        activityType == 'End';

    await _runningJobDetailsDao.insertMachineLog(
      JobMachineEventLogsCompanion(
        recId: drift.Value(const Uuid().v4()),
        jobMachineRecId: drift.Value(machineRecId),
        recordUserId: drift.Value(userId), // Save UserID
        startTime: drift.Value(nowStr),
        eventType: drift.Value(
          activityType,
        ), // Save event type (Start/Breakdown)
        endTime: drift.Value(
          isTerminal ? nowStr : null,
        ), // Close immediately if terminal
        status: const drift.Value(1), // 1=Active
        syncStatus: const drift.Value(0),
        recordVersion: const drift.Value(0),
      ),
    );

    // 3. ปรับ Status ของ Machine เป็น 1 (จบงาน) ถ้าเป็นการกด Event End
    // 3. ปรับ Status ของ Machine เป็น 1 (จบงาน) ถ้าเป็นการกด Event End
    if (activityType == 'Event End' || activityType == 'End') {
      await _runningJobDetailsDao.finishRunningJobMachine(machineRecId);
    }
  }

  Future<void> addMachineEventWithTime({
    required String machineRecId,
    required String activityType, // 'Start' or 'Breakdown'
    required String userId,
    required String startTime,
  }) async {
    final nowStr = startTime;

    // 1. Close previous open event (if any)
    final lastLog = await _runningJobDetailsDao.getLastOpenMachineLog(
      machineRecId,
    );

    if (lastLog != null) {
      // Close it
      final closedLog = lastLog.copyWith(
        endTime: drift.Value(nowStr),
        recordVersion: DateTime.now().millisecondsSinceEpoch, // Update version
        syncStatus: 0, // Mark for sync
        // Note: recordUserId remains unchanged as per requirement
      );
      await _runningJobDetailsDao.updateMachineLog(closedLog);
    }

    // 2. Insert New Log
    // If Start -> Open (endTime null)
    // If Stop/Breakdown -> Closed (endTime = startTime)
    final isTerminal =
        activityType == 'Stop' ||
        activityType == 'Breakdown' ||
        activityType == 'End';

    await _runningJobDetailsDao.insertMachineLog(
      JobMachineEventLogsCompanion(
        recId: drift.Value(const Uuid().v4()),
        jobMachineRecId: drift.Value(machineRecId),
        recordUserId: drift.Value(userId), // Save UserID
        startTime: drift.Value(nowStr),
        eventType: drift.Value(
          activityType,
        ), // Save event type (Start/Breakdown)
        endTime: drift.Value(
          isTerminal ? nowStr : null,
        ), // Close immediately if terminal
        status: const drift.Value(1), // 1=Active
        syncStatus: const drift.Value(0),
        recordVersion: const drift.Value(0),
      ),
    );

    // 3. ปรับ Status ของ Machine เป็น 1 (จบงาน) ถ้าเป็นการกด Event End
    if (activityType == 'Event End' || activityType == 'End') {
      await _runningJobDetailsDao.finishRunningJobMachine(machineRecId);
    }
  }

  Future<void> addMachineItem({
    String? documentId,
    required String machineRecId,
    required String testSetRecId,
    required String userId,
  }) async {
    final now = DateTime.now();
    final nowStr = now.toIso8601String();

    await _runningJobDetailsDao.insertMachineItem(
      JobMachineItemsCompanion(
        recId: drift.Value(const Uuid().v4()),
        documentId: drift.Value(documentId),
        jobMachineRecId: drift.Value(machineRecId),
        jobTestSetRecId: drift.Value(testSetRecId),
        registerDateTime: drift.Value(nowStr),
        registerUser: drift.Value(userId),
        status: const drift.Value(1),
        syncStatus: const drift.Value(0),
        recordVersion: const drift.Value(0),
      ),
    );
  }

  Future<void> deleteMachineEvent(String recId) async {
    await _runningJobDetailsDao.deleteMachineLog(recId);
  }

  Future<void> deleteMachineItem(String recId) async {
    await _runningJobDetailsDao.deleteMachineItem(recId);
  }

  // -----------------------------------------------------------------------------
  // 🔵 Global Pause Resolution Interceptor
  // -----------------------------------------------------------------------------

  /// Checks if the user is currently in a global batch pause (like a Lunch Break).
  /// If so, closes the break and puts all *other* previously paused jobs into
  /// a standard PAUSE_SWITCH_JOB state, terminating the lunch break definitively.
  Future<void> _resolveGlobalPause(
    String userId, {
    String? resumingDocId,
  }) async {
    final activities = await _activityLogDao
        .watchActiveActivities(userId)
        .first;
    if (activities.isEmpty) return;

    final lastActivity = activities.first; // The current global pause

    // Is it a global batch pause?
    if (lastActivity.remark != null &&
        lastActivity.remark!.contains('PausedIds:')) {
      // 1. Close the Global Phase Activity Log
      await _activityLogDao.updateActivity(
        lastActivity.copyWith(
          endTime: drift.Value(DateTime.now().toIso8601String()),
          status: 2, // Completed
          syncStatus: 0,
        ),
      );

      // 2. Transition ALL other jobs (except the one explicitly resuming right now)
      try {
        final parts = lastActivity.remark!.split('PausedIds: ');
        if (parts.length > 1) {
          final jsonStr = parts[1];
          final List<dynamic> ids = jsonDecode(jsonStr);

          for (final id in ids) {
            final String otherDocId = id.toString();
            // Skip the job the user is manually resuming (it will be handled naturally)
            if (otherDocId != resumingDocId) {
              final otherDoc = await _documentDao.getDocument(otherDocId);
              if (otherDoc != null &&
                  otherDoc.status == 1 &&
                  otherDoc.documentId != null) {
                final log = await _runningJobDetailsDao.getLastNonPauseUserLog(
                  otherDoc.documentId!,
                  userId,
                );

                // Note: We avoid an infinite loop because PAUSE_SWITCH_JOB starts with 'PAUSE_'
                // and thus won't re-trigger _resolveGlobalPause via handleUserAction.
                await handleUserAction(
                  documentId: otherDoc.documentId!,
                  userId: userId,
                  activityType: 'PAUSE_SWITCH_JOB',
                  activityName: 'Auto Pause (Switch Job)',
                  newDocStatus: 1, // Still running (in background)
                  jobTestSetId:
                      log?.jobTestSetRecId, // Preserve Active Test Set
                );
              }
            }
          }
        }
      } catch (e) {
        if (kDebugMode) print('Error parsing PausedIds during resolution: $e');
      }
    }
  }

  // -----------------------------------------------------------------------------
  // 🔵 Batch Job Actions (Shortcuts)
  // -----------------------------------------------------------------------------

  Future<void> batchPauseJobs({
    required String userId,
    required String activityType, // e.g., 'Lunch', 'Meeting'
    required String remark,
  }) async {
    // 1. Find all RUNNING documents (Status = 1)
    final allDocs = await _documentDao.watchActiveDocuments(userId).first;
    final runningDocs = allDocs.where((d) => d.status == 1).toList();

    if (runningDocs.isEmpty) {
      if (kDebugMode) print('No running jobs to pause.');
    }

    // 1.1 Find correct Pause Reason Code from DB or Default
    // Try to find a reason that matches the activityType name
    final allReasons = await _pauseReasonDao.getActiveReasons();

    // Default fallback
    String reasonCode = '99'; // Misc/Other?
    String reasonName = activityType;

    try {
      final match = allReasons.firstWhere(
        (r) =>
            r.reasonName != null &&
            r.reasonName!.toLowerCase().contains(activityType.toLowerCase()),
      );
      if (match.reasonCode != null) {
        reasonCode = match.reasonCode!;
        reasonName = match.reasonName ?? activityType;
      }
    } catch (_) {
      // Not found, maybe use first available or keeping default
      // If "Lunch" is not in DB, we might want to fail or just use text?
      // User requested "DbPauseReason... ReasonCode/ReasonName".
      // Let's assume '00' is work. '99' might be safe default if unknown.
    }

    // 2. Pause them all (Keep Status 1 "Running", but change ActivityID)
    List<String> pausedDocIds = [];
    for (final doc in runningDocs) {
      if (doc.documentId != null) {
        // Find existing test set if any
        final lastLog = await _runningJobDetailsDao.getLastNonPauseUserLog(
          doc.documentId!,
          userId,
        );

        await handleUserAction(
          documentId: doc.documentId!,
          userId: userId,
          activityType: 'PAUSE_$reasonCode', // Prefix with PAUSE_
          activityName: reasonName, // Use Name from DB
          newDocStatus: 1, // Keep Running! (Paused state is just a log entry)
          jobTestSetId: lastLog?.jobTestSetRecId, // Preserve Active Test Set
        );
        pausedDocIds.add(doc.documentId!);
      }
    }

    // 3. Create Global Activity Log
    // Store pausedDocIds in remark for resumption
    final String fullRemark =
        '$remark | PausedIds: ${jsonEncode(pausedDocIds)}';

    await _activityLogDao.insertActivity(
      ActivityLogsCompanion(
        recId: drift.Value(const Uuid().v4()),
        operatorId: drift.Value(userId),
        activityType: drift.Value<String?>(activityType),
        remark: drift.Value<String?>(fullRemark),
        startTime: drift.Value<String?>(DateTime.now().toIso8601String()),
        status: const drift.Value(1), // Running
        syncStatus: const drift.Value(0),
      ),
    );
  }

  Future<int> batchResumeJobs(String userId) async {
    // 1. Find last OPEN Activity Log
    final activities = await _activityLogDao
        .watchActiveActivities(userId)
        .first;
    if (activities.isEmpty) return 0;

    final lastActivity = activities.first; // Last started

    int resumedCount = 0;
    if (lastActivity.remark != null &&
        lastActivity.remark!.contains('PausedIds:')) {
      try {
        final parts = lastActivity.remark!.split('PausedIds: ');
        if (parts.length > 1) {
          final jsonStr = parts[1];
          final List<dynamic> ids = jsonDecode(jsonStr);

          // Find the single absolute most-recent job to resume
          String? targetDocId;
          DbJobWorkingTime? targetLog;

          for (final id in ids.reversed) {
            final log = await _runningJobDetailsDao.getLastNonPauseUserLog(
              id.toString(),
              userId,
            );
            if (log != null) {
              if (targetLog == null ||
                  (log.startTime != null &&
                      targetLog.startTime != null &&
                      DateTime.parse(
                        log.startTime!,
                      ).isAfter(DateTime.parse(targetLog.startTime!)))) {
                targetDocId = id.toString();
                targetLog = log;
              }
            }
          }

          if (targetDocId != null && targetLog != null) {
            final targetDoc = await _documentDao.getDocument(targetDocId);

            if (targetDoc != null &&
                targetDoc.status == 1 &&
                targetDoc.documentId != null) {
              // Executing handleUserAction with a WORK activity will trigger `_resolveGlobalPause`
              // which automatically closes the master ActivityLog and transitions all *other*
              // `ids` from this pause into PAUSE_SWITCH_JOB. We don't have to do it manually here.
              await handleUserAction(
                documentId: targetDoc.documentId!,
                userId: userId,
                activityType: targetLog.activityId ?? '00',
                activityName: targetLog.activityName ?? 'Work',
                newDocStatus: 1, // Running
                jobTestSetId: targetLog.jobTestSetRecId, // Restore Test Set
              );
              resumedCount++;
            }
          }
        }
      } catch (e) {
        if (kDebugMode) print('Error parsing PausedIds: $e');
      }
    }

    return resumedCount;
  }

  // -----------------------------------------------------------------------------
  // 🟣 Job / Document Renaming
  // -----------------------------------------------------------------------------

  Future<void> renameJob(String jobId, String newName) async {
    // We should run this transactionally if possible, but DAOs are separate accessors.
    // However, since they are on the same DB, we could wrap in a transaction block
    // if we had access to the DB instance directly here (we do, via DAOs).

    // Simple sequential update is acceptable for now.

    // 1. Update Job Name & Reset Sync Status
    await _jobDao.updateJobName(jobId, newName);

    // 2. Update Related Documents
    await _documentDao.updateDocumentNameByJobId(jobId, newName);

    if (kDebugMode) {
      print('Renamed Job $jobId to "$newName" (and updated synced status)');
    }
  }
}
