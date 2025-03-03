import 'dart:convert';

import 'package:collection/collection.dart';

class ShortKhcv {
  int? idKeHoachCongViec;
  String? maCongTy;
  String? loaiKeHoach;
  String? veViec;
  String? maNguoiDeNghi;
  String? mucTieu;
  String? noiDungKeHoach;
  String? soPhieuAuto;
  String? tenCty2;
  String? nguoiTao;
  String? userDeNghi;

  ShortKhcv({
    this.idKeHoachCongViec,
    this.maCongTy,
    this.loaiKeHoach,
    this.veViec,
    this.maNguoiDeNghi,
    this.mucTieu,
    this.noiDungKeHoach,
    this.soPhieuAuto,
    this.tenCty2,
    this.nguoiTao,
    this.userDeNghi,
  });

  @override
  String toString() {
    return 'ShortKhcv(idKeHoachCongViec: $idKeHoachCongViec, maCongTy: $maCongTy, loaiKeHoach: $loaiKeHoach, veViec: $veViec, maNguoiDeNghi: $maNguoiDeNghi, mucTieu: $mucTieu, noiDungKeHoach: $noiDungKeHoach, soPhieuAuto: $soPhieuAuto, tenCty2: $tenCty2, nguoiTao: $nguoiTao, userDeNghi: $userDeNghi)';
  }

  factory ShortKhcv.fromMap(Map<String, dynamic> data) => ShortKhcv(
        idKeHoachCongViec: data['idKeHoachCongViec'] as int?,
        maCongTy: data['maCongTy'] as String?,
        loaiKeHoach: data['loaiKeHoach'] as String?,
        veViec: data['veViec'] as String?,
        maNguoiDeNghi: data['maNguoiDeNghi'] as String?,
        mucTieu: data['mucTieu'] as String?,
        noiDungKeHoach: data['noiDungKeHoach'] as String?,
        soPhieuAuto: data['soPhieuAuto'] as String?,
        tenCty2: data['ten_cty2'] as String?,
        nguoiTao: data['nguoiTao'] as String?,
        userDeNghi: data['userDeNghi'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'idKeHoachCongViec': idKeHoachCongViec,
        'maCongTy': maCongTy,
        'loaiKeHoach': loaiKeHoach,
        'veViec': veViec,
        'maNguoiDeNghi': maNguoiDeNghi,
        'mucTieu': mucTieu,
        'noiDungKeHoach': noiDungKeHoach,
        'soPhieuAuto': soPhieuAuto,
        'ten_cty2': tenCty2,
        'nguoiTao': nguoiTao,
        'userDeNghi': userDeNghi,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShortKhcv].
  factory ShortKhcv.fromJson(String data) {
    return ShortKhcv.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShortKhcv] to a JSON string.
  String toJson() => json.encode(toMap());

  ShortKhcv copyWith({
    int? idKeHoachCongViec,
    String? maCongTy,
    String? loaiKeHoach,
    String? veViec,
    String? maNguoiDeNghi,
    String? mucTieu,
    String? noiDungKeHoach,
    String? soPhieuAuto,
    String? tenCty2,
    String? nguoiTao,
    String? userDeNghi,
  }) {
    return ShortKhcv(
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiKeHoach: loaiKeHoach ?? this.loaiKeHoach,
      veViec: veViec ?? this.veViec,
      maNguoiDeNghi: maNguoiDeNghi ?? this.maNguoiDeNghi,
      mucTieu: mucTieu ?? this.mucTieu,
      noiDungKeHoach: noiDungKeHoach ?? this.noiDungKeHoach,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      tenCty2: tenCty2 ?? this.tenCty2,
      nguoiTao: nguoiTao ?? this.nguoiTao,
      userDeNghi: userDeNghi ?? this.userDeNghi,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ShortKhcv) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idKeHoachCongViec.hashCode ^
      maCongTy.hashCode ^
      loaiKeHoach.hashCode ^
      veViec.hashCode ^
      maNguoiDeNghi.hashCode ^
      mucTieu.hashCode ^
      noiDungKeHoach.hashCode ^
      soPhieuAuto.hashCode ^
      tenCty2.hashCode ^
      nguoiTao.hashCode ^
      userDeNghi.hashCode;
}
