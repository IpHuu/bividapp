// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MCustomerImpl _$$MCustomerImplFromJson(Map<String, dynamic> json) =>
    _$MCustomerImpl(
      id: (json['ID'] as num?)?.toInt(),
      customer_name: json['customer_name'] as String? ?? "",
      customer_code: json['customer_code'] as String? ?? "",
      customer_phone: json['customer_phone'] as String? ?? "",
      customer_email: json['customer_email'] as String? ?? "",
      customer_addr: json['customer_addr'] as String? ?? "",
      customer_ship_addr: json['customer_ship_addr'] as String? ?? "",
      customer_image: json['customer_image'] as String? ?? "",
      notes: json['notes'] as String? ?? "",
      customer_birthday: json['customer_birthday'] as String? ?? "",
      customer_gender: json['customer_gender'] as String? ?? "",
      created: json['created'] as String? ?? "",
      updated: json['updated'] as String? ?? "",
      user_init: (json['user_init'] as num?)?.toInt(),
      user_upd: (json['user_upd'] as num?)?.toInt(),
      user_admin: json['user_admin'] as String? ?? "",
      user_list: json['user_list'] as String? ?? "",
      store_id: (json['store_id'] as num?)?.toInt(),
      customer_type: (json['customer_type'] as num?)?.toInt(),
      list_products: json['list_products'] as String? ?? "",
      code: json['code'] as String? ?? "",
      ttpketoan: json['ttpketoan'] as String? ?? "",
      ttpbanhang: json['ttpbanhang'] as String? ?? "",
      tttruongkhoa: json['tttruongkhoa'] as String? ?? "",
      user_assigned: json['user_assigned'] as String? ?? "",
      company_id: json['company_id'] as String? ?? "",
    );

Map<String, dynamic> _$$MCustomerImplToJson(_$MCustomerImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'customer_name': instance.customer_name,
      'customer_code': instance.customer_code,
      'customer_phone': instance.customer_phone,
      'customer_email': instance.customer_email,
      'customer_addr': instance.customer_addr,
      'customer_ship_addr': instance.customer_ship_addr,
      'customer_image': instance.customer_image,
      'notes': instance.notes,
      'customer_birthday': instance.customer_birthday,
      'customer_gender': instance.customer_gender,
      'created': instance.created,
      'updated': instance.updated,
      'user_init': instance.user_init,
      'user_upd': instance.user_upd,
      'user_admin': instance.user_admin,
      'user_list': instance.user_list,
      'store_id': instance.store_id,
      'customer_type': instance.customer_type,
      'list_products': instance.list_products,
      'code': instance.code,
      'ttpketoan': instance.ttpketoan,
      'ttpbanhang': instance.ttpbanhang,
      'tttruongkhoa': instance.tttruongkhoa,
      'user_assigned': instance.user_assigned,
      'company_id': instance.company_id,
    };
