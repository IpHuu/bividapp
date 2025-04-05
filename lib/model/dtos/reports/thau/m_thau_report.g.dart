// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_thau_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MThauReportImpl _$$MThauReportImplFromJson(Map<String, dynamic> json) =>
    _$MThauReportImpl(
      tenChiNhanh: json['ten_chinhanh'] as String? ?? '',
      tenNhKhachHang: json['ten_nhkh'] as String? ?? '',
      tenNhVatTu: json['ten_nhvt'] as String? ?? '',
      tenNhanVien: json['ten_nv'] as String? ?? '',
      tenKhachHang: json['ten_kh'] as String? ?? '',
      tenSanPham: json['ten_vt'] as String? ?? '',
      giaTriMoiThau: (json['giatrimoithau'] as num?)?.toDouble() ?? 0.0,
      tlslTrungThau: (json['tlsltrungthau'] as num?)?.toDouble() ?? 0.0,
      tlGiaTriTrungThau: (json['tlgiatritrungthau'] as num?)?.toDouble() ?? 0.0,
      giaTriTrungThau: (json['giatritrungthau'] as num?)?.toDouble() ?? 0.0,
      giaTriThau: (json['giatrithau'] as num?)?.toDouble() ?? 0.0,
      giaTriThucHien: (json['giatrithuchien'] as num?)?.toDouble() ?? 0.0,
      giaTriTonThau: (json['giatritonthau'] as num?)?.toDouble() ?? 0.0,
      giaTriTonThau1: (json['giatritonthau1'] as num?)?.toDouble() ?? 0.0,
      maNv: json['ma_nv'] as String? ?? '',
      maVt: json['ma_vt'] as String? ?? '',
      slThau: (json['SLThau'] as num?)?.toDouble() ?? 0.0,
      tienThau: (json['TienThau'] as num?)?.toDouble() ?? 0.0,
      slTonThau: (json['SLTonThau'] as num?)?.toDouble() ?? 0.0,
      tienTonThau: (json['TienTonThau'] as num?)?.toDouble() ?? 0.0,
      ngayThHd: json['ngay_th_hd'] as String? ?? '',
      ngayKtHd: json['ngay_kt_hd'] as String? ?? '',
      thangConLai: (json['thang_conlai'] as num?)?.toInt() ?? 0,
      ngayTrungThau: json['ngay_trung_thau'] as String? ?? '',
    );

Map<String, dynamic> _$$MThauReportImplToJson(_$MThauReportImpl instance) =>
    <String, dynamic>{
      'ten_chinhanh': instance.tenChiNhanh,
      'ten_nhkh': instance.tenNhKhachHang,
      'ten_nhvt': instance.tenNhVatTu,
      'ten_nv': instance.tenNhanVien,
      'ten_kh': instance.tenKhachHang,
      'ten_vt': instance.tenSanPham,
      'giatrimoithau': instance.giaTriMoiThau,
      'tlsltrungthau': instance.tlslTrungThau,
      'tlgiatritrungthau': instance.tlGiaTriTrungThau,
      'giatritrungthau': instance.giaTriTrungThau,
      'giatrithau': instance.giaTriThau,
      'giatrithuchien': instance.giaTriThucHien,
      'giatritonthau': instance.giaTriTonThau,
      'giatritonthau1': instance.giaTriTonThau1,
      'ma_nv': instance.maNv,
      'ma_vt': instance.maVt,
      'SLThau': instance.slThau,
      'TienThau': instance.tienThau,
      'SLTonThau': instance.slTonThau,
      'TienTonThau': instance.tienTonThau,
      'ngay_th_hd': instance.ngayThHd,
      'ngay_kt_hd': instance.ngayKtHd,
      'thang_conlai': instance.thangConLai,
      'ngay_trung_thau': instance.ngayTrungThau,
    };
