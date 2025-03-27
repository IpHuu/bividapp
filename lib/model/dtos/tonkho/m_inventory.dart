import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_inventory.freezed.dart';
part 'm_inventory.g.dart';

@freezed
class MInventory with _$MInventory {
  factory MInventory({
    @Default('') String ma_cty,
    @Default('') String thang,
    @Default('') String nam,
    @Default('') String ma_vt,
    @Default('') String ten_vt,
    @Default('') String so_luong,
    @Default('') String tien,
    @Default('') String so_luong_bv,
    @Default('') String tien_bv,
    @Default('') String so_luong_ut,
    @Default('') String tien_ut,
    @Default('') String ma_lo,
    @Default('') String ten_lo,
    @Default('') String han_dung,
    @Default('') String ma_nhvt,
    @Default('') String ten_nhvt,
    @Default('') String ma_plvt1,
    @Default('') String ten_plvt1,
    @Default('') String ma_plvt2,
    @Default('') String ten_plvt2,
    @Default('') String ma_plvt3,
    @Default('') String ma_nhkho,
    @Default('') String ten_nhkho,
    @Default('') String ten_chinhanh,
    @Default('') String so_ngay_hethan,
    @Default('') String ten_kho,
    @Default('') String Loai,
    @Default('') String TT,
    @Default('') String ma_nhlo,
    @Default('') String sort,
    @Default('') String don_gia,
  }) = _MInventory;

  factory MInventory.fromJson(Map<String, dynamic> json) =>
      _$MInventoryFromJson(json);
}
