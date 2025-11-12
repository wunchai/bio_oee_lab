// lib/data/models/logged_in_user.dart

import 'package:json_annotation/json_annotation.dart';
// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
import 'package:bio_oee_lab/data/models/package_data.dart';

part 'logged_in_user.g.dart'; // <<< อย่าลืมรัน build_runner

// คลาสนี้ใช้สำหรับห่อหุ้มข้อมูลทั้งหมดที่ได้รับหลังจากการ Login สำเร็จ
// (ไม่ใช่ Model ที่ใช้กับ Drift/Database โดยตรง)
@JsonSerializable()
class LoggedInUser {
  // ข้อมูล User หลัก (จากตาราง User)
  @JsonKey(name: 'User')
  final UserData user;

  // Token ที่ใช้ในการเรียก API ครั้งถัดไป
  @JsonKey(name: 'Token')
  final String token;

  // รายการสิทธิ์/แพ็กเกจของผู้ใช้
  @JsonKey(name: 'Packages')
  final List<PackageData> packages;

  LoggedInUser({
    required this.user,
    required this.token,
    required this.packages,
  });

  factory LoggedInUser.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedInUserToJson(this);
}
