// lib/data/database/daos/document_dao.dart
import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart'; // Import your main database
import 'package:bio_oee_lab/data/database/tables/document_table.dart'; // Import your table

part 'document_dao.g.dart';

@DriftAccessor(tables: [Documents])
class DocumentDao extends DatabaseAccessor<AppDatabase>
    with _$DocumentDaoMixin {
  DocumentDao(AppDatabase db) : super(db);

  /// ดึงรายการเอกสารที่ "Active" (0=Draft, 1=Running, 2=End) ของ User นี้
  Stream<List<DbDocument>> watchActiveDocuments(
    String userId, {
    String? query,
  }) {
    final queryStr = query ?? '';

    return (select(documents)
          ..where((tbl) {
            // เงื่อนไขหลัก: User คนนี้ และสถานะเป็น 0, 1, 2
            final baseFilter =
                tbl.userId.equals(userId) & tbl.status.isIn([0, 1, 2]);

            // ถ้ามีคำค้นหา ให้กรองเพิ่ม (ชื่อเอกสาร หรือ รหัสงาน)
            if (queryStr.isNotEmpty) {
              return baseFilter &
                  (tbl.documentName.contains(queryStr) |
                      tbl.jobId.contains(queryStr));
            } else {
              return baseFilter;
            }
          })
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createDate, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  // Equivalent to suspend fun insertDocument(document: DbDocument) in DaoDocument.kt
  Future<int> insertDocument(DocumentsCompanion entry) =>
      into(documents).insert(entry);

  // Equivalent to suspend fun insertAll(documents: List<DbDocument>)
  Future<void> insertAllDocuments(List<DocumentsCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(documents, entries);
    });
  }

  /// NEW: Deletes documents by a list of documentIds.
  Future<int> deleteDocumentsByIds(List<String> documentIds) {
    return (delete(
      documents,
    )..where((tbl) => tbl.documentId.isIn(documentIds))).go();
  }

  // Equivalent to suspend fun getDocument(documentId: String): DbDocument?
  Future<DbDocument?> getDocument(String documentId) {
    return (select(
      documents,
    )..where((tbl) => tbl.documentId.equals(documentId))).getSingleOrNull();
  }

  // Equivalent to suspend fun getAllDocument(): List<DbDocument>
  Stream<List<DbDocument>> watchAllDocuments() => select(documents).watch();
  Future<List<DbDocument>> getAllDocuments() => select(documents).get();

  // NEW: Method to get a single document by its documentId
  Future<DbDocument?> getDocumentById(String documentId) {
    return (select(
      documents,
    )..where((tbl) => tbl.documentId.equals(documentId))).getSingleOrNull();
  }

  // Equivalent to suspend fun updateDocument(document: DbDocument)
  Future<bool> updateDocument(DbDocument entry) =>
      update(documents).replace(entry);

  // Equivalent to suspend fun deleteDocument(document: DbDocument)
  Future<int> deleteDocument(DbDocument entry) =>
      delete(documents).delete(entry);

  // Equivalent to suspend fun deleteAll()
  Future<int> deleteAllDocuments() => delete(documents).go();

  // NEW: Equivalent to suspend fun getDocumentList(jobId: String): LiveData<List<DbDocument>>
  Future<List<DbDocument>> getDocumentsByJobId(String jobId) {
    return (select(documents)..where((tbl) => tbl.jobId.equals(jobId))).get();
  }

  // Optional: If you need a stream of filtered documents (like LiveData)
  Stream<List<DbDocument>> watchDocumentsByJobId(String jobId) {
    return (select(documents)..where((tbl) => tbl.jobId.equals(jobId))).watch();
  }

  Stream<int> watchActiveDocumentCount(String userId) {
    return (select(documents)..where(
          (tbl) => tbl.userId.equals(userId) & tbl.status.isIn([0, 1]),
        )) // 0=Draft, 1=Running
        .watch()
        .map((list) => list.length); // คืนค่าเป็นจำนวนรายการ
  }

  Stream<int> watchActiveDocumentCountByJob(String userId, String jobId) {
    return (select(documents)..where(
          (tbl) =>
              tbl.userId.equals(userId) &
              tbl.jobId.equals(jobId) & // กรองตาม Job ID
              tbl.status.isIn([0, 1]),
        ))
        .watch()
        .map((list) => list.length);
  }

  // ⬇️ เพิ่มฟังก์ชันนี้สำหรับ StreamBuilder (Real-time)
  Stream<DbDocument?> watchDocumentById(String documentId) {
    return (select(
      documents,
    )..where((tbl) => tbl.documentId.equals(documentId))).watchSingleOrNull();
  }

  // ดึงเอกสารที่ยังไม่ได้ Sync (syncStatus = 0)
  Future<List<DbDocument>> getUnsyncedDocuments({int limit = 10}) {
    return (select(documents)
          ..where((t) => t.syncStatus.equals(0))
          ..limit(limit))
        .get();
  }

  // อัปเดตสถานะ Sync
  Future<void> updateSyncStatus(
    String documentId,
    int status,
    String lastSyncTime,
    int recordVersion,
  ) {
    return (update(
      documents,
    )..where((t) => t.documentId.equals(documentId))).write(
      DocumentsCompanion(
        syncStatus: Value(status),
        lastSync: Value(lastSyncTime),
        recordVersion: Value(recordVersion),
      ),
    );
  }
}
