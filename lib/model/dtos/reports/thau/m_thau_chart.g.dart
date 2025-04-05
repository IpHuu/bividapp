// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_thau_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MThauChartImpl _$$MThauChartImplFromJson(Map<String, dynamic> json) =>
    _$MThauChartImpl(
      thang: json['Thang'] as String? ?? '',
      moiThau: (json['moithau'] as num?)?.toDouble() ?? 0,
      trungThau: (json['trungthau'] as num?)?.toDouble() ?? 0,
      giaTriThau: (json['giatrithau'] as num?)?.toDouble() ?? 0,
      giaTriThucHien: (json['giatrithuchien'] as num?)?.toDouble() ?? 0,
      giaTriTonThau: (json['giatritonthau'] as num?)?.toDouble() ?? 0,
      tienBoThau: (json['tienbothau'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$MThauChartImplToJson(_$MThauChartImpl instance) =>
    <String, dynamic>{
      'Thang': instance.thang,
      'moithau': instance.moiThau,
      'trungthau': instance.trungThau,
      'giatrithau': instance.giaTriThau,
      'giatrithuchien': instance.giaTriThucHien,
      'giatritonthau': instance.giaTriTonThau,
      'tienbothau': instance.tienBoThau,
    };
