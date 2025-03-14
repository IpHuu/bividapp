// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MOrderRequestImpl _$$MOrderRequestImplFromJson(Map<String, dynamic> json) =>
    _$MOrderRequestImpl(
      customerId: (json['customer_id'] as num).toInt(),
      notes: json['notes'] as String?,
      totalQuantity: (json['total_quantity'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      idStatus: (json['id_status'] as num?)?.toInt(),
      product: (json['product'] as List<dynamic>)
          .map((e) => MProductRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MOrderRequestImplToJson(_$MOrderRequestImpl instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'notes': instance.notes,
      'total_quantity': instance.totalQuantity,
      'total_price': instance.totalPrice,
      'id_status': instance.idStatus,
      'product': instance.product,
    };
