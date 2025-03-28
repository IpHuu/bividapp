import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_tong_hop.freezed.dart';
part 'm_tong_hop.g.dart';

@freezed
class MTongHop with _$MTongHop {
  const factory MTongHop({
    @Default("") @JsonKey(name: 'loai_tongquan') String? loaiTongquan,
    @JsonKey(name: 'tien_Humana', fromJson: _defaultDouble) double? tienHumana,
    @JsonKey(name: 'tien_Bivid', fromJson: _defaultDouble) double? tienBivid,
    @JsonKey(name: 'tien_BJ', fromJson: _defaultDouble) double? tienBj,
    @JsonKey(name: 'tien_ARISTO', fromJson: _defaultDouble) double? tienAristo,
    @JsonKey(name: 'tien_BAOLONG', fromJson: _defaultDouble)
    double? tienBaolong,
    @JsonKey(name: 'tien_tong_cong', fromJson: _defaultDouble)
    double? tienTongCong,
    @JsonKey(name: 'tien_tong_cong_nam', fromJson: _defaultDouble)
    double? tienTongCongNam,
  }) = _MTongHop;

  factory MTongHop.fromJson(Map<String, dynamic> json) =>
      _$MTongHopFromJson(json);
}

double _defaultDouble(dynamic value) => (value as num?)?.toDouble() ?? 0.0;
