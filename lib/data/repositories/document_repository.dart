import 'package:flutter/foundation.dart'; // สำหรับ kDebugMode
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/document_dao.dart';
import 'package:bio_oee_lab/data/database/daos/document_record_dao.dart';

/// Repository for managing document data.
class DocumentRepository {
  final DocumentDao _documentDao;
  final DocumentRecordDao _documentRecordDao;

  DocumentRepository({required AppDatabase appDatabase})
    : _documentDao = appDatabase.documentDao,
      _documentRecordDao = appDatabase.documentRecordDao;

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

      final originalRecords = await _documentRecordDao.getRecordsByDocumentId(
        originalDocumentId,
      );
      if (originalRecords.isNotEmpty) {
        final List<DocumentRecordsCompanion> copiedRecords = originalRecords
            .map((record) {
              return DocumentRecordsCompanion(
                documentId: drift.Value(newDocId),
                machineId: drift.Value(record.machineId),
                jobId: drift.Value(newJobId),
                tagId: drift.Value(record.tagId),
                tagName: drift.Value(record.tagName),
                tagType: drift.Value(record.tagType),
                tagGroupId: drift.Value(record.tagGroupId),
                tagGroupName: drift.Value(record.tagGroupName),
                tagSelectionValue: drift.Value(record.tagSelectionValue),
                description: drift.Value(record.description),
                specification: drift.Value(record.specification),
                specMin: drift.Value(record.specMin),
                specMax: drift.Value(record.specMax),
                unit: drift.Value(record.unit),
                queryStr: drift.Value(record.queryStr),
                value: drift.Value(record.value),
                valueType: drift.Value(record.valueType),
                remark: drift.Value(record.remark),
                status: drift.Value(record.status),
                unReadable: drift.Value(record.unReadable),
                lastSync: drift.Value(DateTime.now().toIso8601String()),
              );
            })
            .toList();
        await _documentRecordDao.insertAllDocumentRecords(copiedRecords);
        if (kDebugMode) {
          print('Copied ${copiedRecords.length} records for new document.');
        }
      }
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
      await _documentRecordDao.deleteAllRecordsByDocumentId(documentId);
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
}
