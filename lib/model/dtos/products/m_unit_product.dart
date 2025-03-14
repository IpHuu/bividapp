import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_unit_product.freezed.dart';
part 'm_unit_product.g.dart';

@freezed
class MUnitProduct with _$MUnitProduct {
  const factory MUnitProduct({
    int? ID,
    String? prd_unit_name,
  }) = _MUnitProduct;

  factory MUnitProduct.fromJson(Map<String, dynamic> json) =>
      _$MUnitProductFromJson(json);
}
