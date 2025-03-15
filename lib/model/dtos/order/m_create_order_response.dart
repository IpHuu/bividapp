import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_create_order_response.freezed.dart';
part 'm_create_order_response.g.dart';

@freezed
class MCreateOrderResponse with _$MCreateOrderResponse {
  factory MCreateOrderResponse({
    @Default("") String message,
    @JsonKey(name: "order_id") int? orderID,
  }) = _MCreateOrderResponse;

  factory MCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$MCreateOrderResponseFromJson(json);
}
