// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageData _$PackageDataFromJson(Map<String, dynamic> json) => PackageData(
  packageId: (json['PackageID'] as num).toInt(),
  packageName: json['PackageName'] as String,
  description: json['Description'] as String,
  isActive: json['IsActive'] as bool,
);

Map<String, dynamic> _$PackageDataToJson(PackageData instance) =>
    <String, dynamic>{
      'PackageID': instance.packageId,
      'PackageName': instance.packageName,
      'Description': instance.description,
      'IsActive': instance.isActive,
    };
