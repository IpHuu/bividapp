import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_company.freezed.dart';
part 'm_company.g.dart';

@freezed
class MCompany with _$MCompany {
  factory MCompany({
    @JsonKey(name: 'ma_cty') String? maCty,
    @JsonKey(name: 'ten_tcty') String? tenTcty,
    @JsonKey(name: 'ten_cty') String? tenCty,
    @JsonKey(name: 'dia_chi') String? diaChi,
    @JsonKey(name: 'giam_doc') String? giamDoc,
    @JsonKey(name: 'ktt') String? ktt,
    @JsonKey(name: 'thu_quy') String? thuQuy,
    @JsonKey(name: 'ma_thue') String? maThue,
    @JsonKey(name: 'tel') String? tel,
    @JsonKey(name: 'fax') String? fax,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'ten_nh') String? tenNh,
    @JsonKey(name: 'so_tk_nh') String? soTkNh,
    @JsonKey(name: 'tinh_tp_nh') String? tinhTpNh,
    @JsonKey(name: 'loai_qd') String? loaiQd,
    @JsonKey(name: 'ten_qd_cdkt15') String? tenQdCdkt15,
    @JsonKey(name: 'ten_qd_cdkt48') String? tenQdCdkt48,
    @JsonKey(name: 'logo') String? logo,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'ten_cty2') String? tenCty2,
    @JsonKey(name: 'ma_cty_tax') String? maCtyTax,
    @JsonKey(name: 'ten_nh1') String? tenNh1,
    @JsonKey(name: 'so_tk_nh1') String? soTkNh1,
    @JsonKey(name: 'tinh_tp_nh1') String? tinhTpNh1,
    @JsonKey(name: 'hotline') String? hotline,
    @JsonKey(name: 'so_dang_ky') String? soDangKy,
    @JsonKey(name: 'website') String? website,
    @JsonKey(name: 'ma_nh') String? maNh,
    @JsonKey(name: 'ma_nh1') String? maNh1,
    @JsonKey(name: 'ma_cdkt') String? maCdkt,
    @JsonKey(name: 'gdNhanSu') String? gdNhanSu,
    @JsonKey(name: 'tongGD') String? tongGD,
    @JsonKey(name: 'giayUyQuyen') String? giayUyQuyen,
    @JsonKey(name: 'daiDienMoi') String? daiDienMoi,
  }) = _MCompany;

  factory MCompany.fromJson(Map<String, dynamic> json) =>
      _$MCompanyFromJson(json);
}
