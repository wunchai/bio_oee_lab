// lib/data/models/package_data.dart
import 'package:json_annotation/json_annotation.dart';

part 'package_data.g.dart'; // <<< นี่คือไฟล์ที่จะถูก Generate อัตโนมัติ

@JsonSerializable()
class PackageData {
  @JsonKey(name: 'PackageID')
  final int packageId;

  @JsonKey(name: 'PackageName')
  final String packageName;

  @JsonKey(name: 'Description')
  final String description;

  @JsonKey(name: 'IsActive')
  final bool isActive;

  PackageData({
    required this.packageId,
    required this.packageName,
    required this.description,
    required this.isActive,
  });

  factory PackageData.fromJson(Map<String, dynamic> json) =>
      _$PackageDataFromJson(json);
  Map<String, dynamic> toJson() => _$PackageDataToJson(this);
}
