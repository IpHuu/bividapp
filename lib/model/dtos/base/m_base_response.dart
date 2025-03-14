import 'package:bividpharma/model/dtos/base/api_result.dart';
import 'package:bividpharma/model/dtos/base/m_error.dart';
import 'package:bividpharma/model/dtos/base/m_pagination.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_base_response.freezed.dart';
part 'm_base_response.g.dart';

@Freezed(genericArgumentFactories: true)
class MBaseResponse<T> with _$MBaseResponse<T> {
  const factory MBaseResponse({
    T? data,
    MPagination? pagination,
    MError? error,
  }) = _MBaseResponse<T>;

  factory MBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$MBaseResponseFromJson<T>(json, fromJsonT);
}
