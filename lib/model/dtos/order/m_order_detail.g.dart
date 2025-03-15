// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MOrderDetailImpl _$$MOrderDetailImplFromJson(Map<String, dynamic> json) =>
    _$MOrderDetailImpl(
      id: (json['ID'] as num?)?.toInt(),
      outputCode: json['output_code'] as String?,
      customerId: (json['customer_id'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      inputId: (json['input_id'] as num?)?.toInt(),
      sellDate: (json['sell_date'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      paymentMethod: (json['payment_method'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toInt(),
      totalOriginPrice: (json['total_origin_price'] as num?)?.toInt(),
      discountItem: (json['discount_item'] as num?)?.toInt(),
      coupon: json['coupon'] as String?,
      customerPay: (json['customer_pay'] as num?)?.toInt(),
      vat: (json['vat'] as num?)?.toInt(),
      totalMoney: (json['total_money'] as num?)?.toInt() ?? 0,
      totalQuantity: (json['total_quantity'] as num?)?.toInt() ?? 0,
      lack: (json['lack'] as num?)?.toInt(),
      orderDetails: (json['order_details'] as List<dynamic>?)
          ?.map((e) => MOrderProductList.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderStatus: (json['order_status'] as num?)?.toInt(),
      deleted: (json['deleted'] as num?)?.toInt(),
      created: json['created'] as String?,
      updated: (json['updated'] as num?)?.toInt(),
      userInit: (json['user_init'] as num?)?.toInt(),
      userUpd: (json['user_upd'] as num?)?.toInt(),
      userIp: json['user_ip'] as String?,
      saleId: (json['sale_id'] as num?)?.toInt(),
      canReturn: (json['canreturn'] as num?)?.toInt(),
      attachFile: json['attach_file'] as String?,
      mtc: json['mtc'] as String?,
      companyId: json['company_id'] as String?,
      statusName: json['status'] == null
          ? ""
          : _statusNameFromJson(json['status'] as Map<String, dynamic>?),
      customerName: json['company'] == null
          ? ""
          : _customerNameFromJson(json['company'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$MOrderDetailImplToJson(_$MOrderDetailImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'output_code': instance.outputCode,
      'customer_id': instance.customerId,
      'store_id': instance.storeId,
      'input_id': instance.inputId,
      'sell_date': instance.sellDate,
      'notes': instance.notes,
      'payment_method': instance.paymentMethod,
      'total_price': instance.totalPrice,
      'total_origin_price': instance.totalOriginPrice,
      'discount_item': instance.discountItem,
      'coupon': instance.coupon,
      'customer_pay': instance.customerPay,
      'vat': instance.vat,
      'total_money': instance.totalMoney,
      'total_quantity': instance.totalQuantity,
      'lack': instance.lack,
      'order_details': instance.orderDetails,
      'order_status': instance.orderStatus,
      'deleted': instance.deleted,
      'created': instance.created,
      'updated': instance.updated,
      'user_init': instance.userInit,
      'user_upd': instance.userUpd,
      'user_ip': instance.userIp,
      'sale_id': instance.saleId,
      'canreturn': instance.canReturn,
      'attach_file': instance.attachFile,
      'mtc': instance.mtc,
      'company_id': instance.companyId,
      'status': instance.statusName,
      'company': instance.customerName,
    };
