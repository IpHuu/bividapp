import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_inventory_chart.freezed.dart';
part 'm_inventory_chart.g.dart';

@freezed
class MInventoryChart with _$MInventoryChart {
  factory MInventoryChart({
    @Default('') String thang,
    @JsonKey(fromJson: _toDouble, toJson: _toString) double? tien,
    @JsonKey(fromJson: _toDouble, toJson: _toString) double? tien_nhap,
    @JsonKey(fromJson: _toDouble, toJson: _toString) double? tien_xuat,
    @JsonKey(fromJson: _toDouble, toJson: _toString) double? so_luong,
    @JsonKey(fromJson: _toDouble, toJson: _toString) double? sl_nhap,
    @JsonKey(fromJson: _toDouble, toJson: _toString) double? sl_xuat,
  }) = _MInventoryChart;

  factory MInventoryChart.fromJson(Map<String, dynamic> json) =>
      _$MInventoryChartFromJson(json);
}

// Hàm chuyển đổi từ String -> double
double _toDouble(dynamic value) {
  if (value == null) return 0.0;
  return double.tryParse(value.toString()) ?? 0.0;
}

// Hàm chuyển đổi từ double -> String khi xuất JSON
String _toString(double? value) => value?.toString() ?? '0.0';
