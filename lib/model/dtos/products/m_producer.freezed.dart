// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_producer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Producer _$ProducerFromJson(Map<String, dynamic> json) {
  return _Producer.fromJson(json);
}

/// @nodoc
mixin _$Producer {
  int? get id => throw _privateConstructorUsedError;
  String? get prd_manuf_name => throw _privateConstructorUsedError;

  /// Serializes this Producer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Producer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProducerCopyWith<Producer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProducerCopyWith<$Res> {
  factory $ProducerCopyWith(Producer value, $Res Function(Producer) then) =
      _$ProducerCopyWithImpl<$Res, Producer>;
  @useResult
  $Res call({int? id, String? prd_manuf_name});
}

/// @nodoc
class _$ProducerCopyWithImpl<$Res, $Val extends Producer>
    implements $ProducerCopyWith<$Res> {
  _$ProducerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Producer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prd_manuf_name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      prd_manuf_name: freezed == prd_manuf_name
          ? _value.prd_manuf_name
          : prd_manuf_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProducerImplCopyWith<$Res>
    implements $ProducerCopyWith<$Res> {
  factory _$$ProducerImplCopyWith(
          _$ProducerImpl value, $Res Function(_$ProducerImpl) then) =
      __$$ProducerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? prd_manuf_name});
}

/// @nodoc
class __$$ProducerImplCopyWithImpl<$Res>
    extends _$ProducerCopyWithImpl<$Res, _$ProducerImpl>
    implements _$$ProducerImplCopyWith<$Res> {
  __$$ProducerImplCopyWithImpl(
      _$ProducerImpl _value, $Res Function(_$ProducerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Producer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prd_manuf_name = freezed,
  }) {
    return _then(_$ProducerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      prd_manuf_name: freezed == prd_manuf_name
          ? _value.prd_manuf_name
          : prd_manuf_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProducerImpl implements _Producer {
  const _$ProducerImpl({this.id, this.prd_manuf_name});

  factory _$ProducerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProducerImplFromJson(json);

  @override
  final int? id;
  @override
  final String? prd_manuf_name;

  @override
  String toString() {
    return 'Producer(id: $id, prd_manuf_name: $prd_manuf_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProducerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prd_manuf_name, prd_manuf_name) ||
                other.prd_manuf_name == prd_manuf_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, prd_manuf_name);

  /// Create a copy of Producer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProducerImplCopyWith<_$ProducerImpl> get copyWith =>
      __$$ProducerImplCopyWithImpl<_$ProducerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProducerImplToJson(
      this,
    );
  }
}

abstract class _Producer implements Producer {
  const factory _Producer({final int? id, final String? prd_manuf_name}) =
      _$ProducerImpl;

  factory _Producer.fromJson(Map<String, dynamic> json) =
      _$ProducerImpl.fromJson;

  @override
  int? get id;
  @override
  String? get prd_manuf_name;

  /// Create a copy of Producer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProducerImplCopyWith<_$ProducerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
