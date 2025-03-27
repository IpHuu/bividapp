import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_vattu.freezed.dart';
part 'm_vattu.g.dart';

@freezed
class MVatTu with _$MVatTu {
  factory MVatTu({
    @JsonKey(name: 'ma_cty') String? maCty,
    @JsonKey(name: 'ma_vt') String? maVt,
    @JsonKey(name: 'ten_vt') String? tenVt,
    @JsonKey(name: 'ten_vt1') String? tenVt1,
    @JsonKey(name: 'dvt') String? dvt,
    @JsonKey(name: 'loai') String? loai,
    @JsonKey(name: 'iston_kho') bool? isTonKho,
    @JsonKey(name: 'iston_vitri') bool? isTonViTri,
    @JsonKey(name: 'iston_lo') bool? isTonLo,
    @JsonKey(name: 'gia_ton') String? giaTon,
    @JsonKey(name: 'ton_min') int? tonMin,
    @JsonKey(name: 'ton_max') int? tonMax,
    @JsonKey(name: 'ma_nhvt') String? maNhvt,
    @JsonKey(name: 'ma_plvt1') String? maPlvt1,
    @JsonKey(name: 'ma_plvt2') String? maPlvt2,
    @JsonKey(name: 'ma_plvt3') String? maPlvt3,
    @JsonKey(name: 'ma_kho') String? maKho,
    @JsonKey(name: 'ma_vitri') String? maViTri,
    @JsonKey(name: 'ma_tsgtgt') String? maTsgtgt,
    @JsonKey(name: 'ma_tsnk') String? maTsnk,
    @JsonKey(name: 'ts_xk') int? tsXk,
    @JsonKey(name: 'ma_tsttdb') String? maTsttdb,
    @JsonKey(name: 'tk_vt') String? tkVt,
    @JsonKey(name: 'tk_dt') String? tkDt,
    @JsonKey(name: 'tk_dtnb') String? tkDtnb,
    @JsonKey(name: 'tk_gv') String? tkGv,
    @JsonKey(name: 'tk_tl') String? tkTl,
    @JsonKey(name: 'tk_ck') String? tkCk,
    @JsonKey(name: 'tk_dd') String? tkDd,
    @JsonKey(name: 'gia_mua') int? giaMua,
    @JsonKey(name: 'gia_ban') int? giaBan,
    @JsonKey(name: 'han_dung') int? hanDung,
    @JsonKey(name: 'ma_nsx') String? maNsx,
    @JsonKey(name: 'nguon_goc') String? nguonGoc,
    @JsonKey(name: 'hinh_anh') String? hinhAnh,
    @JsonKey(name: 'mo_ta') String? moTa,
    @JsonKey(name: 'tg_bh') String? tgBh,
    @JsonKey(name: 'isksd') bool? isKsd,
    @JsonKey(name: 'cdate') String? cDate,
    @JsonKey(name: 'cuser') String? cUser,
    @JsonKey(name: 'ldate') String? lDate,
    @JsonKey(name: 'luser') String? lUser,
    @JsonKey(name: 'ten_vt2') String? tenVt2,
    @JsonKey(name: 'ma_plvt4') String? maPlvt4,
    @JsonKey(name: 'mo_ta1') String? moTa1,
    @JsonKey(name: 'mo_ta2') String? moTa2,
    @JsonKey(name: 'ma_trangthai') String? maTrangThai,
    @JsonKey(name: 'ngay_hieuluc') String? ngayHieuLuc,
    @JsonKey(name: 'ngay_hethan') String? ngayHetHan,
    @JsonKey(name: 'tk_km') String? tkKm,
    @JsonKey(name: 'ishoanthanh') bool? isHoanThanh,
    @JsonKey(name: 'nguoi_hoanthanh') String? nguoiHoanThanh,
    @JsonKey(name: 'ngay_hoanthanh') String? ngayHoanThanh,
    @JsonKey(name: 'barcode') String? barcode,
  }) = _MVatTu;

  factory MVatTu.fromJson(Map<String, dynamic> json) => _$MVatTuFromJson(json);
}
