// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_ton_thau.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MTonThauImpl _$$MTonThauImplFromJson(Map<String, dynamic> json) =>
    _$MTonThauImpl(
      tenNv: json['ten_nv'] as String? ?? '',
      maNv: json['ma_nv'] as String? ?? '',
      tenKh: json['ten_kh'] as String? ?? '',
      maVt: json['ma_vt'] as String? ?? '',
      tenVt: json['ten_vt'] as String? ?? '',
      tenNhvt: json['ten_nhvt'] as String? ?? '',
      slThau: (json['SLThau'] as num?)?.toDouble() ?? 0.0,
      tienThau: (json['TienThau'] as num?)?.toDouble() ?? 0.0,
      slTonThau: (json['SLTonThau'] as num?)?.toDouble() ?? 0.0,
      tienTonThau: (json['TienTonThau'] as num?)?.toDouble() ?? 0.0,
      tenNhkh: json['ten_nhkh'] as String? ?? '',
      tenChinhanh: json['ten_chinhanh'] as String? ?? '',
      ngayThHd: json['ngay_th_hd'] as String? ?? '',
      ngayKtHd: json['ngay_kt_hd'] as String? ?? '',
      thangConLai: (json['thang_conlai'] as num?)?.toInt() ?? 0,
      ngayTrungThau: json['ngay_trung_thau'] as String? ?? '',
    );

Map<String, dynamic> _$$MTonThauImplToJson(_$MTonThauImpl instance) =>
    <String, dynamic>{
      'ten_nv': instance.tenNv,
      'ma_nv': instance.maNv,
      'ten_kh': instance.tenKh,
      'ma_vt': instance.maVt,
      'ten_vt': instance.tenVt,
      'ten_nhvt': instance.tenNhvt,
      'SLThau': instance.slThau,
      'TienThau': instance.tienThau,
      'SLTonThau': instance.slTonThau,
      'TienTonThau': instance.tienTonThau,
      'ten_nhkh': instance.tenNhkh,
      'ten_chinhanh': instance.tenChinhanh,
      'ngay_th_hd': instance.ngayThHd,
      'ngay_kt_hd': instance.ngayKtHd,
      'thang_conlai': instance.thangConLai,
      'ngay_trung_thau': instance.ngayTrungThau,
    };
