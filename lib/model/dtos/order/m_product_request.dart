import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_product_request.freezed.dart';
part 'm_product_request.g.dart';

@freezed
class MProductRequest with _$MProductRequest {
  const factory MProductRequest({
    @JsonKey(name: "product_id") required int productId,
    required int quantity,
    required String name,
    @JsonKey(name: "maProduct") required String productCode,
    required int price,
  }) = _MProductRequest;

  factory MProductRequest.fromJson(Map<String, dynamic> json) =>
      _$MProductRequestFromJson(json);
}
