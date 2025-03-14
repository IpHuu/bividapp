// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MPagination _$MPaginationFromJson(Map<String, dynamic> json) {
  return _MPagination.fromJson(json);
}

/// @nodoc
mixin _$MPagination {
  int get current_page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;
  int get per_page => throw _privateConstructorUsedError;

  /// Serializes this MPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MPaginationCopyWith<MPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPaginationCopyWith<$Res> {
  factory $MPaginationCopyWith(
          MPagination value, $Res Function(MPagination) then) =
      _$MPaginationCopyWithImpl<$Res, MPagination>;
  @useResult
  $Res call({int current_page, int total, int last_page, int per_page});
}

/// @nodoc
class _$MPaginationCopyWithImpl<$Res, $Val extends MPagination>
    implements $MPaginationCopyWith<$Res> {
  _$MPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? total = null,
    Object? last_page = null,
    Object? per_page = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MPaginationImplCopyWith<$Res>
    implements $MPaginationCopyWith<$Res> {
  factory _$$MPaginationImplCopyWith(
          _$MPaginationImpl value, $Res Function(_$MPaginationImpl) then) =
      __$$MPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current_page, int total, int last_page, int per_page});
}

/// @nodoc
class __$$MPaginationImplCopyWithImpl<$Res>
    extends _$MPaginationCopyWithImpl<$Res, _$MPaginationImpl>
    implements _$$MPaginationImplCopyWith<$Res> {
  __$$MPaginationImplCopyWithImpl(
      _$MPaginationImpl _value, $Res Function(_$MPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of MPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? total = null,
    Object? last_page = null,
    Object? per_page = null,
  }) {
    return _then(_$MPaginationImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: null == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MPaginationImpl implements _MPagination {
  _$MPaginationImpl(
      {this.current_page = 0,
      this.total = 0,
      this.last_page = 0,
      this.per_page = 0});

  factory _$MPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MPaginationImplFromJson(json);

  @override
  @JsonKey()
  final int current_page;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int last_page;
  @override
  @JsonKey()
  final int per_page;

  @override
  String toString() {
    return 'MPagination(current_page: $current_page, total: $total, last_page: $last_page, per_page: $per_page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MPaginationImpl &&
            (identical(other.current_page, current_page) ||
                other.current_page == current_page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.last_page, last_page) ||
                other.last_page == last_page) &&
            (identical(other.per_page, per_page) ||
                other.per_page == per_page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, current_page, total, last_page, per_page);

  /// Create a copy of MPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MPaginationImplCopyWith<_$MPaginationImpl> get copyWith =>
      __$$MPaginationImplCopyWithImpl<_$MPaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MPaginationImplToJson(
      this,
    );
  }
}

abstract class _MPagination implements MPagination {
  factory _MPagination(
      {final int current_page,
      final int total,
      final int last_page,
      final int per_page}) = _$MPaginationImpl;

  factory _MPagination.fromJson(Map<String, dynamic> json) =
      _$MPaginationImpl.fromJson;

  @override
  int get current_page;
  @override
  int get total;
  @override
  int get last_page;
  @override
  int get per_page;

  /// Create a copy of MPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MPaginationImplCopyWith<_$MPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
