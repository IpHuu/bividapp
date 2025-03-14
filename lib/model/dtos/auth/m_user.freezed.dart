// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MUser _$MUserFromJson(Map<String, dynamic> json) {
  return _MUser.fromJson(json);
}

/// @nodoc
mixin _$MUser {
  int? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get salt => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_status')
  int? get userStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_id')
  int? get storeId => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;
  int get deleted => throw _privateConstructorUsedError;
  String get logined => throw _privateConstructorUsedError;
  @JsonKey(name: 'ip_logged')
  String? get ipLogged => throw _privateConstructorUsedError;
  @JsonKey(name: 'lock_status')
  int? get lockStatus => throw _privateConstructorUsedError;
  String? get passLock => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'code_time_out')
  String? get codeTimeOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_init')
  int? get userInit => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles_id')
  int? get rolesId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_assigned')
  int? get userAssigned => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  String? get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_select')
  int? get companySelect => throw _privateConstructorUsedError;

  /// Serializes this MUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MUserCopyWith<MUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MUserCopyWith<$Res> {
  factory $MUserCopyWith(MUser value, $Res Function(MUser) then) =
      _$MUserCopyWithImpl<$Res, MUser>;
  @useResult
  $Res call(
      {int? id,
      String username,
      String? gender,
      String? salt,
      String? email,
      String? phone,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'user_status') int? userStatus,
      @JsonKey(name: 'group_id') int? groupId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'store_id') int? storeId,
      String created,
      String updated,
      int deleted,
      String logined,
      @JsonKey(name: 'ip_logged') String? ipLogged,
      @JsonKey(name: 'lock_status') int? lockStatus,
      String? passLock,
      String? code,
      @JsonKey(name: 'code_time_out') String? codeTimeOut,
      @JsonKey(name: 'user_init') int? userInit,
      @JsonKey(name: 'roles_id') int? rolesId,
      @JsonKey(name: 'user_assigned') int? userAssigned,
      @JsonKey(name: 'company_id') String? companyId,
      @JsonKey(name: 'company_select') int? companySelect});
}

/// @nodoc
class _$MUserCopyWithImpl<$Res, $Val extends MUser>
    implements $MUserCopyWith<$Res> {
  _$MUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? gender = freezed,
    Object? salt = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? displayName = null,
    Object? userStatus = freezed,
    Object? groupId = freezed,
    Object? customerId = freezed,
    Object? storeId = freezed,
    Object? created = null,
    Object? updated = null,
    Object? deleted = null,
    Object? logined = null,
    Object? ipLogged = freezed,
    Object? lockStatus = freezed,
    Object? passLock = freezed,
    Object? code = freezed,
    Object? codeTimeOut = freezed,
    Object? userInit = freezed,
    Object? rolesId = freezed,
    Object? userAssigned = freezed,
    Object? companyId = freezed,
    Object? companySelect = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      salt: freezed == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int,
      logined: null == logined
          ? _value.logined
          : logined // ignore: cast_nullable_to_non_nullable
              as String,
      ipLogged: freezed == ipLogged
          ? _value.ipLogged
          : ipLogged // ignore: cast_nullable_to_non_nullable
              as String?,
      lockStatus: freezed == lockStatus
          ? _value.lockStatus
          : lockStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      passLock: freezed == passLock
          ? _value.passLock
          : passLock // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeTimeOut: freezed == codeTimeOut
          ? _value.codeTimeOut
          : codeTimeOut // ignore: cast_nullable_to_non_nullable
              as String?,
      userInit: freezed == userInit
          ? _value.userInit
          : userInit // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesId: freezed == rolesId
          ? _value.rolesId
          : rolesId // ignore: cast_nullable_to_non_nullable
              as int?,
      userAssigned: freezed == userAssigned
          ? _value.userAssigned
          : userAssigned // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      companySelect: freezed == companySelect
          ? _value.companySelect
          : companySelect // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MUserImplCopyWith<$Res> implements $MUserCopyWith<$Res> {
  factory _$$MUserImplCopyWith(
          _$MUserImpl value, $Res Function(_$MUserImpl) then) =
      __$$MUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String username,
      String? gender,
      String? salt,
      String? email,
      String? phone,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'user_status') int? userStatus,
      @JsonKey(name: 'group_id') int? groupId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'store_id') int? storeId,
      String created,
      String updated,
      int deleted,
      String logined,
      @JsonKey(name: 'ip_logged') String? ipLogged,
      @JsonKey(name: 'lock_status') int? lockStatus,
      String? passLock,
      String? code,
      @JsonKey(name: 'code_time_out') String? codeTimeOut,
      @JsonKey(name: 'user_init') int? userInit,
      @JsonKey(name: 'roles_id') int? rolesId,
      @JsonKey(name: 'user_assigned') int? userAssigned,
      @JsonKey(name: 'company_id') String? companyId,
      @JsonKey(name: 'company_select') int? companySelect});
}

/// @nodoc
class __$$MUserImplCopyWithImpl<$Res>
    extends _$MUserCopyWithImpl<$Res, _$MUserImpl>
    implements _$$MUserImplCopyWith<$Res> {
  __$$MUserImplCopyWithImpl(
      _$MUserImpl _value, $Res Function(_$MUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = null,
    Object? gender = freezed,
    Object? salt = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? displayName = null,
    Object? userStatus = freezed,
    Object? groupId = freezed,
    Object? customerId = freezed,
    Object? storeId = freezed,
    Object? created = null,
    Object? updated = null,
    Object? deleted = null,
    Object? logined = null,
    Object? ipLogged = freezed,
    Object? lockStatus = freezed,
    Object? passLock = freezed,
    Object? code = freezed,
    Object? codeTimeOut = freezed,
    Object? userInit = freezed,
    Object? rolesId = freezed,
    Object? userAssigned = freezed,
    Object? companyId = freezed,
    Object? companySelect = freezed,
  }) {
    return _then(_$MUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      salt: freezed == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int,
      logined: null == logined
          ? _value.logined
          : logined // ignore: cast_nullable_to_non_nullable
              as String,
      ipLogged: freezed == ipLogged
          ? _value.ipLogged
          : ipLogged // ignore: cast_nullable_to_non_nullable
              as String?,
      lockStatus: freezed == lockStatus
          ? _value.lockStatus
          : lockStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      passLock: freezed == passLock
          ? _value.passLock
          : passLock // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeTimeOut: freezed == codeTimeOut
          ? _value.codeTimeOut
          : codeTimeOut // ignore: cast_nullable_to_non_nullable
              as String?,
      userInit: freezed == userInit
          ? _value.userInit
          : userInit // ignore: cast_nullable_to_non_nullable
              as int?,
      rolesId: freezed == rolesId
          ? _value.rolesId
          : rolesId // ignore: cast_nullable_to_non_nullable
              as int?,
      userAssigned: freezed == userAssigned
          ? _value.userAssigned
          : userAssigned // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      companySelect: freezed == companySelect
          ? _value.companySelect
          : companySelect // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MUserImpl implements _MUser {
  const _$MUserImpl(
      {this.id,
      this.username = "",
      this.gender,
      this.salt,
      this.email,
      this.phone,
      @JsonKey(name: 'display_name') this.displayName = "",
      @JsonKey(name: 'user_status') this.userStatus,
      @JsonKey(name: 'group_id') this.groupId,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'store_id') this.storeId,
      this.created = "",
      this.updated = "",
      this.deleted = 0,
      this.logined = "",
      @JsonKey(name: 'ip_logged') this.ipLogged,
      @JsonKey(name: 'lock_status') this.lockStatus,
      this.passLock,
      this.code,
      @JsonKey(name: 'code_time_out') this.codeTimeOut,
      @JsonKey(name: 'user_init') this.userInit,
      @JsonKey(name: 'roles_id') this.rolesId,
      @JsonKey(name: 'user_assigned') this.userAssigned,
      @JsonKey(name: 'company_id') this.companyId,
      @JsonKey(name: 'company_select') this.companySelect});

  factory _$MUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$MUserImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final String username;
  @override
  final String? gender;
  @override
  final String? salt;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  @JsonKey(name: 'user_status')
  final int? userStatus;
  @override
  @JsonKey(name: 'group_id')
  final int? groupId;
  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'store_id')
  final int? storeId;
  @override
  @JsonKey()
  final String created;
  @override
  @JsonKey()
  final String updated;
  @override
  @JsonKey()
  final int deleted;
  @override
  @JsonKey()
  final String logined;
  @override
  @JsonKey(name: 'ip_logged')
  final String? ipLogged;
  @override
  @JsonKey(name: 'lock_status')
  final int? lockStatus;
  @override
  final String? passLock;
  @override
  final String? code;
  @override
  @JsonKey(name: 'code_time_out')
  final String? codeTimeOut;
  @override
  @JsonKey(name: 'user_init')
  final int? userInit;
  @override
  @JsonKey(name: 'roles_id')
  final int? rolesId;
  @override
  @JsonKey(name: 'user_assigned')
  final int? userAssigned;
  @override
  @JsonKey(name: 'company_id')
  final String? companyId;
  @override
  @JsonKey(name: 'company_select')
  final int? companySelect;

  @override
  String toString() {
    return 'MUser(id: $id, username: $username, gender: $gender, salt: $salt, email: $email, phone: $phone, displayName: $displayName, userStatus: $userStatus, groupId: $groupId, customerId: $customerId, storeId: $storeId, created: $created, updated: $updated, deleted: $deleted, logined: $logined, ipLogged: $ipLogged, lockStatus: $lockStatus, passLock: $passLock, code: $code, codeTimeOut: $codeTimeOut, userInit: $userInit, rolesId: $rolesId, userAssigned: $userAssigned, companyId: $companyId, companySelect: $companySelect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.salt, salt) || other.salt == salt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.logined, logined) || other.logined == logined) &&
            (identical(other.ipLogged, ipLogged) ||
                other.ipLogged == ipLogged) &&
            (identical(other.lockStatus, lockStatus) ||
                other.lockStatus == lockStatus) &&
            (identical(other.passLock, passLock) ||
                other.passLock == passLock) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.codeTimeOut, codeTimeOut) ||
                other.codeTimeOut == codeTimeOut) &&
            (identical(other.userInit, userInit) ||
                other.userInit == userInit) &&
            (identical(other.rolesId, rolesId) || other.rolesId == rolesId) &&
            (identical(other.userAssigned, userAssigned) ||
                other.userAssigned == userAssigned) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.companySelect, companySelect) ||
                other.companySelect == companySelect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        gender,
        salt,
        email,
        phone,
        displayName,
        userStatus,
        groupId,
        customerId,
        storeId,
        created,
        updated,
        deleted,
        logined,
        ipLogged,
        lockStatus,
        passLock,
        code,
        codeTimeOut,
        userInit,
        rolesId,
        userAssigned,
        companyId,
        companySelect
      ]);

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MUserImplCopyWith<_$MUserImpl> get copyWith =>
      __$$MUserImplCopyWithImpl<_$MUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MUserImplToJson(
      this,
    );
  }
}

abstract class _MUser implements MUser {
  const factory _MUser(
      {final int? id,
      final String username,
      final String? gender,
      final String? salt,
      final String? email,
      final String? phone,
      @JsonKey(name: 'display_name') final String displayName,
      @JsonKey(name: 'user_status') final int? userStatus,
      @JsonKey(name: 'group_id') final int? groupId,
      @JsonKey(name: 'customer_id') final int? customerId,
      @JsonKey(name: 'store_id') final int? storeId,
      final String created,
      final String updated,
      final int deleted,
      final String logined,
      @JsonKey(name: 'ip_logged') final String? ipLogged,
      @JsonKey(name: 'lock_status') final int? lockStatus,
      final String? passLock,
      final String? code,
      @JsonKey(name: 'code_time_out') final String? codeTimeOut,
      @JsonKey(name: 'user_init') final int? userInit,
      @JsonKey(name: 'roles_id') final int? rolesId,
      @JsonKey(name: 'user_assigned') final int? userAssigned,
      @JsonKey(name: 'company_id') final String? companyId,
      @JsonKey(name: 'company_select') final int? companySelect}) = _$MUserImpl;

  factory _MUser.fromJson(Map<String, dynamic> json) = _$MUserImpl.fromJson;

  @override
  int? get id;
  @override
  String get username;
  @override
  String? get gender;
  @override
  String? get salt;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  @JsonKey(name: 'user_status')
  int? get userStatus;
  @override
  @JsonKey(name: 'group_id')
  int? get groupId;
  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'store_id')
  int? get storeId;
  @override
  String get created;
  @override
  String get updated;
  @override
  int get deleted;
  @override
  String get logined;
  @override
  @JsonKey(name: 'ip_logged')
  String? get ipLogged;
  @override
  @JsonKey(name: 'lock_status')
  int? get lockStatus;
  @override
  String? get passLock;
  @override
  String? get code;
  @override
  @JsonKey(name: 'code_time_out')
  String? get codeTimeOut;
  @override
  @JsonKey(name: 'user_init')
  int? get userInit;
  @override
  @JsonKey(name: 'roles_id')
  int? get rolesId;
  @override
  @JsonKey(name: 'user_assigned')
  int? get userAssigned;
  @override
  @JsonKey(name: 'company_id')
  String? get companyId;
  @override
  @JsonKey(name: 'company_select')
  int? get companySelect;

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MUserImplCopyWith<_$MUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
