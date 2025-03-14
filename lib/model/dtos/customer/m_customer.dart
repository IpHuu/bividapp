import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_customer.freezed.dart';
part 'm_customer.g.dart';

@freezed
class MCustomer with _$MCustomer {
  factory MCustomer({
    @JsonKey(name: 'ID') int? id,
    @Default("") String? customer_name,
    @Default("") String? customer_code,
    @Default("") String? customer_phone,
    @Default("") String? customer_email,
    @Default("") String? customer_addr,
    @Default("") String? customer_ship_addr,
    @Default("") String? customer_image,
    @Default("") String? notes,
    @Default("") String? customer_birthday,
    @Default("") String? customer_gender,
    @Default("") String? created,
    @Default("") String? updated,
    int? user_init,
    int? user_upd,
    @Default("") String? user_admin,
    @Default("") String? user_list,
    int? store_id,
    int? customer_type,
    @Default("") String? list_products,
    @Default("") String? code,
    @Default("") String? ttpketoan,
    @Default("") String? ttpbanhang,
    @Default("") String? tttruongkhoa,
    @Default("") String? user_assigned,
    @Default("") String? company_id,
  }) = _MCustomer;

  factory MCustomer.fromJson(Map<String, dynamic> json) =>
      _$MCustomerFromJson(json);
}
