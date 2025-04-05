import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_thau_chart.freezed.dart';
part 'm_thau_chart.g.dart';

@freezed
class MThauChart with _$MThauChart {
  factory MThauChart({
    @JsonKey(name: 'Thang', defaultValue: "") String? thang,
    @JsonKey(name: 'moithau', defaultValue: 0) double? moiThau,
    @JsonKey(name: 'trungthau', defaultValue: 0) double? trungThau,
    @JsonKey(name: 'giatrithau', defaultValue: 0) double? giaTriThau,
    @JsonKey(name: 'giatrithuchien', defaultValue: 0) double? giaTriThucHien,
    @JsonKey(name: 'giatritonthau', defaultValue: 0) double? giaTriTonThau,
    @JsonKey(name: 'tienbothau', defaultValue: 0) double? tienBoThau,
  }) = _MThauChart;

  factory MThauChart.fromJson(Map<String, dynamic> json) =>
      _$MThauChartFromJson(json);
}
