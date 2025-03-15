import 'package:bividpharma/model/dtos/order/m_order_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_order_detail.freezed.dart';
part 'm_order_detail.g.dart';

@freezed
class MOrderDetail with _$MOrderDetail {
  const factory MOrderDetail({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'output_code') String? outputCode,
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'store_id') int? storeId,
    @JsonKey(name: 'input_id') int? inputId,
    @JsonKey(name: 'sell_date') int? sellDate,
    @JsonKey(name: 'notes') String? notes,
    @JsonKey(name: 'payment_method') int? paymentMethod,
    @JsonKey(name: 'total_price') int? totalPrice,
    @JsonKey(name: 'total_origin_price') int? totalOriginPrice,
    @JsonKey(name: 'discount_item') int? discountItem,
    @JsonKey(name: 'coupon') String? coupon,
    @JsonKey(name: 'customer_pay') int? customerPay,
    @JsonKey(name: 'vat') int? vat,
    @JsonKey(name: 'total_money') @Default(0) int totalMoney,
    @JsonKey(name: 'total_quantity') @Default(0) int totalQuantity,
    @JsonKey(name: 'lack') int? lack,
    @JsonKey(name: 'order_details') List<MOrderProductList>? orderDetails,
    @JsonKey(name: 'order_status') int? orderStatus,
    @JsonKey(name: 'deleted') int? deleted,
    @JsonKey(name: 'created') String? created,
    @JsonKey(name: 'updated') int? updated,
    @JsonKey(name: 'user_init') int? userInit,
    @JsonKey(name: 'user_upd') int? userUpd,
    @JsonKey(name: 'user_ip') String? userIp,
    @JsonKey(name: 'sale_id') int? saleId,
    @JsonKey(name: 'canreturn') int? canReturn,
    @JsonKey(name: 'attach_file') String? attachFile,
    @JsonKey(name: 'mtc') String? mtc,
    @JsonKey(name: 'company_id') String? companyId,
    @JsonKey(name: 'status', fromJson: _statusNameFromJson)
    @Default("")
    String statusName,
    @JsonKey(name: 'company', fromJson: _customerNameFromJson)
    @Default("")
    String customerName,
    //  Status status,
    //  User user,
    //  Store stores,
    //  Company company,
  }) = _MOrderDetail;

  factory MOrderDetail.fromJson(Map<String, dynamic> json) =>
      _$MOrderDetailFromJson(json);
}

String _statusNameFromJson(Map<String, dynamic>? status) {
  return status?['name'] ?? 'Unknown';
}

String _customerNameFromJson(Map<String, dynamic>? status) {
  return status?['name'] ?? 'Unknown';
}
