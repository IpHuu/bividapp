// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_inventory_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MInventoryChartImpl _$$MInventoryChartImplFromJson(
        Map<String, dynamic> json) =>
    _$MInventoryChartImpl(
      thang: json['thang'] as String? ?? '',
      tien: _toDouble(json['tien']),
      tien_nhap: _toDouble(json['tien_nhap']),
      tien_xuat: _toDouble(json['tien_xuat']),
      so_luong: _toDouble(json['so_luong']),
      sl_nhap: _toDouble(json['sl_nhap']),
      sl_xuat: _toDouble(json['sl_xuat']),
    );

Map<String, dynamic> _$$MInventoryChartImplToJson(
        _$MInventoryChartImpl instance) =>
    <String, dynamic>{
      'thang': instance.thang,
      'tien': _toString(instance.tien),
      'tien_nhap': _toString(instance.tien_nhap),
      'tien_xuat': _toString(instance.tien_xuat),
      'so_luong': _toString(instance.so_luong),
      'sl_nhap': _toString(instance.sl_nhap),
      'sl_xuat': _toString(instance.sl_xuat),
    };
