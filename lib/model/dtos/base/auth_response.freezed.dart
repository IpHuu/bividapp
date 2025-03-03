// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  Result? get result => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  bool get isCanceled => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isCompletedSuccessfully => throw _privateConstructorUsedError;
  int get creationOptions => throw _privateConstructorUsedError;
  String? get asyncState => throw _privateConstructorUsedError;
  bool get isFaulted => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call(
      {Result? result,
      int id,
      String? exception,
      int status,
      bool isCanceled,
      bool isCompleted,
      bool isCompletedSuccessfully,
      int creationOptions,
      String? asyncState,
      bool isFaulted});

  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? id = null,
    Object? exception = freezed,
    Object? status = null,
    Object? isCanceled = null,
    Object? isCompleted = null,
    Object? isCompletedSuccessfully = null,
    Object? creationOptions = null,
    Object? asyncState = freezed,
    Object? isFaulted = null,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompletedSuccessfully: null == isCompletedSuccessfully
          ? _value.isCompletedSuccessfully
          : isCompletedSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
      creationOptions: null == creationOptions
          ? _value.creationOptions
          : creationOptions // ignore: cast_nullable_to_non_nullable
              as int,
      asyncState: freezed == asyncState
          ? _value.asyncState
          : asyncState // ignore: cast_nullable_to_non_nullable
              as String?,
      isFaulted: null == isFaulted
          ? _value.isFaulted
          : isFaulted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
          _$AuthResponseImpl value, $Res Function(_$AuthResponseImpl) then) =
      __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result? result,
      int id,
      String? exception,
      int status,
      bool isCanceled,
      bool isCompleted,
      bool isCompletedSuccessfully,
      int creationOptions,
      String? asyncState,
      bool isFaulted});

  @override
  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
      _$AuthResponseImpl _value, $Res Function(_$AuthResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? id = null,
    Object? exception = freezed,
    Object? status = null,
    Object? isCanceled = null,
    Object? isCompleted = null,
    Object? isCompletedSuccessfully = null,
    Object? creationOptions = null,
    Object? asyncState = freezed,
    Object? isFaulted = null,
  }) {
    return _then(_$AuthResponseImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      isCanceled: null == isCanceled
          ? _value.isCanceled
          : isCanceled // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompletedSuccessfully: null == isCompletedSuccessfully
          ? _value.isCompletedSuccessfully
          : isCompletedSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
      creationOptions: null == creationOptions
          ? _value.creationOptions
          : creationOptions // ignore: cast_nullable_to_non_nullable
              as int,
      asyncState: freezed == asyncState
          ? _value.asyncState
          : asyncState // ignore: cast_nullable_to_non_nullable
              as String?,
      isFaulted: null == isFaulted
          ? _value.isFaulted
          : isFaulted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl implements _AuthResponse {
  _$AuthResponseImpl(
      {this.result,
      required this.id,
      this.exception,
      required this.status,
      required this.isCanceled,
      required this.isCompleted,
      required this.isCompletedSuccessfully,
      required this.creationOptions,
      this.asyncState,
      required this.isFaulted});

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  final Result? result;
  @override
  final int id;
  @override
  final String? exception;
  @override
  final int status;
  @override
  final bool isCanceled;
  @override
  final bool isCompleted;
  @override
  final bool isCompletedSuccessfully;
  @override
  final int creationOptions;
  @override
  final String? asyncState;
  @override
  final bool isFaulted;

  @override
  String toString() {
    return 'AuthResponse(result: $result, id: $id, exception: $exception, status: $status, isCanceled: $isCanceled, isCompleted: $isCompleted, isCompletedSuccessfully: $isCompletedSuccessfully, creationOptions: $creationOptions, asyncState: $asyncState, isFaulted: $isFaulted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isCanceled, isCanceled) ||
                other.isCanceled == isCanceled) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(
                    other.isCompletedSuccessfully, isCompletedSuccessfully) ||
                other.isCompletedSuccessfully == isCompletedSuccessfully) &&
            (identical(other.creationOptions, creationOptions) ||
                other.creationOptions == creationOptions) &&
            (identical(other.asyncState, asyncState) ||
                other.asyncState == asyncState) &&
            (identical(other.isFaulted, isFaulted) ||
                other.isFaulted == isFaulted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      result,
      id,
      exception,
      status,
      isCanceled,
      isCompleted,
      isCompletedSuccessfully,
      creationOptions,
      asyncState,
      isFaulted);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthResponse implements AuthResponse {
  factory _AuthResponse(
      {final Result? result,
      required final int id,
      final String? exception,
      required final int status,
      required final bool isCanceled,
      required final bool isCompleted,
      required final bool isCompletedSuccessfully,
      required final int creationOptions,
      final String? asyncState,
      required final bool isFaulted}) = _$AuthResponseImpl;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  Result? get result;
  @override
  int get id;
  @override
  String? get exception;
  @override
  int get status;
  @override
  bool get isCanceled;
  @override
  bool get isCompleted;
  @override
  bool get isCompletedSuccessfully;
  @override
  int get creationOptions;
  @override
  String? get asyncState;
  @override
  bool get isFaulted;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String get deviceName => throw _privateConstructorUsedError;
  String get deviceIpv4 => throw _privateConstructorUsedError;
  String get publicIpv4 => throw _privateConstructorUsedError;
  String get publicIpv6 => throw _privateConstructorUsedError;
  String get companyCode => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userFullName => throw _privateConstructorUsedError;
  String get positionName => throw _privateConstructorUsedError;
  String get validaty => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get expiredTime => throw _privateConstructorUsedError;

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {String deviceName,
      String deviceIpv4,
      String publicIpv4,
      String publicIpv6,
      String companyCode,
      String tokenId,
      String userId,
      String userName,
      String userFullName,
      String positionName,
      String validaty,
      String refreshToken,
      String email,
      String expiredTime});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? deviceIpv4 = null,
    Object? publicIpv4 = null,
    Object? publicIpv6 = null,
    Object? companyCode = null,
    Object? tokenId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userFullName = null,
    Object? positionName = null,
    Object? validaty = null,
    Object? refreshToken = null,
    Object? email = null,
    Object? expiredTime = null,
  }) {
    return _then(_value.copyWith(
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
      companyCode: null == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userFullName: null == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String,
      positionName: null == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String,
      validaty: null == validaty
          ? _value.validaty
          : validaty // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      expiredTime: null == expiredTime
          ? _value.expiredTime
          : expiredTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceName,
      String deviceIpv4,
      String publicIpv4,
      String publicIpv6,
      String companyCode,
      String tokenId,
      String userId,
      String userName,
      String userFullName,
      String positionName,
      String validaty,
      String refreshToken,
      String email,
      String expiredTime});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? deviceIpv4 = null,
    Object? publicIpv4 = null,
    Object? publicIpv6 = null,
    Object? companyCode = null,
    Object? tokenId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userFullName = null,
    Object? positionName = null,
    Object? validaty = null,
    Object? refreshToken = null,
    Object? email = null,
    Object? expiredTime = null,
  }) {
    return _then(_$ResultImpl(
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
      companyCode: null == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userFullName: null == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String,
      positionName: null == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String,
      validaty: null == validaty
          ? _value.validaty
          : validaty // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      expiredTime: null == expiredTime
          ? _value.expiredTime
          : expiredTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  _$ResultImpl(
      {required this.deviceName,
      required this.deviceIpv4,
      required this.publicIpv4,
      required this.publicIpv6,
      required this.companyCode,
      required this.tokenId,
      required this.userId,
      required this.userName,
      required this.userFullName,
      required this.positionName,
      required this.validaty,
      required this.refreshToken,
      required this.email,
      required this.expiredTime});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  final String deviceName;
  @override
  final String deviceIpv4;
  @override
  final String publicIpv4;
  @override
  final String publicIpv6;
  @override
  final String companyCode;
  @override
  final String tokenId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userFullName;
  @override
  final String positionName;
  @override
  final String validaty;
  @override
  final String refreshToken;
  @override
  final String email;
  @override
  final String expiredTime;

  @override
  String toString() {
    return 'Result(deviceName: $deviceName, deviceIpv4: $deviceIpv4, publicIpv4: $publicIpv4, publicIpv6: $publicIpv6, companyCode: $companyCode, tokenId: $tokenId, userId: $userId, userName: $userName, userFullName: $userFullName, positionName: $positionName, validaty: $validaty, refreshToken: $refreshToken, email: $email, expiredTime: $expiredTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceIpv4, deviceIpv4) ||
                other.deviceIpv4 == deviceIpv4) &&
            (identical(other.publicIpv4, publicIpv4) ||
                other.publicIpv4 == publicIpv4) &&
            (identical(other.publicIpv6, publicIpv6) ||
                other.publicIpv6 == publicIpv6) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userFullName, userFullName) ||
                other.userFullName == userFullName) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.validaty, validaty) ||
                other.validaty == validaty) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.expiredTime, expiredTime) ||
                other.expiredTime == expiredTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceName,
      deviceIpv4,
      publicIpv4,
      publicIpv6,
      companyCode,
      tokenId,
      userId,
      userName,
      userFullName,
      positionName,
      validaty,
      refreshToken,
      email,
      expiredTime);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  factory _Result(
      {required final String deviceName,
      required final String deviceIpv4,
      required final String publicIpv4,
      required final String publicIpv6,
      required final String companyCode,
      required final String tokenId,
      required final String userId,
      required final String userName,
      required final String userFullName,
      required final String positionName,
      required final String validaty,
      required final String refreshToken,
      required final String email,
      required final String expiredTime}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  String get deviceName;
  @override
  String get deviceIpv4;
  @override
  String get publicIpv4;
  @override
  String get publicIpv6;
  @override
  String get companyCode;
  @override
  String get tokenId;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get userFullName;
  @override
  String get positionName;
  @override
  String get validaty;
  @override
  String get refreshToken;
  @override
  String get email;
  @override
  String get expiredTime;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
