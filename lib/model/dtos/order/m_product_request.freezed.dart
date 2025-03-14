// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_product_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MProductRequest _$MProductRequestFromJson(Map<String, dynamic> json) {
  return _MProductRequest.fromJson(json);
}

/// @nodoc
mixin _$MProductRequest {
  @JsonKey(name: "product_id")
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "maProduct")
  String get productCode => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  /// Serializes this MProductRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MProductRequestCopyWith<MProductRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MProductRequestCopyWith<$Res> {
  factory $MProductRequestCopyWith(
          MProductRequest value, $Res Function(MProductRequest) then) =
      _$MProductRequestCopyWithImpl<$Res, MProductRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "product_id") int productId,
      int quantity,
      String name,
      @JsonKey(name: "maProduct") String productCode,
      int price});
}

/// @nodoc
class _$MProductRequestCopyWithImpl<$Res, $Val extends MProductRequest>
    implements $MProductRequestCopyWith<$Res> {
  _$MProductRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? name = null,
    Object? productCode = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MProductRequestImplCopyWith<$Res>
    implements $MProductRequestCopyWith<$Res> {
  factory _$$MProductRequestImplCopyWith(_$MProductRequestImpl value,
          $Res Function(_$MProductRequestImpl) then) =
      __$$MProductRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "product_id") int productId,
      int quantity,
      String name,
      @JsonKey(name: "maProduct") String productCode,
      int price});
}

/// @nodoc
class __$$MProductRequestImplCopyWithImpl<$Res>
    extends _$MProductRequestCopyWithImpl<$Res, _$MProductRequestImpl>
    implements _$$MProductRequestImplCopyWith<$Res> {
  __$$MProductRequestImplCopyWithImpl(
      _$MProductRequestImpl _value, $Res Function(_$MProductRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of MProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? name = null,
    Object? productCode = null,
    Object? price = null,
  }) {
    return _then(_$MProductRequestImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productCode: null == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MProductRequestImpl implements _MProductRequest {
  const _$MProductRequestImpl(
      {@JsonKey(name: "product_id") required this.productId,
      required this.quantity,
      required this.name,
      @JsonKey(name: "maProduct") required this.productCode,
      required this.price});

  factory _$MProductRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MProductRequestImplFromJson(json);

  @override
  @JsonKey(name: "product_id")
  final int productId;
  @override
  final int quantity;
  @override
  final String name;
  @override
  @JsonKey(name: "maProduct")
  final String productCode;
  @override
  final int price;

  @override
  String toString() {
    return 'MProductRequest(productId: $productId, quantity: $quantity, name: $name, productCode: $productCode, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MProductRequestImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, quantity, name, productCode, price);

  /// Create a copy of MProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MProductRequestImplCopyWith<_$MProductRequestImpl> get copyWith =>
      __$$MProductRequestImplCopyWithImpl<_$MProductRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MProductRequestImplToJson(
      this,
    );
  }
}

abstract class _MProductRequest implements MProductRequest {
  const factory _MProductRequest(
      {@JsonKey(name: "product_id") required final int productId,
      required final int quantity,
      required final String name,
      @JsonKey(name: "maProduct") required final String productCode,
      required final int price}) = _$MProductRequestImpl;

  factory _MProductRequest.fromJson(Map<String, dynamic> json) =
      _$MProductRequestImpl.fromJson;

  @override
  @JsonKey(name: "product_id")
  int get productId;
  @override
  int get quantity;
  @override
  String get name;
  @override
  @JsonKey(name: "maProduct")
  String get productCode;
  @override
  int get price;

  /// Create a copy of MProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MProductRequestImplCopyWith<_$MProductRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
