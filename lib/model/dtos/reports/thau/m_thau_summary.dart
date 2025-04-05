import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_thau_summary.freezed.dart';
part 'm_thau_summary.g.dart';

@freezed
class MThauSummary with _$MThauSummary {
  const factory MThauSummary({
    @JsonKey(name: 'slmoithau', defaultValue: 0) double? slMoiThau,
    @JsonKey(name: 'giatrimoithau', defaultValue: 0.0) double? giaTriMoiThau,
    @JsonKey(name: 'tlsltrungthau', defaultValue: 0.0) double? tlSlTrungThau,
    @JsonKey(name: 'tlgttrungthau', defaultValue: 0.0) double? tlGtTrungThau,
    @JsonKey(name: 'moithauttcungky', defaultValue: 0) double? moiThauTTCungKy,
    @JsonKey(name: 'moithauTTcunggiatri', defaultValue: 0)
    double? moiThauTTCungGiaTri,
    @JsonKey(name: 'sltrungthau', defaultValue: 0) double? slTrungThau,
    @JsonKey(name: 'giatritrungthau', defaultValue: 0.0)
    double? giaTriTrungThau,
    @JsonKey(name: 'trungthauttcungky', defaultValue: 0)
    double? trungThauTTCungKy,
    @JsonKey(name: 'trungthauttnamtruoc', defaultValue: 0.0)
    double? trungThauTTNamTruoc,
    @JsonKey(name: 'slthaucungky', defaultValue: 0.0) double? slThauCungKy,
    @JsonKey(name: 'giatrithaucuoiky', defaultValue: 0.0)
    double? giaTriThauCuoiKy,
    @JsonKey(name: 'gtthauttcungky', defaultValue: 0.0) double? gtThauTTCungKy,
    @JsonKey(name: 'gtthauttnamtruoc', defaultValue: 0.0)
    double? gtThauTTNamTruoc,
    @JsonKey(name: 'slthuchien', defaultValue: 0) double? slThucHien,
    @JsonKey(name: 'gtthuchien', defaultValue: 0.0) double? gtThucHien,
    @JsonKey(name: 'gtthuchienttcungky', defaultValue: 0.0)
    double? gtThucHienTTCungKy,
    @JsonKey(name: 'gtthuchienttnamtruoc', defaultValue: 0.0)
    double? gtThucHienTTNamTruoc,
    @JsonKey(name: 'sltonthau', defaultValue: 0.0) double? slTonThau,
    @JsonKey(name: 'gttonthaucuoiky', defaultValue: 0.0)
    double? gtTonThauCuoiKy,
    @JsonKey(name: 'gtttonthaucungky', defaultValue: 0.0)
    double? gtTonThauTTCungKy,
    @JsonKey(name: 'gttonthauttnamtruoc', defaultValue: 0.0)
    double? gtTonThauTTNamTruoc,
    @JsonKey(name: 'slbothau', defaultValue: 0.0) double? slBoThau,
    @JsonKey(name: 'gtbothau', defaultValue: 0.0) double? gtBoThau,
    @JsonKey(name: 'gttbothauttcungky', defaultValue: 0.0)
    double? gtTBoThauTTCungKy,
    @JsonKey(name: 'gttbothaunamtruoc', defaultValue: 0.0)
    double? gtTBoThauNamTruoc,
  }) = _MThauSummary;

  factory MThauSummary.fromJson(Map<String, dynamic> json) =>
      _$MThauSummaryFromJson(json);
}
