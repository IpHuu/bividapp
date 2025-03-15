// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MOrderDetail _$MOrderDetailFromJson(Map<String, dynamic> json) {
  return _MOrderDetail.fromJson(json);
}

/// @nodoc
mixin _$MOrderDetail {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'output_code')
  String? get outputCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_id')
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'input_id')
  int? get inputId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sell_date')
  int? get sellDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  int? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int? get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_origin_price')
  int? get totalOriginPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_item')
  int? get discountItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon')
  String? get coupon => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_pay')
  int? get customerPay => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat')
  int? get vat => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_money')
  int get totalMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity')
  int get totalQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'lack')
  int? get lack => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_details')
  List<MOrderProductList>? get orderDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  int? get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted')
  int? get deleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'created')
  String? get created => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated')
  int? get updated => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_init')
  int? get userInit => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_upd')
  int? get userUpd => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ip')
  String? get userIp => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_id')
  int? get saleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'canreturn')
  int? get canReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'attach_file')
  String? get attachFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'mtc')
  String? get mtc => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  String? get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: _statusNameFromJson)
  String get statusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'company', fromJson: _customerNameFromJson)
  String get customerName => throw _privateConstructorUsedError;

  /// Serializes this MOrderDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MOrderDetailCopyWith<MOrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MOrderDetailCopyWith<$Res> {
  factory $MOrderDetailCopyWith(
          MOrderDetail value, $Res Function(MOrderDetail) then) =
      _$MOrderDetailCopyWithImpl<$Res, MOrderDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'output_code') String? outputCode,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'store_id') int? storeId,
      @JsonKey(name: 'input_id') int? inputId,
      @JsonKey(name: 'sell_date') int? sellDate,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'payment_method') int? paymentMethod,
      @JsonKey(name: 'total_price') int? totalPrice,
      @JsonKey(name: 'total_origin_price') int? totalOriginPrice,
      @JsonKey(name: 'discount_item') int? discountItem,
      @JsonKey(name: 'coupon') String? coupon,
      @JsonKey(name: 'customer_pay') int? customerPay,
      @JsonKey(name: 'vat') int? vat,
      @JsonKey(name: 'total_money') int totalMoney,
      @JsonKey(name: 'total_quantity') int totalQuantity,
      @JsonKey(name: 'lack') int? lack,
      @JsonKey(name: 'order_details') List<MOrderProductList>? orderDetails,
      @JsonKey(name: 'order_status') int? orderStatus,
      @JsonKey(name: 'deleted') int? deleted,
      @JsonKey(name: 'created') String? created,
      @JsonKey(name: 'updated') int? updated,
      @JsonKey(name: 'user_init') int? userInit,
      @JsonKey(name: 'user_upd') int? userUpd,
      @JsonKey(name: 'user_ip') String? userIp,
      @JsonKey(name: 'sale_id') int? saleId,
      @JsonKey(name: 'canreturn') int? canReturn,
      @JsonKey(name: 'attach_file') String? attachFile,
      @JsonKey(name: 'mtc') String? mtc,
      @JsonKey(name: 'company_id') String? companyId,
      @JsonKey(name: 'status', fromJson: _statusNameFromJson) String statusName,
      @JsonKey(name: 'company', fromJson: _customerNameFromJson)
      String customerName});
}

/// @nodoc
class _$MOrderDetailCopyWithImpl<$Res, $Val extends MOrderDetail>
    implements $MOrderDetailCopyWith<$Res> {
  _$MOrderDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? outputCode = freezed,
    Object? customerId = freezed,
    Object? storeId = freezed,
    Object? inputId = freezed,
    Object? sellDate = freezed,
    Object? notes = freezed,
    Object? paymentMethod = freezed,
    Object? totalPrice = freezed,
    Object? totalOriginPrice = freezed,
    Object? discountItem = freezed,
    Object? coupon = freezed,
    Object? customerPay = freezed,
    Object? vat = freezed,
    Object? totalMoney = null,
    Object? totalQuantity = null,
    Object? lack = freezed,
    Object? orderDetails = freezed,
    Object? orderStatus = freezed,
    Object? deleted = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? userInit = freezed,
    Object? userUpd = freezed,
    Object? userIp = freezed,
    Object? saleId = freezed,
    Object? canReturn = freezed,
    Object? attachFile = freezed,
    Object? mtc = freezed,
    Object? companyId = freezed,
    Object? statusName = null,
    Object? customerName = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      outputCode: freezed == outputCode
          ? _value.outputCode
          : outputCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      inputId: freezed == inputId
          ? _value.inputId
          : inputId // ignore: cast_nullable_to_non_nullable
              as int?,
      sellDate: freezed == sellDate
          ? _value.sellDate
          : sellDate // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOriginPrice: freezed == totalOriginPrice
          ? _value.totalOriginPrice
          : totalOriginPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountItem: freezed == discountItem
          ? _value.discountItem
          : discountItem // ignore: cast_nullable_to_non_nullable
              as int?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPay: freezed == customerPay
          ? _value.customerPay
          : customerPay // ignore: cast_nullable_to_non_nullable
              as int?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMoney: null == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lack: freezed == lack
          ? _value.lack
          : lack // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDetails: freezed == orderDetails
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as List<MOrderProductList>?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      userInit: freezed == userInit
          ? _value.userInit
          : userInit // ignore: cast_nullable_to_non_nullable
              as int?,
      userUpd: freezed == userUpd
          ? _value.userUpd
          : userUpd // ignore: cast_nullable_to_non_nullable
              as int?,
      userIp: freezed == userIp
          ? _value.userIp
          : userIp // ignore: cast_nullable_to_non_nullable
              as String?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int?,
      canReturn: freezed == canReturn
          ? _value.canReturn
          : canReturn // ignore: cast_nullable_to_non_nullable
              as int?,
      attachFile: freezed == attachFile
          ? _value.attachFile
          : attachFile // ignore: cast_nullable_to_non_nullable
              as String?,
      mtc: freezed == mtc
          ? _value.mtc
          : mtc // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MOrderDetailImplCopyWith<$Res>
    implements $MOrderDetailCopyWith<$Res> {
  factory _$$MOrderDetailImplCopyWith(
          _$MOrderDetailImpl value, $Res Function(_$MOrderDetailImpl) then) =
      __$$MOrderDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'output_code') String? outputCode,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'store_id') int? storeId,
      @JsonKey(name: 'input_id') int? inputId,
      @JsonKey(name: 'sell_date') int? sellDate,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'payment_method') int? paymentMethod,
      @JsonKey(name: 'total_price') int? totalPrice,
      @JsonKey(name: 'total_origin_price') int? totalOriginPrice,
      @JsonKey(name: 'discount_item') int? discountItem,
      @JsonKey(name: 'coupon') String? coupon,
      @JsonKey(name: 'customer_pay') int? customerPay,
      @JsonKey(name: 'vat') int? vat,
      @JsonKey(name: 'total_money') int totalMoney,
      @JsonKey(name: 'total_quantity') int totalQuantity,
      @JsonKey(name: 'lack') int? lack,
      @JsonKey(name: 'order_details') List<MOrderProductList>? orderDetails,
      @JsonKey(name: 'order_status') int? orderStatus,
      @JsonKey(name: 'deleted') int? deleted,
      @JsonKey(name: 'created') String? created,
      @JsonKey(name: 'updated') int? updated,
      @JsonKey(name: 'user_init') int? userInit,
      @JsonKey(name: 'user_upd') int? userUpd,
      @JsonKey(name: 'user_ip') String? userIp,
      @JsonKey(name: 'sale_id') int? saleId,
      @JsonKey(name: 'canreturn') int? canReturn,
      @JsonKey(name: 'attach_file') String? attachFile,
      @JsonKey(name: 'mtc') String? mtc,
      @JsonKey(name: 'company_id') String? companyId,
      @JsonKey(name: 'status', fromJson: _statusNameFromJson) String statusName,
      @JsonKey(name: 'company', fromJson: _customerNameFromJson)
      String customerName});
}

/// @nodoc
class __$$MOrderDetailImplCopyWithImpl<$Res>
    extends _$MOrderDetailCopyWithImpl<$Res, _$MOrderDetailImpl>
    implements _$$MOrderDetailImplCopyWith<$Res> {
  __$$MOrderDetailImplCopyWithImpl(
      _$MOrderDetailImpl _value, $Res Function(_$MOrderDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of MOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? outputCode = freezed,
    Object? customerId = freezed,
    Object? storeId = freezed,
    Object? inputId = freezed,
    Object? sellDate = freezed,
    Object? notes = freezed,
    Object? paymentMethod = freezed,
    Object? totalPrice = freezed,
    Object? totalOriginPrice = freezed,
    Object? discountItem = freezed,
    Object? coupon = freezed,
    Object? customerPay = freezed,
    Object? vat = freezed,
    Object? totalMoney = null,
    Object? totalQuantity = null,
    Object? lack = freezed,
    Object? orderDetails = freezed,
    Object? orderStatus = freezed,
    Object? deleted = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? userInit = freezed,
    Object? userUpd = freezed,
    Object? userIp = freezed,
    Object? saleId = freezed,
    Object? canReturn = freezed,
    Object? attachFile = freezed,
    Object? mtc = freezed,
    Object? companyId = freezed,
    Object? statusName = null,
    Object? customerName = null,
  }) {
    return _then(_$MOrderDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      outputCode: freezed == outputCode
          ? _value.outputCode
          : outputCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      inputId: freezed == inputId
          ? _value.inputId
          : inputId // ignore: cast_nullable_to_non_nullable
              as int?,
      sellDate: freezed == sellDate
          ? _value.sellDate
          : sellDate // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOriginPrice: freezed == totalOriginPrice
          ? _value.totalOriginPrice
          : totalOriginPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      discountItem: freezed == discountItem
          ? _value.discountItem
          : discountItem // ignore: cast_nullable_to_non_nullable
              as int?,
      coupon: freezed == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPay: freezed == customerPay
          ? _value.customerPay
          : customerPay // ignore: cast_nullable_to_non_nullable
              as int?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMoney: null == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lack: freezed == lack
          ? _value.lack
          : lack // ignore: cast_nullable_to_non_nullable
              as int?,
      orderDetails: freezed == orderDetails
          ? _value._orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as List<MOrderProductList>?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      deleted: freezed == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int?,
      userInit: freezed == userInit
          ? _value.userInit
          : userInit // ignore: cast_nullable_to_non_nullable
              as int?,
      userUpd: freezed == userUpd
          ? _value.userUpd
          : userUpd // ignore: cast_nullable_to_non_nullable
              as int?,
      userIp: freezed == userIp
          ? _value.userIp
          : userIp // ignore: cast_nullable_to_non_nullable
              as String?,
      saleId: freezed == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as int?,
      canReturn: freezed == canReturn
          ? _value.canReturn
          : canReturn // ignore: cast_nullable_to_non_nullable
              as int?,
      attachFile: freezed == attachFile
          ? _value.attachFile
          : attachFile // ignore: cast_nullable_to_non_nullable
              as String?,
      mtc: freezed == mtc
          ? _value.mtc
          : mtc // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MOrderDetailImpl implements _MOrderDetail {
  const _$MOrderDetailImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'output_code') this.outputCode,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'store_id') this.storeId,
      @JsonKey(name: 'input_id') this.inputId,
      @JsonKey(name: 'sell_date') this.sellDate,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'total_price') this.totalPrice,
      @JsonKey(name: 'total_origin_price') this.totalOriginPrice,
      @JsonKey(name: 'discount_item') this.discountItem,
      @JsonKey(name: 'coupon') this.coupon,
      @JsonKey(name: 'customer_pay') this.customerPay,
      @JsonKey(name: 'vat') this.vat,
      @JsonKey(name: 'total_money') this.totalMoney = 0,
      @JsonKey(name: 'total_quantity') this.totalQuantity = 0,
      @JsonKey(name: 'lack') this.lack,
      @JsonKey(name: 'order_details')
      final List<MOrderProductList>? orderDetails,
      @JsonKey(name: 'order_status') this.orderStatus,
      @JsonKey(name: 'deleted') this.deleted,
      @JsonKey(name: 'created') this.created,
      @JsonKey(name: 'updated') this.updated,
      @JsonKey(name: 'user_init') this.userInit,
      @JsonKey(name: 'user_upd') this.userUpd,
      @JsonKey(name: 'user_ip') this.userIp,
      @JsonKey(name: 'sale_id') this.saleId,
      @JsonKey(name: 'canreturn') this.canReturn,
      @JsonKey(name: 'attach_file') this.attachFile,
      @JsonKey(name: 'mtc') this.mtc,
      @JsonKey(name: 'company_id') this.companyId,
      @JsonKey(name: 'status', fromJson: _statusNameFromJson)
      this.statusName = "",
      @JsonKey(name: 'company', fromJson: _customerNameFromJson)
      this.customerName = ""})
      : _orderDetails = orderDetails;

  factory _$MOrderDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MOrderDetailImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'output_code')
  final String? outputCode;
  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'store_id')
  final int? storeId;
  @override
  @JsonKey(name: 'input_id')
  final int? inputId;
  @override
  @JsonKey(name: 'sell_date')
  final int? sellDate;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  @override
  @JsonKey(name: 'payment_method')
  final int? paymentMethod;
  @override
  @JsonKey(name: 'total_price')
  final int? totalPrice;
  @override
  @JsonKey(name: 'total_origin_price')
  final int? totalOriginPrice;
  @override
  @JsonKey(name: 'discount_item')
  final int? discountItem;
  @override
  @JsonKey(name: 'coupon')
  final String? coupon;
  @override
  @JsonKey(name: 'customer_pay')
  final int? customerPay;
  @override
  @JsonKey(name: 'vat')
  final int? vat;
  @override
  @JsonKey(name: 'total_money')
  final int totalMoney;
  @override
  @JsonKey(name: 'total_quantity')
  final int totalQuantity;
  @override
  @JsonKey(name: 'lack')
  final int? lack;
  final List<MOrderProductList>? _orderDetails;
  @override
  @JsonKey(name: 'order_details')
  List<MOrderProductList>? get orderDetails {
    final value = _orderDetails;
    if (value == null) return null;
    if (_orderDetails is EqualUnmodifiableListView) return _orderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'order_status')
  final int? orderStatus;
  @override
  @JsonKey(name: 'deleted')
  final int? deleted;
  @override
  @JsonKey(name: 'created')
  final String? created;
  @override
  @JsonKey(name: 'updated')
  final int? updated;
  @override
  @JsonKey(name: 'user_init')
  final int? userInit;
  @override
  @JsonKey(name: 'user_upd')
  final int? userUpd;
  @override
  @JsonKey(name: 'user_ip')
  final String? userIp;
  @override
  @JsonKey(name: 'sale_id')
  final int? saleId;
  @override
  @JsonKey(name: 'canreturn')
  final int? canReturn;
  @override
  @JsonKey(name: 'attach_file')
  final String? attachFile;
  @override
  @JsonKey(name: 'mtc')
  final String? mtc;
  @override
  @JsonKey(name: 'company_id')
  final String? companyId;
  @override
  @JsonKey(name: 'status', fromJson: _statusNameFromJson)
  final String statusName;
  @override
  @JsonKey(name: 'company', fromJson: _customerNameFromJson)
  final String customerName;

  @override
  String toString() {
    return 'MOrderDetail(id: $id, outputCode: $outputCode, customerId: $customerId, storeId: $storeId, inputId: $inputId, sellDate: $sellDate, notes: $notes, paymentMethod: $paymentMethod, totalPrice: $totalPrice, totalOriginPrice: $totalOriginPrice, discountItem: $discountItem, coupon: $coupon, customerPay: $customerPay, vat: $vat, totalMoney: $totalMoney, totalQuantity: $totalQuantity, lack: $lack, orderDetails: $orderDetails, orderStatus: $orderStatus, deleted: $deleted, created: $created, updated: $updated, userInit: $userInit, userUpd: $userUpd, userIp: $userIp, saleId: $saleId, canReturn: $canReturn, attachFile: $attachFile, mtc: $mtc, companyId: $companyId, statusName: $statusName, customerName: $customerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MOrderDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.outputCode, outputCode) ||
                other.outputCode == outputCode) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.sellDate, sellDate) ||
                other.sellDate == sellDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalOriginPrice, totalOriginPrice) ||
                other.totalOriginPrice == totalOriginPrice) &&
            (identical(other.discountItem, discountItem) ||
                other.discountItem == discountItem) &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.customerPay, customerPay) ||
                other.customerPay == customerPay) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.totalMoney, totalMoney) ||
                other.totalMoney == totalMoney) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.lack, lack) || other.lack == lack) &&
            const DeepCollectionEquality()
                .equals(other._orderDetails, _orderDetails) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.userInit, userInit) ||
                other.userInit == userInit) &&
            (identical(other.userUpd, userUpd) || other.userUpd == userUpd) &&
            (identical(other.userIp, userIp) || other.userIp == userIp) &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.canReturn, canReturn) ||
                other.canReturn == canReturn) &&
            (identical(other.attachFile, attachFile) ||
                other.attachFile == attachFile) &&
            (identical(other.mtc, mtc) || other.mtc == mtc) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        outputCode,
        customerId,
        storeId,
        inputId,
        sellDate,
        notes,
        paymentMethod,
        totalPrice,
        totalOriginPrice,
        discountItem,
        coupon,
        customerPay,
        vat,
        totalMoney,
        totalQuantity,
        lack,
        const DeepCollectionEquality().hash(_orderDetails),
        orderStatus,
        deleted,
        created,
        updated,
        userInit,
        userUpd,
        userIp,
        saleId,
        canReturn,
        attachFile,
        mtc,
        companyId,
        statusName,
        customerName
      ]);

  /// Create a copy of MOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MOrderDetailImplCopyWith<_$MOrderDetailImpl> get copyWith =>
      __$$MOrderDetailImplCopyWithImpl<_$MOrderDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MOrderDetailImplToJson(
      this,
    );
  }
}

abstract class _MOrderDetail implements MOrderDetail {
  const factory _MOrderDetail(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'output_code') final String? outputCode,
      @JsonKey(name: 'customer_id') final int? customerId,
      @JsonKey(name: 'store_id') final int? storeId,
      @JsonKey(name: 'input_id') final int? inputId,
      @JsonKey(name: 'sell_date') final int? sellDate,
      @JsonKey(name: 'notes') final String? notes,
      @JsonKey(name: 'payment_method') final int? paymentMethod,
      @JsonKey(name: 'total_price') final int? totalPrice,
      @JsonKey(name: 'total_origin_price') final int? totalOriginPrice,
      @JsonKey(name: 'discount_item') final int? discountItem,
      @JsonKey(name: 'coupon') final String? coupon,
      @JsonKey(name: 'customer_pay') final int? customerPay,
      @JsonKey(name: 'vat') final int? vat,
      @JsonKey(name: 'total_money') final int totalMoney,
      @JsonKey(name: 'total_quantity') final int totalQuantity,
      @JsonKey(name: 'lack') final int? lack,
      @JsonKey(name: 'order_details')
      final List<MOrderProductList>? orderDetails,
      @JsonKey(name: 'order_status') final int? orderStatus,
      @JsonKey(name: 'deleted') final int? deleted,
      @JsonKey(name: 'created') final String? created,
      @JsonKey(name: 'updated') final int? updated,
      @JsonKey(name: 'user_init') final int? userInit,
      @JsonKey(name: 'user_upd') final int? userUpd,
      @JsonKey(name: 'user_ip') final String? userIp,
      @JsonKey(name: 'sale_id') final int? saleId,
      @JsonKey(name: 'canreturn') final int? canReturn,
      @JsonKey(name: 'attach_file') final String? attachFile,
      @JsonKey(name: 'mtc') final String? mtc,
      @JsonKey(name: 'company_id') final String? companyId,
      @JsonKey(name: 'status', fromJson: _statusNameFromJson)
      final String statusName,
      @JsonKey(name: 'company', fromJson: _customerNameFromJson)
      final String customerName}) = _$MOrderDetailImpl;

  factory _MOrderDetail.fromJson(Map<String, dynamic> json) =
      _$MOrderDetailImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'output_code')
  String? get outputCode;
  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'store_id')
  int? get storeId;
  @override
  @JsonKey(name: 'input_id')
  int? get inputId;
  @override
  @JsonKey(name: 'sell_date')
  int? get sellDate;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(name: 'payment_method')
  int? get paymentMethod;
  @override
  @JsonKey(name: 'total_price')
  int? get totalPrice;
  @override
  @JsonKey(name: 'total_origin_price')
  int? get totalOriginPrice;
  @override
  @JsonKey(name: 'discount_item')
  int? get discountItem;
  @override
  @JsonKey(name: 'coupon')
  String? get coupon;
  @override
  @JsonKey(name: 'customer_pay')
  int? get customerPay;
  @override
  @JsonKey(name: 'vat')
  int? get vat;
  @override
  @JsonKey(name: 'total_money')
  int get totalMoney;
  @override
  @JsonKey(name: 'total_quantity')
  int get totalQuantity;
  @override
  @JsonKey(name: 'lack')
  int? get lack;
  @override
  @JsonKey(name: 'order_details')
  List<MOrderProductList>? get orderDetails;
  @override
  @JsonKey(name: 'order_status')
  int? get orderStatus;
  @override
  @JsonKey(name: 'deleted')
  int? get deleted;
  @override
  @JsonKey(name: 'created')
  String? get created;
  @override
  @JsonKey(name: 'updated')
  int? get updated;
  @override
  @JsonKey(name: 'user_init')
  int? get userInit;
  @override
  @JsonKey(name: 'user_upd')
  int? get userUpd;
  @override
  @JsonKey(name: 'user_ip')
  String? get userIp;
  @override
  @JsonKey(name: 'sale_id')
  int? get saleId;
  @override
  @JsonKey(name: 'canreturn')
  int? get canReturn;
  @override
  @JsonKey(name: 'attach_file')
  String? get attachFile;
  @override
  @JsonKey(name: 'mtc')
  String? get mtc;
  @override
  @JsonKey(name: 'company_id')
  String? get companyId;
  @override
  @JsonKey(name: 'status', fromJson: _statusNameFromJson)
  String get statusName;
  @override
  @JsonKey(name: 'company', fromJson: _customerNameFromJson)
  String get customerName;

  /// Create a copy of MOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MOrderDetailImplCopyWith<_$MOrderDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
