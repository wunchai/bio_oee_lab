// lib/data/models/remote_user.dart
import 'package:json_annotation/json_annotation.dart';

part 'remote_user.g.dart'; // <<< เดี๋ยวเราจะรัน build_runner เพื่อสร้างไฟล์นี้

@JsonSerializable()
class RemoteUser {
  // ใช้ @JsonKey เพื่อแมพชื่อจาก API (ตัวพิมพ์เล็ก/ใหญ่)
  @JsonKey(name: 'userId')
  final String? userId;

  @JsonKey(name: 'userCode')
  final String? userCode;

  @JsonKey(name: 'userName')
  final String? userName;

  @JsonKey(name: 'position')
  final String? position;

  // ⭐️⭐️⭐️ นี่คือตัวแก้ปัญหาครับ ⭐️⭐️⭐️
  @JsonKey(name: 'Status', defaultValue: 0) // API ส่ง 'S' ตัวใหญ่
  final int status; // โมเดลเรารับเป็น 's' ตัวเล็ก (และกัน null ด้วย defaultValue)

  RemoteUser({
    this.userId,
    this.userCode,
    this.userName,
    this.position,
    required this.status,
  });

  // คำสั่งสำหรับ json_serializable
  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserToJson(this);
}
