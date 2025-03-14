import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_error.freezed.dart';
part 'm_error.g.dart';

@freezed
class MError with _$MError {
  factory MError({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
  }) = _MError;

  factory MError.fromJson(Map<String, dynamic> json) => _$MErrorFromJson(json);
}
