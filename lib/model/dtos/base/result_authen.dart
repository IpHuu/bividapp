import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_authen.freezed.dart';
part 'result_authen.g.dart';

@freezed
class Result with _$Result {
  factory Result({
    required String deviceName,
    required String deviceIpv4,
    required String publicIpv4,
    required String publicIpv6,
    required String companyCode,
    required String tokenId,
    required String userId,
    required String userName,
    required String userFullName,
    required String positionName,
    required String validaty,
    required String refreshToken,
    required String email,
    required String expiredTime,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
