// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_orderlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MOrderListImpl _$$MOrderListImplFromJson(Map<String, dynamic> json) =>
    _$MOrderListImpl(
      current_page: (json['current_page'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MOrderListImplToJson(_$MOrderListImpl instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'total': instance.total,
    };
