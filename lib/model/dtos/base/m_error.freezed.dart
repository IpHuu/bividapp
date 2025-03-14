// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MError _$MErrorFromJson(Map<String, dynamic> json) {
  return _MError.fromJson(json);
}

/// @nodoc
mixin _$MError {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this MError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MErrorCopyWith<MError> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MErrorCopyWith<$Res> {
  factory $MErrorCopyWith(MError value, $Res Function(MError) then) =
      _$MErrorCopyWithImpl<$Res, MError>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class _$MErrorCopyWithImpl<$Res, $Val extends MError>
    implements $MErrorCopyWith<$Res> {
  _$MErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MErrorImplCopyWith<$Res> implements $MErrorCopyWith<$Res> {
  factory _$$MErrorImplCopyWith(
          _$MErrorImpl value, $Res Function(_$MErrorImpl) then) =
      __$$MErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message});
}

/// @nodoc
class __$$MErrorImplCopyWithImpl<$Res>
    extends _$MErrorCopyWithImpl<$Res, _$MErrorImpl>
    implements _$$MErrorImplCopyWith<$Res> {
  __$$MErrorImplCopyWithImpl(
      _$MErrorImpl _value, $Res Function(_$MErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$MErrorImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MErrorImpl implements _MError {
  _$MErrorImpl(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message});

  factory _$MErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$MErrorImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? message;

  @override
  String toString() {
    return 'MError(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of MError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MErrorImplCopyWith<_$MErrorImpl> get copyWith =>
      __$$MErrorImplCopyWithImpl<_$MErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MErrorImplToJson(
      this,
    );
  }
}

abstract class _MError implements MError {
  factory _MError(
      {@JsonKey(name: 'code') final int? code,
      @JsonKey(name: 'message') final String? message}) = _$MErrorImpl;

  factory _MError.fromJson(Map<String, dynamic> json) = _$MErrorImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'message')
  String? get message;

  /// Create a copy of MError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MErrorImplCopyWith<_$MErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
