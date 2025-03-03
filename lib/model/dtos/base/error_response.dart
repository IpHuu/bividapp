// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  factory ErrorResponse(
      {@Default(false) @JsonKey(name: 'success') bool status,
      @Default(null) @JsonKey(name: 'message') String? message,
      @Default([])
      @JsonKey(name: 'validationErrors')
      List<String>? validationErrors}) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
