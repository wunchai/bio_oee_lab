// lib/data/models/logged_in_user.dart

import 'package_data.dart'; // <<< ⚠️ เดี๋ยวเราจะสร้างไฟล์นี้ในขั้นตอนถัดไป
import 'package:json_annotation/json_annotation.dart';

// ⚠️ สำคัญ: แก้ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/tables/user_table.dart';

part 'logged_in_user.g.dart'; // <<< นี่คือไฟล์ที่จะถูก Generate อัตโนมัติ

@JsonSerializable()
class LoggedInUser {
  final UserData user; // ข้อมูล User จากตาราง User (Drift)
  final String token; // Token ที่ได้จาก Server (ถ้ามี)
  final List<PackageData> packages; // รายการสิทธิ์การใช้งาน (ถ้ามี)

  LoggedInUser({
    required this.user,
    required this.token,
    required this.packages,
  });

  // --- JSON Serialization ---
  factory LoggedInUser.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserFromJson(json);

  Map<String, dynamic> toJson() => _$LoggedInUserToJson(this);
}
