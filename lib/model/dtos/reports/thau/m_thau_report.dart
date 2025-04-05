import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_thau_report.freezed.dart';
part 'm_thau_report.g.dart';

@freezed
class MThauReport with _$MThauReport {
  factory MThauReport({
    @JsonKey(name: 'ten_chinhanh', defaultValue: "") String? tenChiNhanh,
    @JsonKey(name: 'ten_nhkh', defaultValue: "") String? tenNhKhachHang,
    @JsonKey(name: 'ten_nhvt', defaultValue: "") String? tenNhVatTu,
    @JsonKey(name: 'ten_nv', defaultValue: "") String? tenNhanVien,
    @JsonKey(name: 'ten_kh', defaultValue: "") String? tenKhachHang,
    @JsonKey(name: 'ten_vt', defaultValue: "") String? tenSanPham,
    @JsonKey(name: 'giatrimoithau', defaultValue: 0.0) double? giaTriMoiThau,
    @JsonKey(name: 'tlsltrungthau', defaultValue: 0.0) double? tlslTrungThau,
    @JsonKey(name: 'tlgiatritrungthau', defaultValue: 0.0)
    double? tlGiaTriTrungThau,
    @JsonKey(name: 'giatritrungthau', defaultValue: 0.0)
    double? giaTriTrungThau,
    @JsonKey(name: 'giatrithau', defaultValue: 0.0) double? giaTriThau,
    @JsonKey(name: 'giatrithuchien', defaultValue: 0.0) double? giaTriThucHien,
    @JsonKey(name: 'giatritonthau', defaultValue: 0.0) double? giaTriTonThau,
    @JsonKey(name: 'giatritonthau1', defaultValue: 0.0) double? giaTriTonThau1,
    @JsonKey(name: 'ma_nv', defaultValue: '') String? maNv,
    @JsonKey(name: 'ma_vt', defaultValue: '') String? maVt,
    @JsonKey(name: 'SLThau', defaultValue: 0.0) double? slThau,
    @JsonKey(name: 'TienThau', defaultValue: 0.0) double? tienThau,
    @JsonKey(name: 'SLTonThau', defaultValue: 0.0) double? slTonThau,
    @JsonKey(name: 'TienTonThau', defaultValue: 0.0) double? tienTonThau,
    @JsonKey(name: 'ngay_th_hd', defaultValue: '') String? ngayThHd,
    @JsonKey(name: 'ngay_kt_hd', defaultValue: '') String? ngayKtHd,
    @JsonKey(name: 'thang_conlai', defaultValue: 0) int? thangConLai,
    @JsonKey(name: 'ngay_trung_thau', defaultValue: '') String? ngayTrungThau,
  }) = _MThauReport;

  factory MThauReport.fromJson(Map<String, dynamic> json) =>
      _$MThauReportFromJson(json);
}
