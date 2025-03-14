// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseImpl<T> _$$BaseResponseImplFromJson<T>(
        Map<String, dynamic> json) =>
    _$BaseResponseImpl<T>(
      success: json['success'] as bool,
      message: json['message'] as String,
      count: (json['count'] as num).toInt(),
      validationErrors: (json['validationErrors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      data: _dataFromJson(json['data']),
    );

Map<String, dynamic> _$$BaseResponseImplToJson<T>(
        _$BaseResponseImpl<T> instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'count': instance.count,
      'validationErrors': instance.validationErrors,
      'data': _dataToJson(instance.data),
    };
