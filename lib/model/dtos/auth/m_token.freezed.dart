// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MToken _$MTokenFromJson(Map<String, dynamic> json) {
  return _MToken.fromJson(json);
}

/// @nodoc
mixin _$MToken {
  String get userid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userFullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  DateTime? get validaty => throw _privateConstructorUsedError;
  DateTime? get expireTime => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;

  /// Serializes this MToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MTokenCopyWith<MToken> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MTokenCopyWith<$Res> {
  factory $MTokenCopyWith(MToken value, $Res Function(MToken) then) =
      _$MTokenCopyWithImpl<$Res, MToken>;
  @useResult
  $Res call(
      {String userid,
      String userName,
      String userFullName,
      String email,
      String refreshToken,
      DateTime? validaty,
      DateTime? expireTime,
      String tokenId});
}

/// @nodoc
class _$MTokenCopyWithImpl<$Res, $Val extends MToken>
    implements $MTokenCopyWith<$Res> {
  _$MTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userid = null,
    Object? userName = null,
    Object? userFullName = null,
    Object? email = null,
    Object? refreshToken = null,
    Object? validaty = freezed,
    Object? expireTime = freezed,
    Object? tokenId = null,
  }) {
    return _then(_value.copyWith(
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userFullName: null == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      validaty: freezed == validaty
          ? _value.validaty
          : validaty // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireTime: freezed == expireTime
          ? _value.expireTime
          : expireTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MTokenImplCopyWith<$Res> implements $MTokenCopyWith<$Res> {
  factory _$$MTokenImplCopyWith(
          _$MTokenImpl value, $Res Function(_$MTokenImpl) then) =
      __$$MTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userid,
      String userName,
      String userFullName,
      String email,
      String refreshToken,
      DateTime? validaty,
      DateTime? expireTime,
      String tokenId});
}

/// @nodoc
class __$$MTokenImplCopyWithImpl<$Res>
    extends _$MTokenCopyWithImpl<$Res, _$MTokenImpl>
    implements _$$MTokenImplCopyWith<$Res> {
  __$$MTokenImplCopyWithImpl(
      _$MTokenImpl _value, $Res Function(_$MTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of MToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userid = null,
    Object? userName = null,
    Object? userFullName = null,
    Object? email = null,
    Object? refreshToken = null,
    Object? validaty = freezed,
    Object? expireTime = freezed,
    Object? tokenId = null,
  }) {
    return _then(_$MTokenImpl(
      userid: null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userFullName: null == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      validaty: freezed == validaty
          ? _value.validaty
          : validaty // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireTime: freezed == expireTime
          ? _value.expireTime
          : expireTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MTokenImpl implements _MToken {
  _$MTokenImpl(
      {this.userid = "",
      this.userName = "",
      this.userFullName = "",
      this.email = "",
      this.refreshToken = "",
      this.validaty = null,
      this.expireTime = null,
      this.tokenId = ""});

  factory _$MTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$MTokenImplFromJson(json);

  @override
  @JsonKey()
  final String userid;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String userFullName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String refreshToken;
  @override
  @JsonKey()
  final DateTime? validaty;
  @override
  @JsonKey()
  final DateTime? expireTime;
  @override
  @JsonKey()
  final String tokenId;

  @override
  String toString() {
    return 'MToken(userid: $userid, userName: $userName, userFullName: $userFullName, email: $email, refreshToken: $refreshToken, validaty: $validaty, expireTime: $expireTime, tokenId: $tokenId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MTokenImpl &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userFullName, userFullName) ||
                other.userFullName == userFullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.validaty, validaty) ||
                other.validaty == validaty) &&
            (identical(other.expireTime, expireTime) ||
                other.expireTime == expireTime) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userid, userName, userFullName,
      email, refreshToken, validaty, expireTime, tokenId);

  /// Create a copy of MToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MTokenImplCopyWith<_$MTokenImpl> get copyWith =>
      __$$MTokenImplCopyWithImpl<_$MTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MTokenImplToJson(
      this,
    );
  }
}

abstract class _MToken implements MToken {
  factory _MToken(
      {final String userid,
      final String userName,
      final String userFullName,
      final String email,
      final String refreshToken,
      final DateTime? validaty,
      final DateTime? expireTime,
      final String tokenId}) = _$MTokenImpl;

  factory _MToken.fromJson(Map<String, dynamic> json) = _$MTokenImpl.fromJson;

  @override
  String get userid;
  @override
  String get userName;
  @override
  String get userFullName;
  @override
  String get email;
  @override
  String get refreshToken;
  @override
  DateTime? get validaty;
  @override
  DateTime? get expireTime;
  @override
  String get tokenId;

  /// Create a copy of MToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MTokenImplCopyWith<_$MTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
