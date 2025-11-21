import 'package:drift/drift.dart';

@DataClassName('DbDocumentTimeLog')
class DocumentTimeLogs extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // เชื่อมกับ Document หลัก
  TextColumn get documentId => text().named('documentId').nullable()();

  // ประเภทเหตุการณ์: 1=Start, 2=Pause, 3=Resume, 4=End
  IntColumn get logType =>
      integer().named('logType').withDefault(const Constant(1))();

  // เวลาที่เกิดเหตุการณ์
  TextColumn get logTime => text().named('logTime').nullable()(); // ISO 8601

  // สาเหตุการพัก (เช่น "Meeting", "Lunch", "Machine Breakdown")
  TextColumn get remark => text().named('remark').nullable()();

  // (Optional) เก็บ Duration ของช่วงเวลานั้นๆ ถ้าต้องการคำนวณแล้วบันทึกเลย
  // แต่ปกติเราจะคำนวณจาก logTime หน้างานได้
}
