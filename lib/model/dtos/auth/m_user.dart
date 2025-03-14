import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_user.freezed.dart';
part 'm_user.g.dart';

@freezed
class MUser with _$MUser {
  const factory MUser({
    int? id,
    @Default("") String username,
    String? gender,
    String? salt,
    String? email,
    String? phone,
    @JsonKey(name: 'display_name') @Default("") String displayName,
    @JsonKey(name: 'user_status') int? userStatus,
    @JsonKey(name: 'group_id') int? groupId,
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'store_id') int? storeId,
    @Default("") String created,
    @Default("") String updated,
    @Default(0) int deleted,
    @Default("") String logined,
    @JsonKey(name: 'ip_logged') String? ipLogged,
    @JsonKey(name: 'lock_status') int? lockStatus,
    String? passLock,
    String? code,
    @JsonKey(name: 'code_time_out') String? codeTimeOut,
    @JsonKey(name: 'user_init') int? userInit,
    @JsonKey(name: 'roles_id') int? rolesId,
    @JsonKey(name: 'user_assigned') int? userAssigned,
    @JsonKey(name: 'company_id') String? companyId,
    @JsonKey(name: 'company_select') int? companySelect,
  }) = _MUser;

  factory MUser.fromJson(Map<String, dynamic> json) => _$MUserFromJson(json);
}
