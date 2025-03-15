// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_order_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MOrderProductList _$MOrderProductListFromJson(Map<String, dynamic> json) {
  return _MOrderProductList.fromJson(json);
}

/// @nodoc
mixin _$MOrderProductList {
  @JsonKey(name: "ID")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "product_name")
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int? get bid_id => throw _privateConstructorUsedError;
  int? get order_id => throw _privateConstructorUsedError;
  int? get product_id => throw _privateConstructorUsedError;
  String? get product_code => throw _privateConstructorUsedError;
  int? get is_bids => throw _privateConstructorUsedError;

  /// Serializes this MOrderProductList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MOrderProductList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MOrderProductListCopyWith<MOrderProductList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MOrderProductListCopyWith<$Res> {
  factory $MOrderProductListCopyWith(
          MOrderProductList value, $Res Function(MOrderProductList) then) =
      _$MOrderProductListCopyWithImpl<$Res, MOrderProductList>;
  @useResult
  $Res call(
      {@JsonKey(name: "ID") int? id,
      @JsonKey(name: "product_name") String productName,
      int quantity,
      int price,
      int? bid_id,
      int? order_id,
      int? product_id,
      String? product_code,
      int? is_bids});
}

/// @nodoc
class _$MOrderProductListCopyWithImpl<$Res, $Val extends MOrderProductList>
    implements $MOrderProductListCopyWith<$Res> {
  _$MOrderProductListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MOrderProductList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = null,
    Object? quantity = null,
    Object? price = null,
    Object? bid_id = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? product_code = freezed,
    Object? is_bids = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      bid_id: freezed == bid_id
          ? _value.bid_id
          : bid_id // ignore: cast_nullable_to_non_nullable
              as int?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int?,
      product_id: freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      product_code: freezed == product_code
          ? _value.product_code
          : product_code // ignore: cast_nullable_to_non_nullable
              as String?,
      is_bids: freezed == is_bids
          ? _value.is_bids
          : is_bids // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MOrderProductListImplCopyWith<$Res>
    implements $MOrderProductListCopyWith<$Res> {
  factory _$$MOrderProductListImplCopyWith(_$MOrderProductListImpl value,
          $Res Function(_$MOrderProductListImpl) then) =
      __$$MOrderProductListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ID") int? id,
      @JsonKey(name: "product_name") String productName,
      int quantity,
      int price,
      int? bid_id,
      int? order_id,
      int? product_id,
      String? product_code,
      int? is_bids});
}

/// @nodoc
class __$$MOrderProductListImplCopyWithImpl<$Res>
    extends _$MOrderProductListCopyWithImpl<$Res, _$MOrderProductListImpl>
    implements _$$MOrderProductListImplCopyWith<$Res> {
  __$$MOrderProductListImplCopyWithImpl(_$MOrderProductListImpl _value,
      $Res Function(_$MOrderProductListImpl) _then)
      : super(_value, _then);

  /// Create a copy of MOrderProductList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = null,
    Object? quantity = null,
    Object? price = null,
    Object? bid_id = freezed,
    Object? order_id = freezed,
    Object? product_id = freezed,
    Object? product_code = freezed,
    Object? is_bids = freezed,
  }) {
    return _then(_$MOrderProductListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      bid_id: freezed == bid_id
          ? _value.bid_id
          : bid_id // ignore: cast_nullable_to_non_nullable
              as int?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as int?,
      product_id: freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      product_code: freezed == product_code
          ? _value.product_code
          : product_code // ignore: cast_nullable_to_non_nullable
              as String?,
      is_bids: freezed == is_bids
          ? _value.is_bids
          : is_bids // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MOrderProductListImpl implements _MOrderProductList {
  const _$MOrderProductListImpl(
      {@JsonKey(name: "ID") this.id,
      @JsonKey(name: "product_name") this.productName = "",
      this.quantity = 0,
      this.price = 0,
      this.bid_id,
      this.order_id,
      this.product_id,
      this.product_code,
      this.is_bids});

  factory _$MOrderProductListImpl.fromJson(Map<String, dynamic> json) =>
      _$$MOrderProductListImplFromJson(json);

  @override
  @JsonKey(name: "ID")
  final int? id;
  @override
  @JsonKey(name: "product_name")
  final String productName;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int price;
  @override
  final int? bid_id;
  @override
  final int? order_id;
  @override
  final int? product_id;
  @override
  final String? product_code;
  @override
  final int? is_bids;

  @override
  String toString() {
    return 'MOrderProductList(id: $id, productName: $productName, quantity: $quantity, price: $price, bid_id: $bid_id, order_id: $order_id, product_id: $product_id, product_code: $product_code, is_bids: $is_bids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MOrderProductListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.bid_id, bid_id) || other.bid_id == bid_id) &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
            (identical(other.product_id, product_id) ||
                other.product_id == product_id) &&
            (identical(other.product_code, product_code) ||
                other.product_code == product_code) &&
            (identical(other.is_bids, is_bids) || other.is_bids == is_bids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productName, quantity, price,
      bid_id, order_id, product_id, product_code, is_bids);

  /// Create a copy of MOrderProductList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MOrderProductListImplCopyWith<_$MOrderProductListImpl> get copyWith =>
      __$$MOrderProductListImplCopyWithImpl<_$MOrderProductListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MOrderProductListImplToJson(
      this,
    );
  }
}

abstract class _MOrderProductList implements MOrderProductList {
  const factory _MOrderProductList(
      {@JsonKey(name: "ID") final int? id,
      @JsonKey(name: "product_name") final String productName,
      final int quantity,
      final int price,
      final int? bid_id,
      final int? order_id,
      final int? product_id,
      final String? product_code,
      final int? is_bids}) = _$MOrderProductListImpl;

  factory _MOrderProductList.fromJson(Map<String, dynamic> json) =
      _$MOrderProductListImpl.fromJson;

  @override
  @JsonKey(name: "ID")
  int? get id;
  @override
  @JsonKey(name: "product_name")
  String get productName;
  @override
  int get quantity;
  @override
  int get price;
  @override
  int? get bid_id;
  @override
  int? get order_id;
  @override
  int? get product_id;
  @override
  String? get product_code;
  @override
  int? get is_bids;

  /// Create a copy of MOrderProductList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MOrderProductListImplCopyWith<_$MOrderProductListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
