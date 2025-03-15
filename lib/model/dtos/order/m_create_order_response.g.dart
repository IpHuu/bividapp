// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MCreateOrderResponseImpl _$$MCreateOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MCreateOrderResponseImpl(
      message: json['message'] as String? ?? "",
      orderID: (json['order_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MCreateOrderResponseImplToJson(
        _$MCreateOrderResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order_id': instance.orderID,
    };
