import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/document_timelog_table.dart';

part 'document_timelog_dao.g.dart';

@DriftAccessor(tables: [DocumentTimeLogs])
class DocumentTimeLogDao extends DatabaseAccessor<AppDatabase>
    with _$DocumentTimeLogDaoMixin {
  DocumentTimeLogDao(AppDatabase db) : super(db);

  // เพิ่ม Log ใหม่
  Future<int> insertLog(DocumentTimeLogsCompanion entry) =>
      into(documentTimeLogs).insert(entry);

  // ดึง Log ทั้งหมดของเอกสารนี้ (เพื่อมาคำนวณเวลา และแสดง Timeline)
  Future<List<DbDocumentTimeLog>> getLogsByDocId(String documentId) {
    return (select(documentTimeLogs)
          ..where((tbl) => tbl.documentId.equals(documentId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.logTime, mode: OrderingMode.asc),
          ]))
        .get();
  }

  // ลบ Log ทั้งหมด (กรณี Delete Document)
  Future<int> deleteLogsByDocId(String documentId) {
    return (delete(
      documentTimeLogs,
    )..where((tbl) => tbl.documentId.equals(documentId))).go();
  }
}
