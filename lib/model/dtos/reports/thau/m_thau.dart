import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_thau.freezed.dart';
part 'm_thau.g.dart';

@freezed
class MThau with _$MThau {
  factory MThau({
    @JsonKey(name: 'Thang', defaultValue: "") String? thang,
    @JsonKey(name: 'ten_nv', defaultValue: "") String? tenNv,
    @JsonKey(name: 'ma_nv', defaultValue: "") String? maNv,
    @JsonKey(name: 'ten_kh', defaultValue: "") String? tenKh,
    @JsonKey(name: 'ma_vt', defaultValue: "") String? maVt,
    @JsonKey(name: 'ten_vt', defaultValue: "") String? tenVt,
    @JsonKey(name: 'ten_nhvt', defaultValue: "") String? tenNhvt,
    @JsonKey(name: 'SLThau', defaultValue: 0.0) double? slThau,
    @JsonKey(name: 'TienThau', defaultValue: 0.0) double? tienThau,
    @JsonKey(name: 'SLThau1', defaultValue: 0.0) double? slThau1,
    @JsonKey(name: 'TienThau1', defaultValue: 0.0) double? tienThau1,
    @JsonKey(name: 'SLThauCungKy', defaultValue: 0.0) double? slThauCungKy,
    @JsonKey(name: 'TienThauCungKy', defaultValue: 0.0) double? tienThauCungKy,
    @JsonKey(name: 'SLThucHien', defaultValue: 0.0) double? slThucHien,
    @JsonKey(name: 'TienThucHien', defaultValue: 0.0) double? tienThucHien,
    @JsonKey(name: 'SLThucHienCungKy', defaultValue: 0.0)
    double? slThucHienCungKy,
    @JsonKey(name: 'TienThucHienCungKy', defaultValue: 0.0)
    double? tienThucHienCungKy,
    @JsonKey(name: 'SLTonThau', defaultValue: 0.0) double? slTonThau,
    @JsonKey(name: 'TienTonThau', defaultValue: 0.0) double? tienTonThau,
    @JsonKey(name: 'SLTonThau1', defaultValue: 0.0) double? slTonThau1,
    @JsonKey(name: 'TienTonThau1', defaultValue: 0.0) double? tienTonThau1,
    @JsonKey(name: 'SLBoThau', defaultValue: 0.0) double? slBoThau,
    @JsonKey(name: 'TienBoThau', defaultValue: 0.0) double? tienBoThau,
    @JsonKey(name: 'SumSLThucHien', defaultValue: 0.0) double? sumSlThucHien,
    @JsonKey(name: 'SumTienThucHien', defaultValue: 0.0)
    double? sumTienThucHien,
    @JsonKey(name: 'SLThucHien_tr', defaultValue: 0.0) double? slThucHienTr,
    @JsonKey(name: 'TienThucHien_tr', defaultValue: 0.0) double? tienThucHienTr,
    @JsonKey(name: 'SLThau_tr', defaultValue: 0.0) double? slThauTr,
    @JsonKey(name: 'TienThau_tr', defaultValue: 0.0) double? tienThauTr,
    @JsonKey(name: 'SLTonThau_tr', defaultValue: 0.0) double? slTonThauTr,
    @JsonKey(name: 'TienTonThau_tr', defaultValue: 0.0) double? tienTonThauTr,
    @JsonKey(name: 'sl_trungthau', defaultValue: 0.0) double? slTrungThau,
    @JsonKey(name: 'tien_trungthau', defaultValue: 0.0) double? tienTrungThau,
    @JsonKey(name: 'sl_caithau', defaultValue: 0.0) double? slCaiThau,
    @JsonKey(name: 'tien_caithau', defaultValue: 0.0) double? tienCaiThau,
    @JsonKey(name: 'ten_nhkh', defaultValue: "") String? tenNhkh,
    @JsonKey(name: 'ten_chinhanh', defaultValue: "") String? tenChinhanh,
  }) = _MThau;

  factory MThau.fromJson(Map<String, dynamic> json) => _$MThauFromJson(json);
}
