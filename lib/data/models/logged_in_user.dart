// lib/data/models/logged_in_user.dart

import 'package:json_annotation/json_annotation.dart';
// ⚠️ แก้ชื่อ 'bio_oee_lab' ให้เป็นชื่อโปรเจกต์ของคุณ
import 'package:bio_oee_lab/data/database/app_database.dart'; // Import your main database
import 'package:bio_oee_lab/data/database/tables/user_table.dart';
import 'package:bio_oee_lab/data/models/package_data.dart';

part 'logged_in_user.g.dart'; // <<< อย่าลืมรัน build_runner

/// ว่าจะจัดการกับคลาส DbUser ที่มาจาก Drift อย่างไร
class DbUserConverter implements JsonConverter<DbUser, Map<String, dynamic>> {
  const DbUserConverter();

  @override
  DbUser fromJson(Map<String, dynamic> json) {
    // บอกให้มันใช้ .fromJson() ที่ Drift สร้างให้ DbUser
    return DbUser.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(DbUser object) {
    // บอกให้มันใช้ .toJson() ที่ Drift สร้างให้ DbUser
    return object.toJson();
  }
}

@JsonSerializable(
  // ⬇️⬇️⬇️ FIX 4: เพิ่ม explicitToJson: true ที่นี่ ⬇️⬇️⬇️
  // เพื่อบอกให้มันแปลง List<PackageData> ข้างในให้ด้วย
  explicitToJson: true,
)
class LoggedInUser {
  // ⬇️⬇️⬇️ FIX 5: ใช้ @DbUserConverter() คู่กับ @JsonKey ⬇️⬇️⬇️
  @JsonKey(name: 'User') // บอกว่า Key ใน JSON คือ 'User'
  @DbUserConverter() // บอกว่าให้ใช้ตัวแปลง 'DbUserConverter'
  final DbUser user; // ตัวแปรในคลาสของเราชื่อ 'user'

  @JsonKey(name: 'Token')
  final String token;

  // ⬇️⬇️⬇️ FIX 6: ลบ @JsonKey(name: 'Packages') ธรรมดาออก ⬇️⬇️⬇️
  // (เพราะเรากำหนด explicitToJson ที่ด้านบนแล้ว)
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
