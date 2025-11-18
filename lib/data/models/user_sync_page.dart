// lib/data/models/user_sync_page.dart

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/app_database.dart'; // Import your main database
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
// ⬇️⬇️⬇️ เราจะยืมตัวแปลง DbUserConverter มาจาก logged_in_user.dart ⬇️⬇️⬇️
import 'package:bio_oee_lab/data/models/logged_in_user.dart';

part 'user_sync_page.g.dart'; // <<< รัน build_runner หลังสร้างไฟล์นี้

class StringToListDbUserConverter
    implements JsonConverter<List<DbUser>, String> {
  const StringToListDbUserConverter();

  @override
  List<DbUser> fromJson(String jsonString) {
    // 1. Decode String ภายนอก
    final List<dynamic> list = jsonDecode(jsonString);
    // 2. Map แต่ละรายการใน List ด้วย DbUser.fromJson

    return list
        .map((item) => DbUser.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  String toJson(List<DbUser> object) {
    // (แปลงกลับเป็น String - ตอนนี้ยังไม่ได้ใช้ แต่ควรมีไว้)
    return jsonEncode(object.map((user) => user.toJson()).toList());
  }
}

@JsonSerializable(explicitToJson: true)
class UserSyncPage {
  // ⚠️ Key 'TotalPages' และ 'Users' ต้องตรงกับที่ API ส่งกลับมา
  @JsonKey(name: 'TotalPages')
  final int? totalPages; // <<< จาก int เป็น int?

  @JsonKey(name: 'Users')
  @StringToListDbUserConverter() // <<< บอกให้ใช้ตัวแปลงนี้
  final List<DbUser> users;

  UserSyncPage({required this.totalPages, required this.users});

  factory UserSyncPage.fromJson(Map<String, dynamic> json) =>
      _$UserSyncPageFromJson(json);
  Map<String, dynamic> toJson() => _$UserSyncPageToJson(this);
}
