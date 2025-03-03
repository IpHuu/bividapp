// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MLogin _$MLoginFromJson(Map<String, dynamic> json) {
  return $MLogin.fromJson(json);
}

/// @nodoc
mixin _$MLogin {
  String get userName => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String get deviceIpv4 => throw _privateConstructorUsedError;
  String get publicIpv4 => throw _privateConstructorUsedError;
  String get publicIpv6 => throw _privateConstructorUsedError;

  /// Serializes this MLogin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MLoginCopyWith<MLogin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MLoginCopyWith<$Res> {
  factory $MLoginCopyWith(MLogin value, $Res Function(MLogin) then) =
      _$MLoginCopyWithImpl<$Res, MLogin>;
  @useResult
  $Res call(
      {String userName,
      String fullName,
      String password,
      String deviceName,
      String deviceIpv4,
      String publicIpv4,
      String publicIpv6});
}

/// @nodoc
class _$MLoginCopyWithImpl<$Res, $Val extends MLogin>
    implements $MLoginCopyWith<$Res> {
  _$MLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MLogin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? fullName = null,
    Object? password = null,
    Object? deviceName = null,
    Object? deviceIpv4 = null,
    Object? publicIpv4 = null,
    Object? publicIpv6 = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceIpv4: null == deviceIpv4
          ? _value.deviceIpv4
          : deviceIpv4 // ignore: cast_nullable_to_non_nullable
              as String,
      publicIpv4: null == publicIpv4
          ? _value.publicIpv4
          : publicIpv4 // ignore: cast_nullable_to_non_nullable
              as String,
      publicIpv6: null == publicIpv6
          ? _value.publicIpv6
          : publicIpv6 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$MLoginImplCopyWith<$Res> implements $MLoginCopyWith<$Res> {
  factory _$$$MLoginImplCopyWith(
          _$$MLoginImpl value, $Res Function(_$$MLoginImpl) then) =
      __$$$MLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String fullName,
      String password,
      String deviceName,
      String deviceIpv4,
      String publicIpv4,
      String publicIpv6});
}

/// @nodoc
class __$$$MLoginImplCopyWithImpl<$Res>
    extends _$MLoginCopyWithImpl<$Res, _$$MLoginImpl>
    implements _$$$MLoginImplCopyWith<$Res> {
  __$$$MLoginImplCopyWithImpl(
      _$$MLoginImpl _value, $Res Function(_$$MLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of MLogin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? fullName = null,
    Object? password = null,
    Object? deviceName = null,
    Object? deviceIpv4 = null,
    Object? publicIpv4 = null,
    Object? publicIpv6 = null,
  }) {
    return _then(_$$MLoginImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceIpv4: null == deviceIpv4
          ? _value.deviceIpv4
          : deviceIpv4 // ignore: cast_nullable_to_non_nullable
              as String,
      publicIpv4: null == publicIpv4
          ? _value.publicIpv4
          : publicIpv4 // ignore: cast_nullable_to_non_nullable
              as String,
      publicIpv6: null == publicIpv6
          ? _value.publicIpv6
          : publicIpv6 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$MLoginImpl implements $MLogin {
  _$$MLoginImpl(
      {this.userName = "",
      this.fullName = "",
      this.password = "",
      this.deviceName = "",
      this.deviceIpv4 = "",
      this.publicIpv4 = "",
      this.publicIpv6 = ""});

  factory _$$MLoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$$MLoginImplFromJson(json);

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String deviceName;
  @override
  @JsonKey()
  final String deviceIpv4;
  @override
  @JsonKey()
  final String publicIpv4;
  @override
  @JsonKey()
  final String publicIpv6;

  @override
  String toString() {
    return 'MLogin(userName: $userName, fullName: $fullName, password: $password, deviceName: $deviceName, deviceIpv4: $deviceIpv4, publicIpv4: $publicIpv4, publicIpv6: $publicIpv6)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$MLoginImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceIpv4, deviceIpv4) ||
                other.deviceIpv4 == deviceIpv4) &&
            (identical(other.publicIpv4, publicIpv4) ||
                other.publicIpv4 == publicIpv4) &&
            (identical(other.publicIpv6, publicIpv6) ||
                other.publicIpv6 == publicIpv6));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, fullName, password,
      deviceName, deviceIpv4, publicIpv4, publicIpv6);

  /// Create a copy of MLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$$MLoginImplCopyWith<_$$MLoginImpl> get copyWith =>
      __$$$MLoginImplCopyWithImpl<_$$MLoginImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$MLoginImplToJson(
      this,
    );
  }
}

abstract class $MLogin implements MLogin {
  factory $MLogin(
      {final String userName,
      final String fullName,
      final String password,
      final String deviceName,
      final String deviceIpv4,
      final String publicIpv4,
      final String publicIpv6}) = _$$MLoginImpl;

  factory $MLogin.fromJson(Map<String, dynamic> json) = _$$MLoginImpl.fromJson;

  @override
  String get userName;
  @override
  String get fullName;
  @override
  String get password;
  @override
  String get deviceName;
  @override
  String get deviceIpv4;
  @override
  String get publicIpv4;
  @override
  String get publicIpv6;

  /// Create a copy of MLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$$MLoginImplCopyWith<_$$MLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
