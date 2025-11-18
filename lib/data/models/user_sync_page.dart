// lib/data/models/user_sync_page.dart

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/app_database.dart'; // Import your main database
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
import 'package:bio_oee_lab/data/models/remote_user.dart'; // <<< 1. Import โมเดลใหม่

part 'user_sync_page.g.dart'; // <<< รัน build_runner หลังสร้างไฟล์นี้

class StringToListDbUserConverter
    implements JsonConverter<List<DbUser>, String> {
  const StringToListDbUserConverter();

  @override
  List<DbUser> fromJson(String jsonString) {
    // 1. Decode String ภายนอก
    final List<dynamic> list = jsonDecode(jsonString);

    // 2. Map แต่ละรายการด้วย RemoteUser.fromJson (ที่ปลอดภัย)
    return list.map((item) {
      final remote = RemoteUser.fromJson(item as Map<String, dynamic>);

      // 3. แปลงจาก RemoteUser → DbUser (Manual Mapping)
      // (อิงจาก user_table.dart ที่คุณส่งมา)
      return DbUser(
        uid: 0, // <<< 4. ใช้ uid (ไม่ใช่ id) และตั้งเป็น 0
        // เพราะ DB จะ auto-increment ให้เองตอน insert
        userId: remote.userId,
        userCode: remote.userCode,
        userName: remote.userName,
        position: remote.position,
        status: remote.status,

        // --- 5. เติมค่า default/null ให้ครบ ---
        password: null, // (API ไม่ได้ส่งมา)
        lastSync: null, // (API ไม่ได้ส่งมา)
        updatedAt: null, // (API ไม่ได้ส่งมา)
        isLocalSessionActive: false, // (API ไม่ได้ส่งมา)
      );
    }).toList();
  }

  @override
  String toJson(List<DbUser> object) {
    // (ตอนนี้ยังไม่ได้ใช้)
    return jsonEncode(object.map((user) => user.toJson()).toList());
  }
}

// คลาส UserSyncPage ที่เหลือเหมือนเดิม
@JsonSerializable(explicitToJson: true)
class UserSyncPage {
  @JsonKey(name: 'TotalPages')
  final int? totalPages;

  @JsonKey(name: 'Users')
  @StringToListDbUserConverter() // <<< ใช้ตัวแปลงที่อัปเดตแล้ว
  final List<DbUser> users;

  UserSyncPage({required this.totalPages, required this.users});

  factory UserSyncPage.fromJson(Map<String, dynamic> json) =>
      _$UserSyncPageFromJson(json);
  Map<String, dynamic> toJson() => _$UserSyncPageToJson(this);
}
