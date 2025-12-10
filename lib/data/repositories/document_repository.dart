import 'package:flutter/foundation.dart'; // สำหรับ kDebugMode
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/document_dao.dart';
import 'package:bio_oee_lab/data/database/daos/running_job_details_dao.dart';

/// Repository for managing document data.
class DocumentRepository {
  final DocumentDao _documentDao;
  final RunningJobDetailsDao _runningJobDetailsDao;

  DocumentRepository({required AppDatabase appDatabase})
    : _documentDao = appDatabase.documentDao,
      _runningJobDetailsDao = appDatabase.runningJobDetailsDao;

  /// ฟังก์ชัน: เพิ่ม Machine จากการสแกน QR Code หรือ Manual Input
  Future<void> addMachineByQrCode({
    required String documentId,
    required String qrCode,
    required String userId,
  }) async {
    try {
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
  }) async {
    try {
      final now = DateTime.now().toIso8601String();
      final newRecId = const Uuid().v4(); // สร้าง ID ใหม่

      final entry = JobTestSetsCompanion(
        recId: drift.Value(newRecId),
        documentId: drift.Value(documentId),
        setItemNo: drift.Value(qrCode), // เก็บค่า QR Code ที่อ่านได้
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
  }) async {
    try {
      final now = DateTime.now().toIso8601String();

      // 1. หา Log ล่าสุดที่ยังเปิดอยู่
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
      );
      await _runningJobDetailsDao.insertWorkingTime(newLog);

      // 4. อัปเดตสถานะของ Document หลัก
      await updateDocumentStatus(documentId, newDocStatus);

      if (kDebugMode) {
        print(
          'User Action: $activityType ($activityName) | DocStatus: $newDocStatus | Time: $now',
        );
      }
    } catch (e) {
      if (kDebugMode) print('Error handling user action: $e');
      rethrow;
    }
  }

  // -----------------------------------------------------------------------------
  // 🟡 ส่วนจัดการ Document (สร้าง, ก๊อปปี้, ลบ) - เหมือนเดิม
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
  Future<void> createDocumentFromJob({
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
      );

      await _documentDao.insertDocument(newDocumentEntry);
      if (kDebugMode) {
        print('Created Draft Document: $newDocId from Job: ${job.jobId}');
      }
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

  String _generateUniqueDocumentId(String jobId) {
    return '${jobId}_${DateTime.now().millisecondsSinceEpoch}';
  }

  Stream<List<DbDocument>> watchActiveDocuments(
    String userId, {
    String? query,
  }) {
    return _documentDao.watchActiveDocuments(userId, query: query);
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

    await _runningJobDetailsDao.insertMachineLog(
      JobMachineEventLogsCompanion(
        recId: drift.Value(const Uuid().v4()),
        jobMachineRecId: drift.Value(machineRecId),
        recordUserId: drift.Value(userId), // Save UserID
        startTime: drift.Value(nowStr),
        eventType: drift.Value(
          activityType,
        ), // Save event type (Start/Breakdown)
        // endTime: Value(null), // Open event
        status: const drift.Value(1), // 1=Active
        syncStatus: const drift.Value(0),
        recordVersion: const drift.Value(0),
      ),
    );
  }

  Future<void> addMachineItem({
    required String documentId,
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
}
