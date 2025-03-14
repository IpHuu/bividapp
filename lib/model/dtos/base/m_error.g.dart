// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MErrorImpl _$$MErrorImplFromJson(Map<String, dynamic> json) => _$MErrorImpl(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$MErrorImplToJson(_$MErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
