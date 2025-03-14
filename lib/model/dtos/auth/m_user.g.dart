// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MUserImpl _$$MUserImplFromJson(Map<String, dynamic> json) => _$MUserImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String? ?? "",
      gender: json['gender'] as String?,
      salt: json['salt'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      displayName: json['display_name'] as String? ?? "",
      userStatus: (json['user_status'] as num?)?.toInt(),
      groupId: (json['group_id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      created: json['created'] as String? ?? "",
      updated: json['updated'] as String? ?? "",
      deleted: (json['deleted'] as num?)?.toInt() ?? 0,
      logined: json['logined'] as String? ?? "",
      ipLogged: json['ip_logged'] as String?,
      lockStatus: (json['lock_status'] as num?)?.toInt(),
      passLock: json['passLock'] as String?,
      code: json['code'] as String?,
      codeTimeOut: json['code_time_out'] as String?,
      userInit: (json['user_init'] as num?)?.toInt(),
      rolesId: (json['roles_id'] as num?)?.toInt(),
      userAssigned: (json['user_assigned'] as num?)?.toInt(),
      companyId: json['company_id'] as String?,
      companySelect: (json['company_select'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MUserImplToJson(_$MUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'gender': instance.gender,
      'salt': instance.salt,
      'email': instance.email,
      'phone': instance.phone,
      'display_name': instance.displayName,
      'user_status': instance.userStatus,
      'group_id': instance.groupId,
      'customer_id': instance.customerId,
      'store_id': instance.storeId,
      'created': instance.created,
      'updated': instance.updated,
      'deleted': instance.deleted,
      'logined': instance.logined,
      'ip_logged': instance.ipLogged,
      'lock_status': instance.lockStatus,
      'passLock': instance.passLock,
      'code': instance.code,
      'code_time_out': instance.codeTimeOut,
      'user_init': instance.userInit,
      'roles_id': instance.rolesId,
      'user_assigned': instance.userAssigned,
      'company_id': instance.companyId,
      'company_select': instance.companySelect,
    };
