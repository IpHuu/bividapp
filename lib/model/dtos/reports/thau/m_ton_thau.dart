import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_ton_thau.freezed.dart';
part 'm_ton_thau.g.dart';

@freezed
class MTonThau with _$MTonThau {
  factory MTonThau({
    @JsonKey(name: 'ten_nv', defaultValue: '') String? tenNv,
    @JsonKey(name: 'ma_nv', defaultValue: '') String? maNv,
    @JsonKey(name: 'ten_kh', defaultValue: '') String? tenKh,
    @JsonKey(name: 'ma_vt', defaultValue: '') String? maVt,
    @JsonKey(name: 'ten_vt', defaultValue: '') String? tenVt,
    @JsonKey(name: 'ten_nhvt', defaultValue: '') String? tenNhvt,
    @JsonKey(name: 'SLThau', defaultValue: 0.0) double? slThau,
    @JsonKey(name: 'TienThau', defaultValue: 0.0) double? tienThau,
    @JsonKey(name: 'SLTonThau', defaultValue: 0.0) double? slTonThau,
    @JsonKey(name: 'TienTonThau', defaultValue: 0.0) double? tienTonThau,
    @JsonKey(name: 'ten_nhkh', defaultValue: '') String? tenNhkh,
    @JsonKey(name: 'ten_chinhanh', defaultValue: '') String? tenChinhanh,
    @JsonKey(name: 'ngay_th_hd', defaultValue: '') String? ngayThHd,
    @JsonKey(name: 'ngay_kt_hd', defaultValue: '') String? ngayKtHd,
    @JsonKey(name: 'thang_conlai', defaultValue: 0) int? thangConLai,
    @JsonKey(name: 'ngay_trung_thau', defaultValue: '') String? ngayTrungThau,
  }) = _MTonThau;

  factory MTonThau.fromJson(Map<String, dynamic> json) =>
      _$MTonThauFromJson(json);
}
