import 'package:bividpharma/model/dtos/base/result_authen.dart';
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
