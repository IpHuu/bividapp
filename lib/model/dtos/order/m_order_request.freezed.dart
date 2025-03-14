// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MOrderRequest _$MOrderRequestFromJson(Map<String, dynamic> json) {
  return _MOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$MOrderRequest {
  @JsonKey(name: "customer_id")
  int get customerId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: "total_quantity")
  int get totalQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: "total_price")
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "id_status")
  int? get idStatus => throw _privateConstructorUsedError;
  List<MProductRequest> get product => throw _privateConstructorUsedError;

  /// Serializes this MOrderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MOrderRequestCopyWith<MOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MOrderRequestCopyWith<$Res> {
  factory $MOrderRequestCopyWith(
          MOrderRequest value, $Res Function(MOrderRequest) then) =
      _$MOrderRequestCopyWithImpl<$Res, MOrderRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "customer_id") int customerId,
      String? notes,
      @JsonKey(name: "total_quantity") int totalQuantity,
      @JsonKey(name: "total_price") int totalPrice,
      @JsonKey(name: "id_status") int? idStatus,
      List<MProductRequest> product});
}

/// @nodoc
class _$MOrderRequestCopyWithImpl<$Res, $Val extends MOrderRequest>
    implements $MOrderRequestCopyWith<$Res> {
  _$MOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? notes = freezed,
    Object? totalQuantity = null,
    Object? totalPrice = null,
    Object? idStatus = freezed,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      idStatus: freezed == idStatus
          ? _value.idStatus
          : idStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<MProductRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MOrderRequestImplCopyWith<$Res>
    implements $MOrderRequestCopyWith<$Res> {
  factory _$$MOrderRequestImplCopyWith(
          _$MOrderRequestImpl value, $Res Function(_$MOrderRequestImpl) then) =
      __$$MOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customer_id") int customerId,
      String? notes,
      @JsonKey(name: "total_quantity") int totalQuantity,
      @JsonKey(name: "total_price") int totalPrice,
      @JsonKey(name: "id_status") int? idStatus,
      List<MProductRequest> product});
}

/// @nodoc
class __$$MOrderRequestImplCopyWithImpl<$Res>
    extends _$MOrderRequestCopyWithImpl<$Res, _$MOrderRequestImpl>
    implements _$$MOrderRequestImplCopyWith<$Res> {
  __$$MOrderRequestImplCopyWithImpl(
      _$MOrderRequestImpl _value, $Res Function(_$MOrderRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of MOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? notes = freezed,
    Object? totalQuantity = null,
    Object? totalPrice = null,
    Object? idStatus = freezed,
    Object? product = null,
  }) {
    return _then(_$MOrderRequestImpl(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      idStatus: freezed == idStatus
          ? _value.idStatus
          : idStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<MProductRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MOrderRequestImpl implements _MOrderRequest {
  const _$MOrderRequestImpl(
      {@JsonKey(name: "customer_id") required this.customerId,
      this.notes,
      @JsonKey(name: "total_quantity") required this.totalQuantity,
      @JsonKey(name: "total_price") required this.totalPrice,
      @JsonKey(name: "id_status") this.idStatus,
      required final List<MProductRequest> product})
      : _product = product;

  factory _$MOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MOrderRequestImplFromJson(json);

  @override
  @JsonKey(name: "customer_id")
  final int customerId;
  @override
  final String? notes;
  @override
  @JsonKey(name: "total_quantity")
  final int totalQuantity;
  @override
  @JsonKey(name: "total_price")
  final int totalPrice;
  @override
  @JsonKey(name: "id_status")
  final int? idStatus;
  final List<MProductRequest> _product;
  @override
  List<MProductRequest> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  String toString() {
    return 'MOrderRequest(customerId: $customerId, notes: $notes, totalQuantity: $totalQuantity, totalPrice: $totalPrice, idStatus: $idStatus, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MOrderRequestImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.idStatus, idStatus) ||
                other.idStatus == idStatus) &&
            const DeepCollectionEquality().equals(other._product, _product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, notes, totalQuantity,
      totalPrice, idStatus, const DeepCollectionEquality().hash(_product));

  /// Create a copy of MOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MOrderRequestImplCopyWith<_$MOrderRequestImpl> get copyWith =>
      __$$MOrderRequestImplCopyWithImpl<_$MOrderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _MOrderRequest implements MOrderRequest {
  const factory _MOrderRequest(
      {@JsonKey(name: "customer_id") required final int customerId,
      final String? notes,
      @JsonKey(name: "total_quantity") required final int totalQuantity,
      @JsonKey(name: "total_price") required final int totalPrice,
      @JsonKey(name: "id_status") final int? idStatus,
      required final List<MProductRequest> product}) = _$MOrderRequestImpl;

  factory _MOrderRequest.fromJson(Map<String, dynamic> json) =
      _$MOrderRequestImpl.fromJson;

  @override
  @JsonKey(name: "customer_id")
  int get customerId;
  @override
  String? get notes;
  @override
  @JsonKey(name: "total_quantity")
  int get totalQuantity;
  @override
  @JsonKey(name: "total_price")
  int get totalPrice;
  @override
  @JsonKey(name: "id_status")
  int? get idStatus;
  @override
  List<MProductRequest> get product;

  /// Create a copy of MOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MOrderRequestImplCopyWith<_$MOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
