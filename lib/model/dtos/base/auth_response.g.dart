// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      exception: json['exception'] as String?,
      status: (json['status'] as num).toInt(),
      isCanceled: json['isCanceled'] as bool,
      isCompleted: json['isCompleted'] as bool,
      isCompletedSuccessfully: json['isCompletedSuccessfully'] as bool,
      creationOptions: (json['creationOptions'] as num).toInt(),
      asyncState: json['asyncState'] as String?,
      isFaulted: json['isFaulted'] as bool,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'id': instance.id,
      'exception': instance.exception,
      'status': instance.status,
      'isCanceled': instance.isCanceled,
      'isCompleted': instance.isCompleted,
      'isCompletedSuccessfully': instance.isCompletedSuccessfully,
      'creationOptions': instance.creationOptions,
      'asyncState': instance.asyncState,
      'isFaulted': instance.isFaulted,
    };
