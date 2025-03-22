// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_authen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      deviceName: json['deviceName'] as String,
      deviceIpv4: json['deviceIpv4'] as String,
      publicIpv4: json['publicIpv4'] as String,
      publicIpv6: json['publicIpv6'] as String,
      companyCode: json['companyCode'] as String,
      tokenId: json['tokenId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userFullName: json['userFullName'] as String,
      positionName: json['positionName'] as String,
      validaty: json['validaty'] as String,
      refreshToken: json['refreshToken'] as String,
      email: json['email'] as String,
      expiredTime: json['expiredTime'] as String,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'deviceIpv4': instance.deviceIpv4,
      'publicIpv4': instance.publicIpv4,
      'publicIpv6': instance.publicIpv6,
      'companyCode': instance.companyCode,
      'tokenId': instance.tokenId,
      'userId': instance.userId,
      'userName': instance.userName,
      'userFullName': instance.userFullName,
      'positionName': instance.positionName,
      'validaty': instance.validaty,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
      'expiredTime': instance.expiredTime,
    };
