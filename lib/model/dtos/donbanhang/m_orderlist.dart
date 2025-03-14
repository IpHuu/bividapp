import 'package:bividpharma/model/dtos/donbanhang/m_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_orderlist.freezed.dart';
part 'm_orderlist.g.dart';

@freezed
class MOrderList with _$MOrderList {
  factory MOrderList({
    @Default(0) int current_page,
    List<MOrder>? data,
    @Default(0) int total,
  }) = _MOrderList;

  factory MOrderList.fromJson(Map<String, dynamic> json) =>
      _$MOrderListFromJson(json);
}
