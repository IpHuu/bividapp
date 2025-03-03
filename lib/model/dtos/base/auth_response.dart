import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    Result? result,
    required int id,
    String? exception,
    required int status,
    required bool isCanceled,
    required bool isCompleted,
    required bool isCompletedSuccessfully,
    required int creationOptions,
    String? asyncState,
    required bool isFaulted,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

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
