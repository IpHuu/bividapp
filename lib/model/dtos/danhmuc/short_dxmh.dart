import 'dart:convert';

import 'package:collection/collection.dart';

class ShortDxmh {
  int? idDeXuatMh;
  int? idKeHoachCongViec;
  String? maCongTy;
  String? loaiPhieu;
  DateTime? ngayDeXuat;
  String? nguoiDeXuat;
  String? lyDoDeXuat;
  String? soPhieuAuto;
  String? tenNhanvien;
  String? nguoiTao;
  String? userDeXuat;

  ShortDxmh({
    this.idDeXuatMh,
    this.idKeHoachCongViec,
    this.maCongTy,
    this.loaiPhieu,
    this.ngayDeXuat,
    this.nguoiDeXuat,
    this.lyDoDeXuat,
    this.soPhieuAuto,
    this.tenNhanvien,
    this.nguoiTao,
    this.userDeXuat,
  });

  @override
  String toString() {
    return 'ShortDxmh(idDeXuatMh: $idDeXuatMh, idKeHoachCongViec: $idKeHoachCongViec, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, ngayDeXuat: $ngayDeXuat, nguoiDeXuat: $nguoiDeXuat, lyDoDeXuat: $lyDoDeXuat, soPhieuAuto: $soPhieuAuto, tenNhanvien: $tenNhanvien, nguoiTao: $nguoiTao, userDeXuat: $userDeXuat)';
  }

  factory ShortDxmh.fromMap(Map<String, dynamic> data) => ShortDxmh(
        idDeXuatMh: data['idDeXuatMH'] as int?,
        idKeHoachCongViec: data['idKeHoachCongViec'] as int?,
        maCongTy: data['maCongTy'] as String?,
        loaiPhieu: data['loaiPhieu'] as String?,
        ngayDeXuat: data['ngayDeXuat'] == null
            ? null
            : DateTime.parse(data['ngayDeXuat'] as String),
        nguoiDeXuat: data['nguoiDeXuat'] as String?,
        lyDoDeXuat: data['lyDoDeXuat'] as String?,
        soPhieuAuto: data['soPhieuAuto'] as String?,
        tenNhanvien: data['ten_nhanvien'] as String?,
        nguoiTao: data['nguoiTao'] as String?,
        userDeXuat: data['userDeXuat'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'idDeXuatMH': idDeXuatMh,
        'idKeHoachCongViec': idKeHoachCongViec,
        'maCongTy': maCongTy,
        'loaiPhieu': loaiPhieu,
        'ngayDeXuat': ngayDeXuat?.toIso8601String(),
        'nguoiDeXuat': nguoiDeXuat,
        'lyDoDeXuat': lyDoDeXuat,
        'soPhieuAuto': soPhieuAuto,
        'ten_nhanvien': tenNhanvien,
        'nguoiTao': nguoiTao,
        'userDeXuat': userDeXuat,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShortDxmh].
  factory ShortDxmh.fromJson(String data) {
    return ShortDxmh.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShortDxmh] to a JSON string.
  String toJson() => json.encode(toMap());

  ShortDxmh copyWith({
    int? idDeXuatMh,
    int? idKeHoachCongViec,
    String? maCongTy,
    String? loaiPhieu,
    DateTime? ngayDeXuat,
    String? nguoiDeXuat,
    String? lyDoDeXuat,
    String? soPhieuAuto,
    String? tenNhanvien,
    String? nguoiTao,
    String? userDeXuat,
  }) {
    return ShortDxmh(
      idDeXuatMh: idDeXuatMh ?? this.idDeXuatMh,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiPhieu: loaiPhieu ?? this.loaiPhieu,
      ngayDeXuat: ngayDeXuat ?? this.ngayDeXuat,
      nguoiDeXuat: nguoiDeXuat ?? this.nguoiDeXuat,
      lyDoDeXuat: lyDoDeXuat ?? this.lyDoDeXuat,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      nguoiTao: nguoiTao ?? this.nguoiTao,
      userDeXuat: userDeXuat ?? this.userDeXuat,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ShortDxmh) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idDeXuatMh.hashCode ^
      idKeHoachCongViec.hashCode ^
      maCongTy.hashCode ^
      loaiPhieu.hashCode ^
      ngayDeXuat.hashCode ^
      nguoiDeXuat.hashCode ^
      lyDoDeXuat.hashCode ^
      soPhieuAuto.hashCode ^
      tenNhanvien.hashCode ^
      nguoiTao.hashCode ^
      userDeXuat.hashCode;
}
