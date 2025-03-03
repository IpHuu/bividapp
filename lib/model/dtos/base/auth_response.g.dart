// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      exception: json['exception'] as String?,
      status: (json['status'] as num).toInt(),
      isCanceled: json['isCanceled'] as bool,
      isCompleted: json['isCompleted'] as bool,
      isCompletedSuccessfully: json['isCompletedSuccessfully'] as bool,
      creationOptions: (json['creationOptions'] as num).toInt(),
      asyncState: json['asyncState'] as String?,
      isFaulted: json['isFaulted'] as bool,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'id': instance.id,
      'exception': instance.exception,
      'status': instance.status,
      'isCanceled': instance.isCanceled,
      'isCompleted': instance.isCompleted,
      'isCompletedSuccessfully': instance.isCompletedSuccessfully,
      'creationOptions': instance.creationOptions,
      'asyncState': instance.asyncState,
      'isFaulted': instance.isFaulted,
    };

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      deviceName: json['deviceName'] as String,
      deviceIpv4: json['deviceIpv4'] as String,
      publicIpv4: json['publicIpv4'] as String,
      publicIpv6: json['publicIpv6'] as String,
      companyCode: json['companyCode'] as String,
      tokenId: json['tokenId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userFullName: json['userFullName'] as String,
      positionName: json['positionName'] as String,
      validaty: json['validaty'] as String,
      refreshToken: json['refreshToken'] as String,
      email: json['email'] as String,
      expiredTime: json['expiredTime'] as String,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'deviceIpv4': instance.deviceIpv4,
      'publicIpv4': instance.publicIpv4,
      'publicIpv6': instance.publicIpv6,
      'companyCode': instance.companyCode,
      'tokenId': instance.tokenId,
      'userId': instance.userId,
      'userName': instance.userName,
      'userFullName': instance.userFullName,
      'positionName': instance.positionName,
      'validaty': instance.validaty,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
      'expiredTime': instance.expiredTime,
    };
