// lib/data/repositories/sync_repository.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value; // <<< Import 'Value'

// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:bio_oee_lab/data/database/daos/user_dao.dart';
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
import 'package:bio_oee_lab/data/network/sync_api_service.dart';
import 'package:bio_oee_lab/data/models/user_sync_page.dart';

// Enum นี้จะใช้บอกหน้า UI ว่ากำลัง Sync อยู่
enum SyncStatus { idle, syncing, success, failure }

class SyncRepository with ChangeNotifier {
  final SyncApiService _syncApiService;
  final UserDao _userDao;

  SyncStatus _syncStatus = SyncStatus.idle;
  String _lastSyncMessage = '';
  int _totalUserCount = 0; // <<< ใช้นับ User ทั้งหมด

  // Getters ให้หน้า UI ดึงไปใช้
  SyncStatus get syncStatus => _syncStatus;
  String get lastSyncMessage => _lastSyncMessage;
  int get totalUserCount => _totalUserCount;

  SyncRepository({
    required SyncApiService syncApiService,
    required UserDao userDao,
  }) : _syncApiService = syncApiService,
       _userDao = userDao;

  /// ฟังก์ชันหลัก: Sync User ทั้งหมด (แบบแบ่งหน้า)
  Future<bool> syncAllUsers() async {
    _syncStatus = SyncStatus.syncing;
    _totalUserCount = 0; // (เริ่มนับใหม่)
    _lastSyncMessage = 'Preparing to sync...';
    notifyListeners();

    // --- ⬇️⬇️⬇️ FIX 1: กำหนด pageSize ที่นี่ ⬇️⬇️⬇️ ---
    // (ตามที่คุณใช้ทดสอบ)
    const int pageSize = 10;

    try {
      // 1. ดึงหน้าแรก (Page 1)
      _lastSyncMessage = 'Fetching page 1...';
      notifyListeners();

      if (kDebugMode) {
        print("Fetching page 1 : pageSize = $pageSize");
      }

      // --- ⬇️⬇️⬇️ FIX 2: ส่ง pageSize เข้าไป ⬇️⬇️⬇️ ---
      final UserSyncPage firstPage = await _syncApiService.getUsersPage(
        1,
        pageSize: pageSize,
      );

      // 2. ได้จำนวนหน้าทั้งหมด (เราแก้เป็น nullable ?? 0 ไว้แล้ว)
      final int totalPages = firstPage.totalPages ?? 0;
      if (totalPages <= 0) {
        throw Exception('No data found on server (TotalPages = $totalPages).');
      }

      _lastSyncMessage = 'Syncing $totalPages pages...';
      notifyListeners();

      // 3. ล้างข้อมูล User เก่าทั้งหมดใน DB
      await _userDao.clearAllUsers();

      // 4. ประมวลผลหน้าแรก
      List<DbUser> processedFirstPage = _processUserList(firstPage.users);
      await _userDao.batchInsertUsers(processedFirstPage);
      _totalUserCount += processedFirstPage.length;

      // 5. วน Loop ดึงหน้าที่เหลือ (ถ้ามี)
      if (totalPages > 1) {
        for (int i = 2; i <= totalPages; i++) {
          _lastSyncMessage =
              'Syncing page $i of $totalPages... ($_totalUserCount users)';
          notifyListeners();

          // 5.1 ดึงหน้าถัดไป
          // --- ⬇️⬇️⬇️ FIX 3: ส่ง pageSize ใน Loop ด้วย ⬇️⬇️⬇️ ---
          final UserSyncPage page = await _syncApiService.getUsersPage(
            i,
            pageSize: pageSize,
          );

          // 5.2 ประมวลผล (ล้าง Password)
          List<DbUser> processedPage = _processUserList(page.users);

          // 5.3 บันทึกลง DB ทีละชุด
          await _userDao.batchInsertUsers(processedPage);
          _totalUserCount += processedPage.length;
        }
      }

      // 6. สำเร็จ
      _syncStatus = SyncStatus.success;
      _lastSyncMessage =
          'Successfully synced $_totalUserCount users ($totalPages pages).';
      notifyListeners();
      return true;
    } catch (e) {
      // 7. ล้มเหลว
      _syncStatus = SyncStatus.failure;
      _lastSyncMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    } finally {
      // 8. กลับเป็น idle หลังผ่านไป 2 วินาที
      await Future.delayed(const Duration(seconds: 2));
      _syncStatus = SyncStatus.idle;
      notifyListeners();
    }
  }

  /// Helper: ประมวลผล User List (ทำตามกฎข้อ 4: ล้าง Password)
  List<DbUser> _processUserList(List<DbUser> users) {
    return users.map((apiUser) {
      return apiUser.copyWith(
        password: const Value(null), // <<< ล้าง Password
      );
    }).toList();
  }
}
