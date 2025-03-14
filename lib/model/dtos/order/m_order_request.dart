import 'package:bividpharma/model/dtos/order/m_product_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_order_request.freezed.dart';
part 'm_order_request.g.dart';

@freezed
class MOrderRequest with _$MOrderRequest {
  const factory MOrderRequest({
    @JsonKey(name: "customer_id") required int customerId,
    String? notes,
    @JsonKey(name: "total_quantity") required int totalQuantity,
    @JsonKey(name: "total_price") required int totalPrice,
    @JsonKey(name: "id_status") int? idStatus,
    required List<MProductRequest> product,
  }) = _MOrderRequest;

  factory MOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$MOrderRequestFromJson(json);
}
