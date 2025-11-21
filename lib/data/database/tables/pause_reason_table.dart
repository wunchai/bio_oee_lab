import 'package:drift/drift.dart';

@DataClassName('DbPauseReason')
class PauseReasons extends Table {
  IntColumn get uid => integer().autoIncrement().named('uid')();

  // รหัสเหตุผล (เผื่อ Sync กับระบบ ERP)
  TextColumn get reasonCode => text().named('ReasonCode').nullable()();

  // ชื่อเหตุผลที่จะแสดงใน Dropdown
  TextColumn get reasonName => text().named('ReasonName').nullable()();

  // 1=Active, 0=Inactive
  IntColumn get status =>
      integer().named('Status').withDefault(const Constant(1))();
}
