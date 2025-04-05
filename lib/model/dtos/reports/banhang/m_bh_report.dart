import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_bh_report.freezed.dart';
part 'm_bh_report.g.dart';

@freezed
class MBHReport with _$MBHReport {
  factory MBHReport({
    @JsonKey(name: 'ten_nv5') String? tenNV,
    @JsonKey(name: 'ten_nhkh') String? tenNhomKhachHang,
    @JsonKey(name: 'kenh') String? kenh,
    @JsonKey(name: 'ten_chinhanh') String? tenChiNhanh,
    @JsonKey(name: 'loai') String? loai,
    @JsonKey(name: 'ky_phantich') String? kyPhanTich,
    @JsonKey(name: 'slkehoach', defaultValue: 0.0) double? slKeHoach,
    @JsonKey(name: 'tienkehoach', defaultValue: 0.0) double? tienKeHoach,
    @JsonKey(name: 'slnamnay', defaultValue: 0.0) double? slNamNay,
    @JsonKey(name: 'tldat', defaultValue: 0.0) double? tlDat,
    @JsonKey(name: 'sltangtien', defaultValue: 0.0) double? slTangTien,
    @JsonKey(name: 'tientangkiemnghiem', defaultValue: 0.0)
    double? tienTangKiemNghiem,
    @JsonKey(name: 'slcungky', defaultValue: 0.0) double? slCungKy,
    @JsonKey(name: 'dscungky', defaultValue: 0.0) double? dsCungKy,
    @JsonKey(name: 'ttcungky', defaultValue: 0.0) double? ttCungKy,
    @JsonKey(name: 'slnnamtruoc', defaultValue: 0.0) double? slNamTruoc,
    @JsonKey(name: 'tangtruong', defaultValue: 0.0) double? tangTruong,
    @JsonKey(name: 'kehoachnamnay', defaultValue: 0.0) double? keHoachNamNay,
    @JsonKey(name: 'dsnamnay', defaultValue: 0.0) double? dsNamNay,
    @JsonKey(name: 'DSnamtruoc', defaultValue: 0.0) double? dsNamTruoc,
  }) = _MBHReport;

  factory MBHReport.fromJson(Map<String, dynamic> json) =>
      _$MBHReportFromJson(json);
}
