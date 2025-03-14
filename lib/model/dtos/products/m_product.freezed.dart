// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MProduct _$MProductFromJson(Map<String, dynamic> json) {
  return _MProduct.fromJson(json);
}

/// @nodoc
mixin _$MProduct {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_code')
  String? get prdCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_name')
  String? get prdName => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_active')
  String? get prdActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_content')
  String? get prdContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_sls')
  String? get prdSls => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_origin_price')
  double? get prdOriginPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_sell_price')
  double? get prdSellPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_status')
  int? get prdStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_inventory')
  int? get prdInventory => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_allownegative')
  int? get prdAllowNegative => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_edit_price')
  int? get prdEditPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_manufacture_id')
  int? get prdManufactureId => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_pack')
  String? get prdPack => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_unit_id')
  int? get prdUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_group_id')
  int? get prdGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_image_url')
  String? get prdImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_thumb_url')
  String? get prdThumbUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_descriptions')
  String? get prdDescriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_hot')
  int? get prdHot => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_new')
  int? get prdNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'prd_highlight')
  int? get prdHighlight => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_website')
  String? get displayWebsite => throw _privateConstructorUsedError;
  @JsonKey(name: 'created')
  String? get created => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated')
  String? get updated => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_init')
  int? get userInit => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_upd')
  int? get userUpd => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted')
  int? get deleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  String? get companyId => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  MCategory? get category => throw _privateConstructorUsedError;
  MUnitProduct? get unit => throw _privateConstructorUsedError;
  Producer? get producer => throw _privateConstructorUsedError;

  /// Serializes this MProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MProductCopyWith<MProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MProductCopyWith<$Res> {
  factory $MProductCopyWith(MProduct value, $Res Function(MProduct) then) =
      _$MProductCopyWithImpl<$Res, MProduct>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      bool isSelected,
      int quantity,
      double price,
      MCategory? category,
      MUnitProduct? unit,
      Producer? producer});

  $MCategoryCopyWith<$Res>? get category;
  $MUnitProductCopyWith<$Res>? get unit;
  $ProducerCopyWith<$Res>? get producer;
}

/// @nodoc
class _$MProductCopyWithImpl<$Res, $Val extends MProduct>
    implements $MProductCopyWith<$Res> {
  _$MProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prdCode = freezed,
    Object? prdName = freezed,
    Object? prdActive = freezed,
    Object? prdContent = freezed,
    Object? prdSls = freezed,
    Object? prdOriginPrice = freezed,
    Object? prdSellPrice = freezed,
    Object? prdStatus = freezed,
    Object? prdInventory = freezed,
    Object? prdAllowNegative = freezed,
    Object? prdEditPrice = freezed,
    Object? prdManufactureId = freezed,
    Object? prdPack = freezed,
    Object? prdUnitId = freezed,
    Object? prdGroupId = freezed,
    Object? prdImageUrl = freezed,
    Object? prdThumbUrl = freezed,
    Object? prdDescriptions = freezed,
    Object? prdHot = freezed,
    Object? prdNew = freezed,
    Object? prdHighlight = freezed,
    Object? displayWebsite = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? userInit = freezed,
    Object? userUpd = freezed,
    Object? deleted = freezed,
    Object? companyId = freezed,
    Object? isSelected = null,
    Object? quantity = null,
    Object? price = null,
    Object? category = freezed,
    Object? unit = freezed,
    Object? producer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      prdCode: freezed == prdCode
          ? _value.prdCode
          : prdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      prdName: freezed == prdName
          ? _value.prdName
          : prdName // ignore: cast_nullable_to_non_nullable
              as String?,
      prdActive: freezed == prdActive
          ? _value.prdActive
          : prdActive // ignore: cast_nullable_to_non_nullable
              as String?,
      prdContent: freezed == prdContent
          ? _value.prdContent
          : prdContent // ignore: cast_nullable_to_non_nullable
              as String?,
      prdSls: freezed == prdSls
          ? _value.prdSls
          : prdSls // ignore: cast_nullable_to_non_nullable
              as String?,
      prdOriginPrice: freezed == prdOriginPrice
          ? _value.prdOriginPrice
          : prdOriginPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      prdSellPrice: freezed == prdSellPrice
          ? _value.prdSellPrice
          : prdSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      prdStatus: freezed == prdStatus
          ? _value.prdStatus
          : prdStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      prdInventory: freezed == prdInventory
          ? _value.prdInventory
          : prdInventory // ignore: cast_nullable_to_non_nullable
              as int?,
      prdAllowNegative: freezed == prdAllowNegative
          ? _value.prdAllowNegative
          : prdAllowNegative // ignore: cast_nullable_to_non_nullable
              as int?,
      prdEditPrice: freezed == prdEditPrice
          ? _value.prdEditPrice
          : prdEditPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      prdManufactureId: freezed == prdManufactureId
          ? _value.prdManufactureId
          : prdManufactureId // ignore: cast_nullable_to_non_nullable
              as int?,
      prdPack: freezed == prdPack
          ? _value.prdPack
          : prdPack // ignore: cast_nullable_to_non_nullable
              as String?,
      prdUnitId: freezed == prdUnitId
          ? _value.prdUnitId
          : prdUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      prdGroupId: freezed == prdGroupId
          ? _value.prdGroupId
          : prdGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      prdImageUrl: freezed == prdImageUrl
          ? _value.prdImageUrl
          : prdImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prdThumbUrl: freezed == prdThumbUrl
          ? _value.prdThumbUrl
          : prdThumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prdDescriptions: freezed == prdDescriptions
          ? _value.prdDescriptions
          : prdDescriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      prdHot: freezed == prdHot
          ? _value.prdHot
          : prdHot // ignore: cast_nullable_to_non_nullable
              as int?,
      prdNew: freezed == prdNew
          ? _value.prdNew
          : prdNew // ignore: cast_nullable_to_non_nullable
              as int?,
      prdHighlight: freezed == prdHighlight
          ? _value.prdHighlight
          : prdHighlight // ignore: cast_nullable_to_non_nullable
              as int?,
      displayWebsite: freezed == displayWebsite
          ? _value.displayWebsite
          : displayWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      userInit: freezed == userInit
          ? _value.userInit
          : userInit // ignore: cast_nullable_to_non_nullable
              as int?,
      userUpd: freezed == userUpd
          ? _value.userUpd
          : userUpd // ignore: cast_nullable_to_non_nullable
              as int?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MCategory?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MUnitProduct?,
      producer: freezed == producer
          ? _value.producer
          : producer // ignore: cast_nullable_to_non_nullable
              as Producer?,
    ) as $Val);
  }

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $MCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MUnitProductCopyWith<$Res>? get unit {
    if (_value.unit == null) {
      return null;
    }

    return $MUnitProductCopyWith<$Res>(_value.unit!, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProducerCopyWith<$Res>? get producer {
    if (_value.producer == null) {
      return null;
    }

    return $ProducerCopyWith<$Res>(_value.producer!, (value) {
      return _then(_value.copyWith(producer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MProductImplCopyWith<$Res>
    implements $MProductCopyWith<$Res> {
  factory _$$MProductImplCopyWith(
          _$MProductImpl value, $Res Function(_$MProductImpl) then) =
      __$$MProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      bool isSelected,
      int quantity,
      double price,
      MCategory? category,
      MUnitProduct? unit,
      Producer? producer});

  @override
  $MCategoryCopyWith<$Res>? get category;
  @override
  $MUnitProductCopyWith<$Res>? get unit;
  @override
  $ProducerCopyWith<$Res>? get producer;
}

/// @nodoc
class __$$MProductImplCopyWithImpl<$Res>
    extends _$MProductCopyWithImpl<$Res, _$MProductImpl>
    implements _$$MProductImplCopyWith<$Res> {
  __$$MProductImplCopyWithImpl(
      _$MProductImpl _value, $Res Function(_$MProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prdCode = freezed,
    Object? prdName = freezed,
    Object? prdActive = freezed,
    Object? prdContent = freezed,
    Object? prdSls = freezed,
    Object? prdOriginPrice = freezed,
    Object? prdSellPrice = freezed,
    Object? prdStatus = freezed,
    Object? prdInventory = freezed,
    Object? prdAllowNegative = freezed,
    Object? prdEditPrice = freezed,
    Object? prdManufactureId = freezed,
    Object? prdPack = freezed,
    Object? prdUnitId = freezed,
    Object? prdGroupId = freezed,
    Object? prdImageUrl = freezed,
    Object? prdThumbUrl = freezed,
    Object? prdDescriptions = freezed,
    Object? prdHot = freezed,
    Object? prdNew = freezed,
    Object? prdHighlight = freezed,
    Object? displayWebsite = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? userInit = freezed,
    Object? userUpd = freezed,
    Object? deleted = freezed,
    Object? companyId = freezed,
    Object? isSelected = null,
    Object? quantity = null,
    Object? price = null,
    Object? category = freezed,
    Object? unit = freezed,
    Object? producer = freezed,
  }) {
    return _then(_$MProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      prdCode: freezed == prdCode
          ? _value.prdCode
          : prdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      prdName: freezed == prdName
          ? _value.prdName
          : prdName // ignore: cast_nullable_to_non_nullable
              as String?,
      prdActive: freezed == prdActive
          ? _value.prdActive
          : prdActive // ignore: cast_nullable_to_non_nullable
              as String?,
      prdContent: freezed == prdContent
          ? _value.prdContent
          : prdContent // ignore: cast_nullable_to_non_nullable
              as String?,
      prdSls: freezed == prdSls
          ? _value.prdSls
          : prdSls // ignore: cast_nullable_to_non_nullable
              as String?,
      prdOriginPrice: freezed == prdOriginPrice
          ? _value.prdOriginPrice
          : prdOriginPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      prdSellPrice: freezed == prdSellPrice
          ? _value.prdSellPrice
          : prdSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      prdStatus: freezed == prdStatus
          ? _value.prdStatus
          : prdStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      prdInventory: freezed == prdInventory
          ? _value.prdInventory
          : prdInventory // ignore: cast_nullable_to_non_nullable
              as int?,
      prdAllowNegative: freezed == prdAllowNegative
          ? _value.prdAllowNegative
          : prdAllowNegative // ignore: cast_nullable_to_non_nullable
              as int?,
      prdEditPrice: freezed == prdEditPrice
          ? _value.prdEditPrice
          : prdEditPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      prdManufactureId: freezed == prdManufactureId
          ? _value.prdManufactureId
          : prdManufactureId // ignore: cast_nullable_to_non_nullable
              as int?,
      prdPack: freezed == prdPack
          ? _value.prdPack
          : prdPack // ignore: cast_nullable_to_non_nullable
              as String?,
      prdUnitId: freezed == prdUnitId
          ? _value.prdUnitId
          : prdUnitId // ignore: cast_nullable_to_non_nullable
              as int?,
      prdGroupId: freezed == prdGroupId
          ? _value.prdGroupId
          : prdGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      prdImageUrl: freezed == prdImageUrl
          ? _value.prdImageUrl
          : prdImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prdThumbUrl: freezed == prdThumbUrl
          ? _value.prdThumbUrl
          : prdThumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prdDescriptions: freezed == prdDescriptions
          ? _value.prdDescriptions
          : prdDescriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      prdHot: freezed == prdHot
          ? _value.prdHot
          : prdHot // ignore: cast_nullable_to_non_nullable
              as int?,
      prdNew: freezed == prdNew
          ? _value.prdNew
          : prdNew // ignore: cast_nullable_to_non_nullable
              as int?,
      prdHighlight: freezed == prdHighlight
          ? _value.prdHighlight
          : prdHighlight // ignore: cast_nullable_to_non_nullable
              as int?,
      displayWebsite: freezed == displayWebsite
          ? _value.displayWebsite
          : displayWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String?,
      userInit: freezed == userInit
          ? _value.userInit
          : userInit // ignore: cast_nullable_to_non_nullable
              as int?,
      userUpd: freezed == userUpd
          ? _value.userUpd
          : userUpd // ignore: cast_nullable_to_non_nullable
              as int?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MCategory?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MUnitProduct?,
      producer: freezed == producer
          ? _value.producer
          : producer // ignore: cast_nullable_to_non_nullable
              as Producer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MProductImpl with DiagnosticableTreeMixin implements _MProduct {
  _$MProductImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'prd_code') this.prdCode,
      @JsonKey(name: 'prd_name') this.prdName,
      @JsonKey(name: 'prd_active') this.prdActive,
      @JsonKey(name: 'prd_content') this.prdContent,
      @JsonKey(name: 'prd_sls') this.prdSls,
      @JsonKey(name: 'prd_origin_price') this.prdOriginPrice,
      @JsonKey(name: 'prd_sell_price') this.prdSellPrice,
      @JsonKey(name: 'prd_status') this.prdStatus,
      @JsonKey(name: 'prd_inventory') this.prdInventory,
      @JsonKey(name: 'prd_allownegative') this.prdAllowNegative,
      @JsonKey(name: 'prd_edit_price') this.prdEditPrice,
      @JsonKey(name: 'prd_manufacture_id') this.prdManufactureId,
      @JsonKey(name: 'prd_pack') this.prdPack,
      @JsonKey(name: 'prd_unit_id') this.prdUnitId,
      @JsonKey(name: 'prd_group_id') this.prdGroupId,
      @JsonKey(name: 'prd_image_url') this.prdImageUrl,
      @JsonKey(name: 'prd_thumb_url') this.prdThumbUrl,
      @JsonKey(name: 'prd_descriptions') this.prdDescriptions,
      @JsonKey(name: 'prd_hot') this.prdHot,
      @JsonKey(name: 'prd_new') this.prdNew,
      @JsonKey(name: 'prd_highlight') this.prdHighlight,
      @JsonKey(name: 'display_website') this.displayWebsite,
      @JsonKey(name: 'created') this.created,
      @JsonKey(name: 'updated') this.updated,
      @JsonKey(name: 'user_init') this.userInit,
      @JsonKey(name: 'user_upd') this.userUpd,
      @JsonKey(name: 'deleted') this.deleted,
      @JsonKey(name: 'company_id') this.companyId,
      this.isSelected = false,
      this.quantity = 1,
      this.price = 0,
      this.category,
      this.unit,
      this.producer});

  factory _$MProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$MProductImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'prd_code')
  final String? prdCode;
  @override
  @JsonKey(name: 'prd_name')
  final String? prdName;
  @override
  @JsonKey(name: 'prd_active')
  final String? prdActive;
  @override
  @JsonKey(name: 'prd_content')
  final String? prdContent;
  @override
  @JsonKey(name: 'prd_sls')
  final String? prdSls;
  @override
  @JsonKey(name: 'prd_origin_price')
  final double? prdOriginPrice;
  @override
  @JsonKey(name: 'prd_sell_price')
  final double? prdSellPrice;
  @override
  @JsonKey(name: 'prd_status')
  final int? prdStatus;
  @override
  @JsonKey(name: 'prd_inventory')
  final int? prdInventory;
  @override
  @JsonKey(name: 'prd_allownegative')
  final int? prdAllowNegative;
  @override
  @JsonKey(name: 'prd_edit_price')
  final int? prdEditPrice;
  @override
  @JsonKey(name: 'prd_manufacture_id')
  final int? prdManufactureId;
  @override
  @JsonKey(name: 'prd_pack')
  final String? prdPack;
  @override
  @JsonKey(name: 'prd_unit_id')
  final int? prdUnitId;
  @override
  @JsonKey(name: 'prd_group_id')
  final int? prdGroupId;
  @override
  @JsonKey(name: 'prd_image_url')
  final String? prdImageUrl;
  @override
  @JsonKey(name: 'prd_thumb_url')
  final String? prdThumbUrl;
  @override
  @JsonKey(name: 'prd_descriptions')
  final String? prdDescriptions;
  @override
  @JsonKey(name: 'prd_hot')
  final int? prdHot;
  @override
  @JsonKey(name: 'prd_new')
  final int? prdNew;
  @override
  @JsonKey(name: 'prd_highlight')
  final int? prdHighlight;
  @override
  @JsonKey(name: 'display_website')
  final String? displayWebsite;
  @override
  @JsonKey(name: 'created')
  final String? created;
  @override
  @JsonKey(name: 'updated')
  final String? updated;
  @override
  @JsonKey(name: 'user_init')
  final int? userInit;
  @override
  @JsonKey(name: 'user_upd')
  final int? userUpd;
  @override
  @JsonKey(name: 'deleted')
  final int? deleted;
  @override
  @JsonKey(name: 'company_id')
  final String? companyId;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double price;
  @override
  final MCategory? category;
  @override
  final MUnitProduct? unit;
  @override
  final Producer? producer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MProduct(id: $id, prdCode: $prdCode, prdName: $prdName, prdActive: $prdActive, prdContent: $prdContent, prdSls: $prdSls, prdOriginPrice: $prdOriginPrice, prdSellPrice: $prdSellPrice, prdStatus: $prdStatus, prdInventory: $prdInventory, prdAllowNegative: $prdAllowNegative, prdEditPrice: $prdEditPrice, prdManufactureId: $prdManufactureId, prdPack: $prdPack, prdUnitId: $prdUnitId, prdGroupId: $prdGroupId, prdImageUrl: $prdImageUrl, prdThumbUrl: $prdThumbUrl, prdDescriptions: $prdDescriptions, prdHot: $prdHot, prdNew: $prdNew, prdHighlight: $prdHighlight, displayWebsite: $displayWebsite, created: $created, updated: $updated, userInit: $userInit, userUpd: $userUpd, deleted: $deleted, companyId: $companyId, isSelected: $isSelected, quantity: $quantity, price: $price, category: $category, unit: $unit, producer: $producer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MProduct'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('prdCode', prdCode))
      ..add(DiagnosticsProperty('prdName', prdName))
      ..add(DiagnosticsProperty('prdActive', prdActive))
      ..add(DiagnosticsProperty('prdContent', prdContent))
      ..add(DiagnosticsProperty('prdSls', prdSls))
      ..add(DiagnosticsProperty('prdOriginPrice', prdOriginPrice))
      ..add(DiagnosticsProperty('prdSellPrice', prdSellPrice))
      ..add(DiagnosticsProperty('prdStatus', prdStatus))
      ..add(DiagnosticsProperty('prdInventory', prdInventory))
      ..add(DiagnosticsProperty('prdAllowNegative', prdAllowNegative))
      ..add(DiagnosticsProperty('prdEditPrice', prdEditPrice))
      ..add(DiagnosticsProperty('prdManufactureId', prdManufactureId))
      ..add(DiagnosticsProperty('prdPack', prdPack))
      ..add(DiagnosticsProperty('prdUnitId', prdUnitId))
      ..add(DiagnosticsProperty('prdGroupId', prdGroupId))
      ..add(DiagnosticsProperty('prdImageUrl', prdImageUrl))
      ..add(DiagnosticsProperty('prdThumbUrl', prdThumbUrl))
      ..add(DiagnosticsProperty('prdDescriptions', prdDescriptions))
      ..add(DiagnosticsProperty('prdHot', prdHot))
      ..add(DiagnosticsProperty('prdNew', prdNew))
      ..add(DiagnosticsProperty('prdHighlight', prdHighlight))
      ..add(DiagnosticsProperty('displayWebsite', displayWebsite))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('updated', updated))
      ..add(DiagnosticsProperty('userInit', userInit))
      ..add(DiagnosticsProperty('userUpd', userUpd))
      ..add(DiagnosticsProperty('deleted', deleted))
      ..add(DiagnosticsProperty('companyId', companyId))
      ..add(DiagnosticsProperty('isSelected', isSelected))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('producer', producer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prdCode, prdCode) || other.prdCode == prdCode) &&
            (identical(other.prdName, prdName) || other.prdName == prdName) &&
            (identical(other.prdActive, prdActive) ||
                other.prdActive == prdActive) &&
            (identical(other.prdContent, prdContent) ||
                other.prdContent == prdContent) &&
            (identical(other.prdSls, prdSls) || other.prdSls == prdSls) &&
            (identical(other.prdOriginPrice, prdOriginPrice) ||
                other.prdOriginPrice == prdOriginPrice) &&
            (identical(other.prdSellPrice, prdSellPrice) ||
                other.prdSellPrice == prdSellPrice) &&
            (identical(other.prdStatus, prdStatus) ||
                other.prdStatus == prdStatus) &&
            (identical(other.prdInventory, prdInventory) ||
                other.prdInventory == prdInventory) &&
            (identical(other.prdAllowNegative, prdAllowNegative) ||
                other.prdAllowNegative == prdAllowNegative) &&
            (identical(other.prdEditPrice, prdEditPrice) ||
                other.prdEditPrice == prdEditPrice) &&
            (identical(other.prdManufactureId, prdManufactureId) ||
                other.prdManufactureId == prdManufactureId) &&
            (identical(other.prdPack, prdPack) || other.prdPack == prdPack) &&
            (identical(other.prdUnitId, prdUnitId) ||
                other.prdUnitId == prdUnitId) &&
            (identical(other.prdGroupId, prdGroupId) ||
                other.prdGroupId == prdGroupId) &&
            (identical(other.prdImageUrl, prdImageUrl) ||
                other.prdImageUrl == prdImageUrl) &&
            (identical(other.prdThumbUrl, prdThumbUrl) ||
                other.prdThumbUrl == prdThumbUrl) &&
            (identical(other.prdDescriptions, prdDescriptions) ||
                other.prdDescriptions == prdDescriptions) &&
            (identical(other.prdHot, prdHot) || other.prdHot == prdHot) &&
            (identical(other.prdNew, prdNew) || other.prdNew == prdNew) &&
            (identical(other.prdHighlight, prdHighlight) ||
                other.prdHighlight == prdHighlight) &&
            (identical(other.displayWebsite, displayWebsite) ||
                other.displayWebsite == displayWebsite) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.userInit, userInit) ||
                other.userInit == userInit) &&
            (identical(other.userUpd, userUpd) || other.userUpd == userUpd) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.producer, producer) ||
                other.producer == producer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        prdCode,
        prdName,
        prdActive,
        prdContent,
        prdSls,
        prdOriginPrice,
        prdSellPrice,
        prdStatus,
        prdInventory,
        prdAllowNegative,
        prdEditPrice,
        prdManufactureId,
        prdPack,
        prdUnitId,
        prdGroupId,
        prdImageUrl,
        prdThumbUrl,
        prdDescriptions,
        prdHot,
        prdNew,
        prdHighlight,
        displayWebsite,
        created,
        updated,
        userInit,
        userUpd,
        deleted,
        companyId,
        isSelected,
        quantity,
        price,
        category,
        unit,
        producer
      ]);

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MProductImplCopyWith<_$MProductImpl> get copyWith =>
      __$$MProductImplCopyWithImpl<_$MProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MProductImplToJson(
      this,
    );
  }
}

abstract class _MProduct implements MProduct {
  factory _MProduct(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'prd_code') final String? prdCode,
      @JsonKey(name: 'prd_name') final String? prdName,
      @JsonKey(name: 'prd_active') final String? prdActive,
      @JsonKey(name: 'prd_content') final String? prdContent,
      @JsonKey(name: 'prd_sls') final String? prdSls,
      @JsonKey(name: 'prd_origin_price') final double? prdOriginPrice,
      @JsonKey(name: 'prd_sell_price') final double? prdSellPrice,
      @JsonKey(name: 'prd_status') final int? prdStatus,
      @JsonKey(name: 'prd_inventory') final int? prdInventory,
      @JsonKey(name: 'prd_allownegative') final int? prdAllowNegative,
      @JsonKey(name: 'prd_edit_price') final int? prdEditPrice,
      @JsonKey(name: 'prd_manufacture_id') final int? prdManufactureId,
      @JsonKey(name: 'prd_pack') final String? prdPack,
      @JsonKey(name: 'prd_unit_id') final int? prdUnitId,
      @JsonKey(name: 'prd_group_id') final int? prdGroupId,
      @JsonKey(name: 'prd_image_url') final String? prdImageUrl,
      @JsonKey(name: 'prd_thumb_url') final String? prdThumbUrl,
      @JsonKey(name: 'prd_descriptions') final String? prdDescriptions,
      @JsonKey(name: 'prd_hot') final int? prdHot,
      @JsonKey(name: 'prd_new') final int? prdNew,
      @JsonKey(name: 'prd_highlight') final int? prdHighlight,
      @JsonKey(name: 'display_website') final String? displayWebsite,
      @JsonKey(name: 'created') final String? created,
      @JsonKey(name: 'updated') final String? updated,
      @JsonKey(name: 'user_init') final int? userInit,
      @JsonKey(name: 'user_upd') final int? userUpd,
      @JsonKey(name: 'deleted') final int? deleted,
      @JsonKey(name: 'company_id') final String? companyId,
      final bool isSelected,
      final int quantity,
      final double price,
      final MCategory? category,
      final MUnitProduct? unit,
      final Producer? producer}) = _$MProductImpl;

  factory _MProduct.fromJson(Map<String, dynamic> json) =
      _$MProductImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'prd_code')
  String? get prdCode;
  @override
  @JsonKey(name: 'prd_name')
  String? get prdName;
  @override
  @JsonKey(name: 'prd_active')
  String? get prdActive;
  @override
  @JsonKey(name: 'prd_content')
  String? get prdContent;
  @override
  @JsonKey(name: 'prd_sls')
  String? get prdSls;
  @override
  @JsonKey(name: 'prd_origin_price')
  double? get prdOriginPrice;
  @override
  @JsonKey(name: 'prd_sell_price')
  double? get prdSellPrice;
  @override
  @JsonKey(name: 'prd_status')
  int? get prdStatus;
  @override
  @JsonKey(name: 'prd_inventory')
  int? get prdInventory;
  @override
  @JsonKey(name: 'prd_allownegative')
  int? get prdAllowNegative;
  @override
  @JsonKey(name: 'prd_edit_price')
  int? get prdEditPrice;
  @override
  @JsonKey(name: 'prd_manufacture_id')
  int? get prdManufactureId;
  @override
  @JsonKey(name: 'prd_pack')
  String? get prdPack;
  @override
  @JsonKey(name: 'prd_unit_id')
  int? get prdUnitId;
  @override
  @JsonKey(name: 'prd_group_id')
  int? get prdGroupId;
  @override
  @JsonKey(name: 'prd_image_url')
  String? get prdImageUrl;
  @override
  @JsonKey(name: 'prd_thumb_url')
  String? get prdThumbUrl;
  @override
  @JsonKey(name: 'prd_descriptions')
  String? get prdDescriptions;
  @override
  @JsonKey(name: 'prd_hot')
  int? get prdHot;
  @override
  @JsonKey(name: 'prd_new')
  int? get prdNew;
  @override
  @JsonKey(name: 'prd_highlight')
  int? get prdHighlight;
  @override
  @JsonKey(name: 'display_website')
  String? get displayWebsite;
  @override
  @JsonKey(name: 'created')
  String? get created;
  @override
  @JsonKey(name: 'updated')
  String? get updated;
  @override
  @JsonKey(name: 'user_init')
  int? get userInit;
  @override
  @JsonKey(name: 'user_upd')
  int? get userUpd;
  @override
  @JsonKey(name: 'deleted')
  int? get deleted;
  @override
  @JsonKey(name: 'company_id')
  String? get companyId;
  @override
  bool get isSelected;
  @override
  int get quantity;
  @override
  double get price;
  @override
  MCategory? get category;
  @override
  MUnitProduct? get unit;
  @override
  Producer? get producer;

  /// Create a copy of MProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MProductImplCopyWith<_$MProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
