// lib/data/database/daos/document_record_dao.dart
import 'package:drift/drift.dart';
import 'package:drift/drift.dart' as drift;
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/tables/document_record_table.dart';

part 'document_record_dao.g.dart';

@DriftAccessor(tables: [DocumentRecords])
class DocumentRecordDao extends DatabaseAccessor<AppDatabase>
    with _$DocumentRecordDaoMixin {
  DocumentRecordDao(AppDatabase db) : super(db);

  Future<int> insertDocumentRecord(DocumentRecordsCompanion entry) =>
      into(documentRecords).insert(entry);

  Future<void> insertAllDocumentRecords(
    List<DocumentRecordsCompanion> entries,
  ) async {
    await batch((batch) {
      batch.insertAll(documentRecords, entries);
    });
  }

  Future<int> countRecordsByStatusAndSyncStatus(
    int status,
    int syncStatus,
  ) async {
    final result = await customSelect(
      'SELECT COUNT(*) FROM document_records WHERE status = ? AND syncStatus = ?',
      variables: [
        drift.Variable.withInt(status),
        drift.Variable.withInt(syncStatus),
      ],
    ).getSingleOrNull();

    return result?.data.values.first as int? ?? 0;
  }

  Future<String?> getLastSyncForRecordsByStatusAndSyncStatus(
    int status,
    int syncStatus,
  ) async {
    final result = await customSelect(
      'SELECT MAX(lastSync) FROM document_records WHERE status = ? AND syncStatus = ?',
      variables: [
        drift.Variable.withInt(status),
        drift.Variable.withInt(syncStatus),
      ],
    ).getSingleOrNull();
    return result?.data.values.first?.toString();
  }

  Future<List<DbDocumentRecord>> getRecordsByStatus(
    String documentId,
    String machineId,
    int status,
  ) {
    return (select(documentRecords)..where(
          (tbl) =>
              tbl.documentId.equals(documentId) &
              tbl.machineId.equals(machineId) &
              tbl.status.equals(status),
        ))
        .get();
  }

  Stream<List<DbDocumentRecord>> watchRecordsForUpload() {
    return (select(
      documentRecords,
    )..where((tbl) => tbl.status.equals(2) & tbl.syncStatus.equals(0))).watch();
  }

  Future<List<DbDocumentRecord>> getRecordsBySyncStatus(int syncStatus) {
    return (select(
      documentRecords,
    )..where((tbl) => tbl.syncStatus.equals(syncStatus))).get();
  }

  Future<int> deleteRecordsBySyncStatus(int syncStatus) {
    return (delete(
      documentRecords,
    )..where((tbl) => tbl.syncStatus.equals(syncStatus))).go();
  }

  Future<bool> updateDocumentRecordStatusAndSyncStatus(
    int uid,
    int newStatus,
    int newSyncStatus,
  ) async {
    final updatedRows =
        await (update(
          documentRecords,
        )..where((tbl) => tbl.uid.equals(uid))).write(
          DocumentRecordsCompanion(
            status: drift.Value(newStatus),
            syncStatus: drift.Value(newSyncStatus),
            lastSync: drift.Value(DateTime.now().toIso8601String()),
          ),
        );
    return updatedRows > 0;
  }

  Future<int> deleteAllRecordsByDocumentId(String documentId) {
    return (delete(
      documentRecords,
    )..where((tbl) => tbl.documentId.equals(documentId))).go();
  }

  Future<DbDocumentRecord?> getDocumentRecordByUid(int uid) {
    return (select(
      documentRecords,
    )..where((tbl) => tbl.uid.equals(uid))).getSingleOrNull();
  }

  Future<List<DbDocumentRecord>> getRecordsByDocumentId(String documentId) {
    return (select(
      documentRecords,
    )..where((tbl) => tbl.documentId.equals(documentId))).get();
  }

  Future<DbDocumentRecord?> getDocumentRecord({
    required String documentId,
    required String machineId,
    required String tagId,
  }) {
    return (select(documentRecords)..where(
          (tbl) =>
              tbl.documentId.equals(documentId) &
              tbl.machineId.equals(machineId) &
              tbl.tagId.equals(tagId),
        ))
        .getSingleOrNull();
  }

  Stream<List<DbDocumentRecord>> watchAllDocumentRecords() =>
      select(documentRecords).watch();
  Future<List<DbDocumentRecord>> getAllDocumentRecords() =>
      select(documentRecords).get();

  Future<bool> updateDocumentRecord(DocumentRecordsCompanion entry) {
    return update(documentRecords).replace(entry);
  }

  Future<int> deleteDocumentRecord(DbDocumentRecord entry) =>
      delete(documentRecords).delete(entry);

  Future<int> deleteAllDocumentRecords() => delete(documentRecords).go();

  Stream<List<DbDocumentRecord>> getDocumentRecordsList(
    String documentId,
    String machineId,
  ) {
    // Simplified query without join since JobTags table is removed
    return (select(documentRecords)..where(
          (tbl) =>
              tbl.documentId.equals(documentId) &
              tbl.machineId.equals(machineId),
        ))
        .watch();
  }

  Stream<List<DbDocumentRecord>> watchRecordsForChart(
    String jobId,
    String machineId,
    String tagId,
  ) {
    final query = select(documentRecords)
      ..where(
        (tbl) =>
            tbl.jobId.equals(jobId) &
            tbl.machineId.equals(machineId) &
            tbl.tagId.equals(tagId),
      )
      ..orderBy([
        (tbl) => drift.OrderingTerm(
          expression: tbl.lastSync,
          mode: drift.OrderingMode.asc,
        ),
      ]);
    return query.watch();
  }

  // TODO: Implement getDocumentRecordsChart(documentId: String, machineId: String, tagId: String): LiveData<List<DbDocumentRecord>>
  // This will involve complex queries and possibly custom data structures for chart data.
  // We will need to define a custom query with `@Query()` or build it using `select` and `where` clauses.
  // For now, let's just put a placeholder.
  Future<List<DbDocumentRecord>> getDocumentRecordsChart(
    String documentId,
    String machineId,
    String tagId,
  ) async {
    return (select(documentRecords)..where(
          (tbl) =>
              tbl.documentId.equals(documentId) &
              tbl.machineId.equals(machineId) &
              tbl.tagId.equals(tagId),
        ))
        .get();
  }
}
