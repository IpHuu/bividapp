// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MProductImpl _$$MProductImplFromJson(Map<String, dynamic> json) =>
    _$MProductImpl(
      id: (json['ID'] as num?)?.toInt(),
      prdCode: json['prd_code'] as String?,
      prdName: json['prd_name'] as String?,
      prdActive: json['prd_active'] as String?,
      prdContent: json['prd_content'] as String?,
      prdSls: json['prd_sls'] as String?,
      prdOriginPrice: (json['prd_origin_price'] as num?)?.toDouble(),
      prdSellPrice: (json['prd_sell_price'] as num?)?.toDouble(),
      prdStatus: (json['prd_status'] as num?)?.toInt(),
      prdInventory: (json['prd_inventory'] as num?)?.toInt(),
      prdAllowNegative: (json['prd_allownegative'] as num?)?.toInt(),
      prdEditPrice: (json['prd_edit_price'] as num?)?.toInt(),
      prdManufactureId: (json['prd_manufacture_id'] as num?)?.toInt(),
      prdPack: json['prd_pack'] as String?,
      prdUnitId: (json['prd_unit_id'] as num?)?.toInt(),
      prdGroupId: (json['prd_group_id'] as num?)?.toInt(),
      prdImageUrl: json['prd_image_url'] as String?,
      prdThumbUrl: json['prd_thumb_url'] as String?,
      prdDescriptions: json['prd_descriptions'] as String?,
      prdHot: (json['prd_hot'] as num?)?.toInt(),
      prdNew: (json['prd_new'] as num?)?.toInt(),
      prdHighlight: (json['prd_highlight'] as num?)?.toInt(),
      displayWebsite: json['display_website'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
      userInit: (json['user_init'] as num?)?.toInt(),
      userUpd: (json['user_upd'] as num?)?.toInt(),
      deleted: (json['deleted'] as num?)?.toInt(),
      companyId: json['company_id'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      category: json['category'] == null
          ? null
          : MCategory.fromJson(json['category'] as Map<String, dynamic>),
      unit: json['unit'] == null
          ? null
          : MUnitProduct.fromJson(json['unit'] as Map<String, dynamic>),
      producer: json['producer'] == null
          ? null
          : Producer.fromJson(json['producer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MProductImplToJson(_$MProductImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'prd_code': instance.prdCode,
      'prd_name': instance.prdName,
      'prd_active': instance.prdActive,
      'prd_content': instance.prdContent,
      'prd_sls': instance.prdSls,
      'prd_origin_price': instance.prdOriginPrice,
      'prd_sell_price': instance.prdSellPrice,
      'prd_status': instance.prdStatus,
      'prd_inventory': instance.prdInventory,
      'prd_allownegative': instance.prdAllowNegative,
      'prd_edit_price': instance.prdEditPrice,
      'prd_manufacture_id': instance.prdManufactureId,
      'prd_pack': instance.prdPack,
      'prd_unit_id': instance.prdUnitId,
      'prd_group_id': instance.prdGroupId,
      'prd_image_url': instance.prdImageUrl,
      'prd_thumb_url': instance.prdThumbUrl,
      'prd_descriptions': instance.prdDescriptions,
      'prd_hot': instance.prdHot,
      'prd_new': instance.prdNew,
      'prd_highlight': instance.prdHighlight,
      'display_website': instance.displayWebsite,
      'created': instance.created,
      'updated': instance.updated,
      'user_init': instance.userInit,
      'user_upd': instance.userUpd,
      'deleted': instance.deleted,
      'company_id': instance.companyId,
      'isSelected': instance.isSelected,
      'quantity': instance.quantity,
      'price': instance.price,
      'category': instance.category,
      'unit': instance.unit,
      'producer': instance.producer,
    };
