// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_create_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MCreateOrderResponse _$MCreateOrderResponseFromJson(Map<String, dynamic> json) {
  return _MCreateOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$MCreateOrderResponse {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "order_id")
  int? get orderID => throw _privateConstructorUsedError;

  /// Serializes this MCreateOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MCreateOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MCreateOrderResponseCopyWith<MCreateOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MCreateOrderResponseCopyWith<$Res> {
  factory $MCreateOrderResponseCopyWith(MCreateOrderResponse value,
          $Res Function(MCreateOrderResponse) then) =
      _$MCreateOrderResponseCopyWithImpl<$Res, MCreateOrderResponse>;
  @useResult
  $Res call({String message, @JsonKey(name: "order_id") int? orderID});
}

/// @nodoc
class _$MCreateOrderResponseCopyWithImpl<$Res,
        $Val extends MCreateOrderResponse>
    implements $MCreateOrderResponseCopyWith<$Res> {
  _$MCreateOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MCreateOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? orderID = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: freezed == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MCreateOrderResponseImplCopyWith<$Res>
    implements $MCreateOrderResponseCopyWith<$Res> {
  factory _$$MCreateOrderResponseImplCopyWith(_$MCreateOrderResponseImpl value,
          $Res Function(_$MCreateOrderResponseImpl) then) =
      __$$MCreateOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, @JsonKey(name: "order_id") int? orderID});
}

/// @nodoc
class __$$MCreateOrderResponseImplCopyWithImpl<$Res>
    extends _$MCreateOrderResponseCopyWithImpl<$Res, _$MCreateOrderResponseImpl>
    implements _$$MCreateOrderResponseImplCopyWith<$Res> {
  __$$MCreateOrderResponseImplCopyWithImpl(_$MCreateOrderResponseImpl _value,
      $Res Function(_$MCreateOrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MCreateOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? orderID = freezed,
  }) {
    return _then(_$MCreateOrderResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: freezed == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MCreateOrderResponseImpl implements _MCreateOrderResponse {
  _$MCreateOrderResponseImpl(
      {this.message = "", @JsonKey(name: "order_id") this.orderID});

  factory _$MCreateOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MCreateOrderResponseImplFromJson(json);

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: "order_id")
  final int? orderID;

  @override
  String toString() {
    return 'MCreateOrderResponse(message: $message, orderID: $orderID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MCreateOrderResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.orderID, orderID) || other.orderID == orderID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, orderID);

  /// Create a copy of MCreateOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MCreateOrderResponseImplCopyWith<_$MCreateOrderResponseImpl>
      get copyWith =>
          __$$MCreateOrderResponseImplCopyWithImpl<_$MCreateOrderResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MCreateOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _MCreateOrderResponse implements MCreateOrderResponse {
  factory _MCreateOrderResponse(
          {final String message,
          @JsonKey(name: "order_id") final int? orderID}) =
      _$MCreateOrderResponseImpl;

  factory _MCreateOrderResponse.fromJson(Map<String, dynamic> json) =
      _$MCreateOrderResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: "order_id")
  int? get orderID;

  /// Create a copy of MCreateOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MCreateOrderResponseImplCopyWith<_$MCreateOrderResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
