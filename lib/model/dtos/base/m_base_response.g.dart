// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MBaseResponseImpl<T> _$$MBaseResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$MBaseResponseImpl<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      count: (json['count'] as num?)?.toInt(),
      validationErrors: (json['validationErrors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : MPagination.fromJson(json['pagination'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : MError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MBaseResponseImplToJson<T>(
  _$MBaseResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'success': instance.success,
      'message': instance.message,
      'count': instance.count,
      'validationErrors': instance.validationErrors,
      'pagination': instance.pagination,
      'error': instance.error,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
