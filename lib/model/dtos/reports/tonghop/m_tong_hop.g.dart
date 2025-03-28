// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_tong_hop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MTongHopImpl _$$MTongHopImplFromJson(Map<String, dynamic> json) =>
    _$MTongHopImpl(
      loaiTongquan: json['loai_tongquan'] as String? ?? "",
      tienHumana: _defaultDouble(json['tien_Humana']),
      tienBivid: _defaultDouble(json['tien_Bivid']),
      tienBj: _defaultDouble(json['tien_BJ']),
      tienAristo: _defaultDouble(json['tien_ARISTO']),
      tienBaolong: _defaultDouble(json['tien_BAOLONG']),
      tienTongCong: _defaultDouble(json['tien_tong_cong']),
      tienTongCongNam: _defaultDouble(json['tien_tong_cong_nam']),
    );

Map<String, dynamic> _$$MTongHopImplToJson(_$MTongHopImpl instance) =>
    <String, dynamic>{
      'loai_tongquan': instance.loaiTongquan,
      'tien_Humana': instance.tienHumana,
      'tien_Bivid': instance.tienBivid,
      'tien_BJ': instance.tienBj,
      'tien_ARISTO': instance.tienAristo,
      'tien_BAOLONG': instance.tienBaolong,
      'tien_tong_cong': instance.tienTongCong,
      'tien_tong_cong_nam': instance.tienTongCongNam,
    };
