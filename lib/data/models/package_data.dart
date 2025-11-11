// lib/data/models/package_data.dart
import 'package:json_annotation/json_annotation.dart';

part 'package_data.g.dart'; // <<< นี่คือไฟล์ที่จะถูก Generate อัตโนมัติ

@JsonSerializable()
class PackageData {
  final String? packageId;
  final String? packageName;

  PackageData({
    this.packageId,
    this.packageName,
  });

  // --- JSON Serialization ---
  factory PackageData.fromJson(Map<String, dynamic> json) =>
      _$PackageDataFromJson(json);

  Map<String, dynamic> toJson() => _$PackageDataToJson(this);
}
