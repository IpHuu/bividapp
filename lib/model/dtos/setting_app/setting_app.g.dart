// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$SettingAppImpl _$$$SettingAppImplFromJson(Map<String, dynamic> json) =>
    _$$SettingAppImpl(
      fingerEnabled: json['fingerEnabled'] as bool? ?? false,
      themeColor: (json['themeColor'] as num?)?.toInt() ?? 1,
      cachedUserCode: json['cachedUserCode'] as String?,
      cachedSecretCode: json['cachedSecretCode'] as String?,
      rememberMe: json['rememberMe'] as bool? ?? false,
      fingerUser: json['fingerUser'] as String?,
      fingerSecretCode: json['fingerSecretCode'] as String?,
    );

Map<String, dynamic> _$$$SettingAppImplToJson(_$$SettingAppImpl instance) =>
    <String, dynamic>{
      'fingerEnabled': instance.fingerEnabled,
      'themeColor': instance.themeColor,
      'cachedUserCode': instance.cachedUserCode,
      'cachedSecretCode': instance.cachedSecretCode,
      'rememberMe': instance.rememberMe,
      'fingerUser': instance.fingerUser,
      'fingerSecretCode': instance.fingerSecretCode,
    };
