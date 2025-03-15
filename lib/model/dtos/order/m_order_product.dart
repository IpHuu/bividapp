import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_order_product.freezed.dart';
part 'm_order_product.g.dart';

@freezed
class MOrderProductList with _$MOrderProductList {
  const factory MOrderProductList({
    @JsonKey(name: "ID") int? id,
    @JsonKey(name: "product_name") @Default("") String productName,
    @Default(0) int quantity,
    @Default(0) int price,
    int? bid_id,
    int? order_id,
    int? product_id,
    String? product_code,
    int? is_bids,
  }) = _MOrderProductList;

  factory MOrderProductList.fromJson(Map<String, dynamic> json) =>
      _$MOrderProductListFromJson(json);
}
