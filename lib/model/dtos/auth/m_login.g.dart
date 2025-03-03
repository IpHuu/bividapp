// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$MLoginImpl _$$$MLoginImplFromJson(Map<String, dynamic> json) =>
    _$$MLoginImpl(
      userName: json['userName'] as String? ?? "",
      fullName: json['fullName'] as String? ?? "",
      password: json['password'] as String? ?? "",
      deviceName: json['deviceName'] as String? ?? "",
      deviceIpv4: json['deviceIpv4'] as String? ?? "",
      publicIpv4: json['publicIpv4'] as String? ?? "",
      publicIpv6: json['publicIpv6'] as String? ?? "",
    );

Map<String, dynamic> _$$$MLoginImplToJson(_$$MLoginImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'fullName': instance.fullName,
      'password': instance.password,
      'deviceName': instance.deviceName,
      'deviceIpv4': instance.deviceIpv4,
      'publicIpv4': instance.publicIpv4,
      'publicIpv6': instance.publicIpv6,
    };
