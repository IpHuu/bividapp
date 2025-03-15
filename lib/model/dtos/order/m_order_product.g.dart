// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_order_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MOrderProductListImpl _$$MOrderProductListImplFromJson(
        Map<String, dynamic> json) =>
    _$MOrderProductListImpl(
      id: (json['ID'] as num?)?.toInt(),
      productName: json['product_name'] as String? ?? "",
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      bid_id: (json['bid_id'] as num?)?.toInt(),
      order_id: (json['order_id'] as num?)?.toInt(),
      product_id: (json['product_id'] as num?)?.toInt(),
      product_code: json['product_code'] as String?,
      is_bids: (json['is_bids'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MOrderProductListImplToJson(
        _$MOrderProductListImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'price': instance.price,
      'bid_id': instance.bid_id,
      'order_id': instance.order_id,
      'product_id': instance.product_id,
      'product_code': instance.product_code,
      'is_bids': instance.is_bids,
    };
