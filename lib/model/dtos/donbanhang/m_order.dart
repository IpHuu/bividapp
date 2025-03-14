import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_order.freezed.dart';
part 'm_order.g.dart';

@freezed
class MOrder with _$MOrder {
  factory MOrder({
    int? id,
    String? output_code,
    int? customer_id,
    @JsonKey(name: 'customer_name') @Default("") String customerName,
    @JsonKey(name: 'user_order') @Default("") String userOrder,
    @JsonKey(name: 'store_name') @Default("") String storeName,
    @JsonKey(name: 'status_name') @Default("") String statusName,
    @JsonKey(name: 'company_name') @Default("") String companyName,
    @Default("") String created,
    @Default(0) int total_money,
    int? store_id,
    String? company_id,
  }) = _MOrder;

  factory MOrder.fromJson(Map<String, dynamic> json) => _$MOrderFromJson(json);
}
