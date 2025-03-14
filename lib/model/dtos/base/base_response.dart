import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
class BaseResponse<T> with _$BaseResponse<T> {
  factory BaseResponse({
    required bool success,
    required String message,
    required int count,
    required List<String> validationErrors,
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) required T data,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseFromJson<T>(json).copyWith(data: fromJsonT(json['data']));
}

// Hàm giúp deserialize data
T _dataFromJson<T>(Object? json) {
  if (json is List) {
    return json.map((e) => e as T).toList() as T;
  } else if (json is Map<String, dynamic>) {
    return json as T;
  }
  throw Exception("Unsupported data type");
}

// Hàm giúp serialize data
// Hàm giúp serialize data
Object? _dataToJson<T>(T data) {
  if (data is List) {
    return data.map((e) => e).toList();
  } else if (data is Map<String, dynamic>) {
    return data;
  }
  return data;
}
