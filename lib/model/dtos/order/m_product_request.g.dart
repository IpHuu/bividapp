// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MProductRequestImpl _$$MProductRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MProductRequestImpl(
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      name: json['name'] as String,
      productCode: json['maProduct'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$MProductRequestImplToJson(
        _$MProductRequestImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'name': instance.name,
      'maProduct': instance.productCode,
      'price': instance.price,
    };
