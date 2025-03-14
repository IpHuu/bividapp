// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MOrderImpl _$$MOrderImplFromJson(Map<String, dynamic> json) => _$MOrderImpl(
      id: (json['id'] as num?)?.toInt(),
      output_code: json['output_code'] as String?,
      customer_id: (json['customer_id'] as num?)?.toInt(),
      customerName: json['customer_name'] as String? ?? "",
      userOrder: json['user_order'] as String? ?? "",
      storeName: json['store_name'] as String? ?? "",
      statusName: json['status_name'] as String? ?? "",
      companyName: json['company_name'] as String? ?? "",
      created: json['created'] as String? ?? "",
      total_money: (json['total_money'] as num?)?.toInt() ?? 0,
      store_id: (json['store_id'] as num?)?.toInt(),
      company_id: json['company_id'] as String?,
    );

Map<String, dynamic> _$$MOrderImplToJson(_$MOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'output_code': instance.output_code,
      'customer_id': instance.customer_id,
      'customer_name': instance.customerName,
      'user_order': instance.userOrder,
      'store_name': instance.storeName,
      'status_name': instance.statusName,
      'company_name': instance.companyName,
      'created': instance.created,
      'total_money': instance.total_money,
      'store_id': instance.store_id,
      'company_id': instance.company_id,
    };
