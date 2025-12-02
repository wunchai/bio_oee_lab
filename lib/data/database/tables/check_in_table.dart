import 'package:drift/drift.dart';

// 1. Master Data: กิจกรรม
@DataClassName('DbCheckInActivity')
class CheckInActivities extends Table {
  IntColumn get uid => integer().autoIncrement()();
  TextColumn get activityName => text().named('ActivityName').nullable()();
  // 1=Active
  IntColumn get status =>
      integer().named('Status').withDefault(const Constant(1))();
}

// 2. Transaction: ประวัติการ Check-In
@DataClassName('DbCheckInLog')
class CheckInLogs extends Table {
  IntColumn get uid => integer().autoIncrement()();
  TextColumn get recId => text().named('RecId').nullable()();

  // ข้อมูลสถานที่ (จาก QR Code)
  TextColumn get locationCode => text().named('LocationCode').nullable()();

  // ข้อมูล User
  TextColumn get userId => text().named('UserId').nullable()();

  // รายละเอียดกิจกรรม
  TextColumn get activityName => text().named('ActivityName').nullable()();
  TextColumn get remark => text().named('Remark').nullable()();

  // เวลา
  TextColumn get checkInTime =>
      text().named('CheckInTime').nullable()(); // ISO 8601
  TextColumn get checkOutTime =>
      text().named('CheckOutTime').nullable()(); // ISO 8601

  // Status: 1=Active (ยังไม่ CheckOut), 2=Completed (CheckOut แล้ว)
  IntColumn get status =>
      integer().named('Status').withDefault(const Constant(1))();

  // Sync
  IntColumn get syncStatus =>
      integer().named('SyncStatus').withDefault(const Constant(0))();
  TextColumn get lastSync => text().named('LastSync').nullable()();

  // Versioning
  IntColumn get recordVersion =>
      integer().named('RecordVersion').withDefault(const Constant(0))();
}
