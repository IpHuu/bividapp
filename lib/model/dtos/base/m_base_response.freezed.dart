// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MBaseResponse<T> _$MBaseResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _MBaseResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$MBaseResponse<T> {
  T? get data => throw _privateConstructorUsedError;
  MPagination? get pagination => throw _privateConstructorUsedError;
  MError? get error => throw _privateConstructorUsedError;

  /// Serializes this MBaseResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MBaseResponseCopyWith<T, MBaseResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MBaseResponseCopyWith<T, $Res> {
  factory $MBaseResponseCopyWith(
          MBaseResponse<T> value, $Res Function(MBaseResponse<T>) then) =
      _$MBaseResponseCopyWithImpl<T, $Res, MBaseResponse<T>>;
  @useResult
  $Res call({T? data, MPagination? pagination, MError? error});

  $MPaginationCopyWith<$Res>? get pagination;
  $MErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$MBaseResponseCopyWithImpl<T, $Res, $Val extends MBaseResponse<T>>
    implements $MBaseResponseCopyWith<T, $Res> {
  _$MBaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? pagination = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as MPagination?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as MError?,
    ) as $Val);
  }

  /// Create a copy of MBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MPaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $MPaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }

  /// Create a copy of MBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $MErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MBaseResponseImplCopyWith<T, $Res>
    implements $MBaseResponseCopyWith<T, $Res> {
  factory _$$MBaseResponseImplCopyWith(_$MBaseResponseImpl<T> value,
          $Res Function(_$MBaseResponseImpl<T>) then) =
      __$$MBaseResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, MPagination? pagination, MError? error});

  @override
  $MPaginationCopyWith<$Res>? get pagination;
  @override
  $MErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$MBaseResponseImplCopyWithImpl<T, $Res>
    extends _$MBaseResponseCopyWithImpl<T, $Res, _$MBaseResponseImpl<T>>
    implements _$$MBaseResponseImplCopyWith<T, $Res> {
  __$$MBaseResponseImplCopyWithImpl(_$MBaseResponseImpl<T> _value,
      $Res Function(_$MBaseResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of MBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? pagination = freezed,
    Object? error = freezed,
  }) {
    return _then(_$MBaseResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as MPagination?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as MError?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$MBaseResponseImpl<T> implements _MBaseResponse<T> {
  const _$MBaseResponseImpl({this.data, this.pagination, this.error});

  factory _$MBaseResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$MBaseResponseImplFromJson(json, fromJsonT);

  @override
  final T? data;
  @override
  final MPagination? pagination;
  @override
  final MError? error;

  @override
  String toString() {
    return 'MBaseResponse<$T>(data: $data, pagination: $pagination, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MBaseResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), pagination, error);

  /// Create a copy of MBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MBaseResponseImplCopyWith<T, _$MBaseResponseImpl<T>> get copyWith =>
      __$$MBaseResponseImplCopyWithImpl<T, _$MBaseResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$MBaseResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _MBaseResponse<T> implements MBaseResponse<T> {
  const factory _MBaseResponse(
      {final T? data,
      final MPagination? pagination,
      final MError? error}) = _$MBaseResponseImpl<T>;

  factory _MBaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$MBaseResponseImpl<T>.fromJson;

  @override
  T? get data;
  @override
  MPagination? get pagination;
  @override
  MError? get error;

  /// Create a copy of MBaseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MBaseResponseImplCopyWith<T, _$MBaseResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
