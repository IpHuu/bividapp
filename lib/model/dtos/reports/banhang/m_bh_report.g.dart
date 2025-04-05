// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_bh_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MBHReportImpl _$$MBHReportImplFromJson(Map<String, dynamic> json) =>
    _$MBHReportImpl(
      tenNV: json['ten_nv5'] as String?,
      tenNhomKhachHang: json['ten_nhkh'] as String?,
      kenh: json['kenh'] as String?,
      tenChiNhanh: json['ten_chinhanh'] as String?,
      loai: json['loai'] as String?,
      kyPhanTich: json['ky_phantich'] as String?,
      slKeHoach: (json['slkehoach'] as num?)?.toDouble() ?? 0.0,
      tienKeHoach: (json['tienkehoach'] as num?)?.toDouble() ?? 0.0,
      slNamNay: (json['slnamnay'] as num?)?.toDouble() ?? 0.0,
      tlDat: (json['tldat'] as num?)?.toDouble() ?? 0.0,
      slTangTien: (json['sltangtien'] as num?)?.toDouble() ?? 0.0,
      tienTangKiemNghiem:
          (json['tientangkiemnghiem'] as num?)?.toDouble() ?? 0.0,
      slCungKy: (json['slcungky'] as num?)?.toDouble() ?? 0.0,
      dsCungKy: (json['dscungky'] as num?)?.toDouble() ?? 0.0,
      ttCungKy: (json['ttcungky'] as num?)?.toDouble() ?? 0.0,
      slNamTruoc: (json['slnnamtruoc'] as num?)?.toDouble() ?? 0.0,
      tangTruong: (json['tangtruong'] as num?)?.toDouble() ?? 0.0,
      keHoachNamNay: (json['kehoachnamnay'] as num?)?.toDouble() ?? 0.0,
      dsNamNay: (json['dsnamnay'] as num?)?.toDouble() ?? 0.0,
      dsNamTruoc: (json['DSnamtruoc'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$MBHReportImplToJson(_$MBHReportImpl instance) =>
    <String, dynamic>{
      'ten_nv5': instance.tenNV,
      'ten_nhkh': instance.tenNhomKhachHang,
      'kenh': instance.kenh,
      'ten_chinhanh': instance.tenChiNhanh,
      'loai': instance.loai,
      'ky_phantich': instance.kyPhanTich,
      'slkehoach': instance.slKeHoach,
      'tienkehoach': instance.tienKeHoach,
      'slnamnay': instance.slNamNay,
      'tldat': instance.tlDat,
      'sltangtien': instance.slTangTien,
      'tientangkiemnghiem': instance.tienTangKiemNghiem,
      'slcungky': instance.slCungKy,
      'dscungky': instance.dsCungKy,
      'ttcungky': instance.ttCungKy,
      'slnnamtruoc': instance.slNamTruoc,
      'tangtruong': instance.tangTruong,
      'kehoachnamnay': instance.keHoachNamNay,
      'dsnamnay': instance.dsNamNay,
      'DSnamtruoc': instance.dsNamTruoc,
    };
