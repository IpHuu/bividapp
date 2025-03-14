// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_orderlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MOrderList _$MOrderListFromJson(Map<String, dynamic> json) {
  return _MOrderList.fromJson(json);
}

/// @nodoc
mixin _$MOrderList {
  int get current_page => throw _privateConstructorUsedError;
  List<MOrder>? get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this MOrderList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MOrderList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MOrderListCopyWith<MOrderList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MOrderListCopyWith<$Res> {
  factory $MOrderListCopyWith(
          MOrderList value, $Res Function(MOrderList) then) =
      _$MOrderListCopyWithImpl<$Res, MOrderList>;
  @useResult
  $Res call({int current_page, List<MOrder>? data, int total});
}

/// @nodoc
class _$MOrderListCopyWithImpl<$Res, $Val extends MOrderList>
    implements $MOrderListCopyWith<$Res> {
  _$MOrderListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MOrderList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? data = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MOrder>?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MOrderListImplCopyWith<$Res>
    implements $MOrderListCopyWith<$Res> {
  factory _$$MOrderListImplCopyWith(
          _$MOrderListImpl value, $Res Function(_$MOrderListImpl) then) =
      __$$MOrderListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current_page, List<MOrder>? data, int total});
}

/// @nodoc
class __$$MOrderListImplCopyWithImpl<$Res>
    extends _$MOrderListCopyWithImpl<$Res, _$MOrderListImpl>
    implements _$$MOrderListImplCopyWith<$Res> {
  __$$MOrderListImplCopyWithImpl(
      _$MOrderListImpl _value, $Res Function(_$MOrderListImpl) _then)
      : super(_value, _then);

  /// Create a copy of MOrderList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? data = freezed,
    Object? total = null,
  }) {
    return _then(_$MOrderListImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MOrder>?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MOrderListImpl implements _MOrderList {
  _$MOrderListImpl(
      {this.current_page = 0, final List<MOrder>? data, this.total = 0})
      : _data = data;

  factory _$MOrderListImpl.fromJson(Map<String, dynamic> json) =>
      _$$MOrderListImplFromJson(json);

  @override
  @JsonKey()
  final int current_page;
  final List<MOrder>? _data;
  @override
  List<MOrder>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'MOrderList(current_page: $current_page, data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MOrderListImpl &&
            (identical(other.current_page, current_page) ||
                other.current_page == current_page) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, current_page,
      const DeepCollectionEquality().hash(_data), total);

  /// Create a copy of MOrderList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MOrderListImplCopyWith<_$MOrderListImpl> get copyWith =>
      __$$MOrderListImplCopyWithImpl<_$MOrderListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MOrderListImplToJson(
      this,
    );
  }
}

abstract class _MOrderList implements MOrderList {
  factory _MOrderList(
      {final int current_page,
      final List<MOrder>? data,
      final int total}) = _$MOrderListImpl;

  factory _MOrderList.fromJson(Map<String, dynamic> json) =
      _$MOrderListImpl.fromJson;

  @override
  int get current_page;
  @override
  List<MOrder>? get data;
  @override
  int get total;

  /// Create a copy of MOrderList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MOrderListImplCopyWith<_$MOrderListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
