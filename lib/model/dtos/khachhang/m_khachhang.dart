import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_khachhang.freezed.dart';
part 'm_khachhang.g.dart';

@freezed
class MKhachHang with _$MKhachHang {
  factory MKhachHang({
    @JsonKey(name: 'ma_cty') String? maCty,
    @JsonKey(name: 'ma_nhkh') String? maNhkh,
    @JsonKey(name: 'moduleid') String? moduleId,
    @JsonKey(name: 'ten_nhkh') String? tenNhkh,
    @JsonKey(name: 'ten_nhkh1') String? tenNhkh1,
    @JsonKey(name: 'isksd') bool? isKsd,
    @JsonKey(name: 'cdate') String? cDate,
    @JsonKey(name: 'cuser') String? cUser,
    @JsonKey(name: 'ldate') String? lDate,
    @JsonKey(name: 'luser') String? lUser,
  }) = _MKhachHang;

  factory MKhachHang.fromJson(Map<String, dynamic> json) =>
      _$MKhachHangFromJson(json);
}
