// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUser _$RemoteUserFromJson(Map<String, dynamic> json) => RemoteUser(
  userId: json['userId'] as String?,
  userCode: json['userCode'] as String?,
  userName: json['userName'] as String?,
  position: json['position'] as String?,
  status: (json['Status'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RemoteUserToJson(RemoteUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userCode': instance.userCode,
      'userName': instance.userName,
      'position': instance.position,
      'Status': instance.status,
    };
