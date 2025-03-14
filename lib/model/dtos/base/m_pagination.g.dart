// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MPaginationImpl _$$MPaginationImplFromJson(Map<String, dynamic> json) =>
    _$MPaginationImpl(
      current_page: (json['current_page'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      last_page: (json['last_page'] as num?)?.toInt() ?? 0,
      per_page: (json['per_page'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MPaginationImplToJson(_$MPaginationImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'total': instance.total,
      'last_page': instance.last_page,
      'per_page': instance.per_page,
    };
