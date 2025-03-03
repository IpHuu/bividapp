import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';

@freezed
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse.success(T data) = Success<T>;
  const factory BaseResponse.error(String message) = Error<T>;

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    if (json.containsKey('data')) {
      return Success<T>(fromJson(json['data']));
    } else if (json.containsKey('message')) {
      return Error<T>(json['message']);
    } else {
      throw Exception('Invalid ApiResponse JSON');
    }
  }
}
