import 'package:bividpharma/model/dtos/products/m_categories.dart';
import 'package:bividpharma/model/dtos/products/m_producer.dart';
import 'package:bividpharma/model/dtos/products/m_unit_product.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_product.freezed.dart';
part 'm_product.g.dart';

@freezed
class MProduct with _$MProduct {
  factory MProduct({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'prd_code') String? prdCode,
    @JsonKey(name: 'prd_name') String? prdName,
    @JsonKey(name: 'prd_active') String? prdActive,
    @JsonKey(name: 'prd_content') String? prdContent,
    @JsonKey(name: 'prd_sls') String? prdSls,
    @JsonKey(name: 'prd_origin_price') double? prdOriginPrice,
    @JsonKey(name: 'prd_sell_price') double? prdSellPrice,
    @JsonKey(name: 'prd_status') int? prdStatus,
    @JsonKey(name: 'prd_inventory') int? prdInventory,
    @JsonKey(name: 'prd_allownegative') int? prdAllowNegative,
    @JsonKey(name: 'prd_edit_price') int? prdEditPrice,
    @JsonKey(name: 'prd_manufacture_id') int? prdManufactureId,
    @JsonKey(name: 'prd_pack') String? prdPack,
    @JsonKey(name: 'prd_unit_id') int? prdUnitId,
    @JsonKey(name: 'prd_group_id') int? prdGroupId,
    @JsonKey(name: 'prd_image_url') String? prdImageUrl,
    @JsonKey(name: 'prd_thumb_url') String? prdThumbUrl,
    @JsonKey(name: 'prd_descriptions') String? prdDescriptions,
    @JsonKey(name: 'prd_hot') int? prdHot,
    @JsonKey(name: 'prd_new') int? prdNew,
    @JsonKey(name: 'prd_highlight') int? prdHighlight,
    @JsonKey(name: 'display_website') String? displayWebsite,
    @JsonKey(name: 'created') String? created,
    @JsonKey(name: 'updated') String? updated,
    @JsonKey(name: 'user_init') int? userInit,
    @JsonKey(name: 'user_upd') int? userUpd,
    @JsonKey(name: 'deleted') int? deleted,
    @JsonKey(name: 'company_id') String? companyId,
    @Default(false) bool isSelected,
    @Default(1) int quantity,
    @Default(0) double price,
    MCategory? category,
    MUnitProduct? unit,
    Producer? producer,
  }) = _MProduct;

  factory MProduct.fromJson(Map<String, dynamic> json) =>
      _$MProductFromJson(json);
}
