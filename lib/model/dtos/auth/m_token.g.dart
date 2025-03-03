// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MTokenImpl _$$MTokenImplFromJson(Map<String, dynamic> json) => _$MTokenImpl(
      userid: json['userid'] as String? ?? "",
      userName: json['userName'] as String? ?? "",
      userFullName: json['userFullName'] as String? ?? "",
      email: json['email'] as String? ?? "",
      refreshToken: json['refreshToken'] as String? ?? "",
      validaty: json['validaty'] == null
          ? null
          : DateTime.parse(json['validaty'] as String),
      expireTime: json['expireTime'] == null
          ? null
          : DateTime.parse(json['expireTime'] as String),
      tokenId: json['tokenId'] as String? ?? "",
    );

Map<String, dynamic> _$$MTokenImplToJson(_$MTokenImpl instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'userName': instance.userName,
      'userFullName': instance.userFullName,
      'email': instance.email,
      'refreshToken': instance.refreshToken,
      'validaty': instance.validaty?.toIso8601String(),
      'expireTime': instance.expireTime?.toIso8601String(),
      'tokenId': instance.tokenId,
    };
