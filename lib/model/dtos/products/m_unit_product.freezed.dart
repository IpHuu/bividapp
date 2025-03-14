// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_unit_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MUnitProduct _$MUnitProductFromJson(Map<String, dynamic> json) {
  return _MUnitProduct.fromJson(json);
}

/// @nodoc
mixin _$MUnitProduct {
  int? get ID => throw _privateConstructorUsedError;
  String? get prd_unit_name => throw _privateConstructorUsedError;

  /// Serializes this MUnitProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MUnitProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MUnitProductCopyWith<MUnitProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MUnitProductCopyWith<$Res> {
  factory $MUnitProductCopyWith(
          MUnitProduct value, $Res Function(MUnitProduct) then) =
      _$MUnitProductCopyWithImpl<$Res, MUnitProduct>;
  @useResult
  $Res call({int? ID, String? prd_unit_name});
}

/// @nodoc
class _$MUnitProductCopyWithImpl<$Res, $Val extends MUnitProduct>
    implements $MUnitProductCopyWith<$Res> {
  _$MUnitProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MUnitProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ID = freezed,
    Object? prd_unit_name = freezed,
  }) {
    return _then(_value.copyWith(
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as int?,
      prd_unit_name: freezed == prd_unit_name
          ? _value.prd_unit_name
          : prd_unit_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MUnitProductImplCopyWith<$Res>
    implements $MUnitProductCopyWith<$Res> {
  factory _$$MUnitProductImplCopyWith(
          _$MUnitProductImpl value, $Res Function(_$MUnitProductImpl) then) =
      __$$MUnitProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? ID, String? prd_unit_name});
}

/// @nodoc
class __$$MUnitProductImplCopyWithImpl<$Res>
    extends _$MUnitProductCopyWithImpl<$Res, _$MUnitProductImpl>
    implements _$$MUnitProductImplCopyWith<$Res> {
  __$$MUnitProductImplCopyWithImpl(
      _$MUnitProductImpl _value, $Res Function(_$MUnitProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of MUnitProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ID = freezed,
    Object? prd_unit_name = freezed,
  }) {
    return _then(_$MUnitProductImpl(
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as int?,
      prd_unit_name: freezed == prd_unit_name
          ? _value.prd_unit_name
          : prd_unit_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MUnitProductImpl implements _MUnitProduct {
  const _$MUnitProductImpl({this.ID, this.prd_unit_name});

  factory _$MUnitProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$MUnitProductImplFromJson(json);

  @override
  final int? ID;
  @override
  final String? prd_unit_name;

  @override
  String toString() {
    return 'MUnitProduct(ID: $ID, prd_unit_name: $prd_unit_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MUnitProductImpl &&
            (identical(other.ID, ID) || other.ID == ID) &&
            (identical(other.prd_unit_name, prd_unit_name) ||
                other.prd_unit_name == prd_unit_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ID, prd_unit_name);

  /// Create a copy of MUnitProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MUnitProductImplCopyWith<_$MUnitProductImpl> get copyWith =>
      __$$MUnitProductImplCopyWithImpl<_$MUnitProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MUnitProductImplToJson(
      this,
    );
  }
}

abstract class _MUnitProduct implements MUnitProduct {
  const factory _MUnitProduct({final int? ID, final String? prd_unit_name}) =
      _$MUnitProductImpl;

  factory _MUnitProduct.fromJson(Map<String, dynamic> json) =
      _$MUnitProductImpl.fromJson;

  @override
  int? get ID;
  @override
  String? get prd_unit_name;

  /// Create a copy of MUnitProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MUnitProductImplCopyWith<_$MUnitProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
