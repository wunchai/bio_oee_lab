// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedInUser _$LoggedInUserFromJson(Map<String, dynamic> json) => LoggedInUser(
  user: const DbUserConverter().fromJson(json['User'] as Map<String, dynamic>),
  token: json['Token'] as String,
  packages: (json['packages'] as List<dynamic>)
      .map((e) => PackageData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LoggedInUserToJson(LoggedInUser instance) =>
    <String, dynamic>{
      'User': const DbUserConverter().toJson(instance.user),
      'Token': instance.token,
      'packages': instance.packages.map((e) => e.toJson()).toList(),
    };
