// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sync_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSyncPage _$UserSyncPageFromJson(Map<String, dynamic> json) => UserSyncPage(
  totalPages: (json['TotalPages'] as num?)?.toInt(),
  users: const StringToListDbUserConverter().fromJson(json['Users'] as String),
);

Map<String, dynamic> _$UserSyncPageToJson(UserSyncPage instance) =>
    <String, dynamic>{
      'TotalPages': instance.totalPages,
      'Users': const StringToListDbUserConverter().toJson(instance.users),
    };
