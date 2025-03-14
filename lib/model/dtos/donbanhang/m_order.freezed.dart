// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MOrder _$MOrderFromJson(Map<String, dynamic> json) {
  return _MOrder.fromJson(json);
}

/// @nodoc
mixin _$MOrder {
  int? get id => throw _privateConstructorUsedError;
  String? get output_code => throw _privateConstructorUsedError;
  int? get customer_id => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_order')
  String get userOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_name')
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_name')
  String get statusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String get companyName => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  int get total_money => throw _privateConstructorUsedError;
  int? get store_id => throw _privateConstructorUsedError;
  String? get company_id => throw _privateConstructorUsedError;

  /// Serializes this MOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MOrderCopyWith<MOrder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MOrderCopyWith<$Res> {
  factory $MOrderCopyWith(MOrder value, $Res Function(MOrder) then) =
      _$MOrderCopyWithImpl<$Res, MOrder>;
  @useResult
  $Res call(
      {int? id,
      String? output_code,
      int? customer_id,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'user_order') String userOrder,
      @JsonKey(name: 'store_name') String storeName,
      @JsonKey(name: 'status_name') String statusName,
      @JsonKey(name: 'company_name') String companyName,
      String created,
      int total_money,
      int? store_id,
      String? company_id});
}

/// @nodoc
class _$MOrderCopyWithImpl<$Res, $Val extends MOrder>
    implements $MOrderCopyWith<$Res> {
  _$MOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? output_code = freezed,
    Object? customer_id = freezed,
    Object? customerName = null,
    Object? userOrder = null,
    Object? storeName = null,
    Object? statusName = null,
    Object? companyName = null,
    Object? created = null,
    Object? total_money = null,
    Object? store_id = freezed,
    Object? company_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      output_code: freezed == output_code
          ? _value.output_code
          : output_code // ignore: cast_nullable_to_non_nullable
              as String?,
      customer_id: freezed == customer_id
          ? _value.customer_id
          : customer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      userOrder: null == userOrder
          ? _value.userOrder
          : userOrder // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      total_money: null == total_money
          ? _value.total_money
          : total_money // ignore: cast_nullable_to_non_nullable
              as int,
      store_id: freezed == store_id
          ? _value.store_id
          : store_id // ignore: cast_nullable_to_non_nullable
              as int?,
      company_id: freezed == company_id
          ? _value.company_id
          : company_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MOrderImplCopyWith<$Res> implements $MOrderCopyWith<$Res> {
  factory _$$MOrderImplCopyWith(
          _$MOrderImpl value, $Res Function(_$MOrderImpl) then) =
      __$$MOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? output_code,
      int? customer_id,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'user_order') String userOrder,
      @JsonKey(name: 'store_name') String storeName,
      @JsonKey(name: 'status_name') String statusName,
      @JsonKey(name: 'company_name') String companyName,
      String created,
      int total_money,
      int? store_id,
      String? company_id});
}

/// @nodoc
class __$$MOrderImplCopyWithImpl<$Res>
    extends _$MOrderCopyWithImpl<$Res, _$MOrderImpl>
    implements _$$MOrderImplCopyWith<$Res> {
  __$$MOrderImplCopyWithImpl(
      _$MOrderImpl _value, $Res Function(_$MOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? output_code = freezed,
    Object? customer_id = freezed,
    Object? customerName = null,
    Object? userOrder = null,
    Object? storeName = null,
    Object? statusName = null,
    Object? companyName = null,
    Object? created = null,
    Object? total_money = null,
    Object? store_id = freezed,
    Object? company_id = freezed,
  }) {
    return _then(_$MOrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      output_code: freezed == output_code
          ? _value.output_code
          : output_code // ignore: cast_nullable_to_non_nullable
              as String?,
      customer_id: freezed == customer_id
          ? _value.customer_id
          : customer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      userOrder: null == userOrder
          ? _value.userOrder
          : userOrder // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      total_money: null == total_money
          ? _value.total_money
          : total_money // ignore: cast_nullable_to_non_nullable
              as int,
      store_id: freezed == store_id
          ? _value.store_id
          : store_id // ignore: cast_nullable_to_non_nullable
              as int?,
      company_id: freezed == company_id
          ? _value.company_id
          : company_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MOrderImpl implements _MOrder {
  _$MOrderImpl(
      {this.id,
      this.output_code,
      this.customer_id,
      @JsonKey(name: 'customer_name') this.customerName = "",
      @JsonKey(name: 'user_order') this.userOrder = "",
      @JsonKey(name: 'store_name') this.storeName = "",
      @JsonKey(name: 'status_name') this.statusName = "",
      @JsonKey(name: 'company_name') this.companyName = "",
      this.created = "",
      this.total_money = 0,
      this.store_id,
      this.company_id});

  factory _$MOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$MOrderImplFromJson(json);

  @override
  final int? id;
  @override
  final String? output_code;
  @override
  final int? customer_id;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'user_order')
  final String userOrder;
  @override
  @JsonKey(name: 'store_name')
  final String storeName;
  @override
  @JsonKey(name: 'status_name')
  final String statusName;
  @override
  @JsonKey(name: 'company_name')
  final String companyName;
  @override
  @JsonKey()
  final String created;
  @override
  @JsonKey()
  final int total_money;
  @override
  final int? store_id;
  @override
  final String? company_id;

  @override
  String toString() {
    return 'MOrder(id: $id, output_code: $output_code, customer_id: $customer_id, customerName: $customerName, userOrder: $userOrder, storeName: $storeName, statusName: $statusName, companyName: $companyName, created: $created, total_money: $total_money, store_id: $store_id, company_id: $company_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.output_code, output_code) ||
                other.output_code == output_code) &&
            (identical(other.customer_id, customer_id) ||
                other.customer_id == customer_id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.userOrder, userOrder) ||
                other.userOrder == userOrder) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.total_money, total_money) ||
                other.total_money == total_money) &&
            (identical(other.store_id, store_id) ||
                other.store_id == store_id) &&
            (identical(other.company_id, company_id) ||
                other.company_id == company_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      output_code,
      customer_id,
      customerName,
      userOrder,
      storeName,
      statusName,
      companyName,
      created,
      total_money,
      store_id,
      company_id);

  /// Create a copy of MOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MOrderImplCopyWith<_$MOrderImpl> get copyWith =>
      __$$MOrderImplCopyWithImpl<_$MOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MOrderImplToJson(
      this,
    );
  }
}

abstract class _MOrder implements MOrder {
  factory _MOrder(
      {final int? id,
      final String? output_code,
      final int? customer_id,
      @JsonKey(name: 'customer_name') final String customerName,
      @JsonKey(name: 'user_order') final String userOrder,
      @JsonKey(name: 'store_name') final String storeName,
      @JsonKey(name: 'status_name') final String statusName,
      @JsonKey(name: 'company_name') final String companyName,
      final String created,
      final int total_money,
      final int? store_id,
      final String? company_id}) = _$MOrderImpl;

  factory _MOrder.fromJson(Map<String, dynamic> json) = _$MOrderImpl.fromJson;

  @override
  int? get id;
  @override
  String? get output_code;
  @override
  int? get customer_id;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'user_order')
  String get userOrder;
  @override
  @JsonKey(name: 'store_name')
  String get storeName;
  @override
  @JsonKey(name: 'status_name')
  String get statusName;
  @override
  @JsonKey(name: 'company_name')
  String get companyName;
  @override
  String get created;
  @override
  int get total_money;
  @override
  int? get store_id;
  @override
  String? get company_id;

  /// Create a copy of MOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MOrderImplCopyWith<_$MOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
