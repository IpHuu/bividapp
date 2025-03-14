// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_producer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProducerImpl _$$ProducerImplFromJson(Map<String, dynamic> json) =>
    _$ProducerImpl(
      id: (json['id'] as num?)?.toInt(),
      prd_manuf_name: json['prd_manuf_name'] as String?,
    );

Map<String, dynamic> _$$ProducerImplToJson(_$ProducerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prd_manuf_name': instance.prd_manuf_name,
    };
