import 'dart:convert';

import 'package:collection/collection.dart';

class BangChamCong {
  String? maCty;
  String? nam;
  String? thang;
  String? ngay;
  String? maNhanvien;
  String? ngayTinh;
  String? vaoChamcong;
  String? raChamcong;
  dynamic vaoChamtay;
  dynamic raChamtay;
  double? soNgayCongthucte;

  BangChamCong({
    this.maCty,
    this.nam,
    this.thang,
    this.ngay,
    this.maNhanvien,
    this.ngayTinh,
    this.vaoChamcong,
    this.raChamcong,
    this.vaoChamtay,
    this.raChamtay,
    this.soNgayCongthucte,
  });

  @override
  String toString() {
    return 'BangChamCong(maCty: $maCty, nam: $nam, thang: $thang, ngay: $ngay, maNhanvien: $maNhanvien, ngayTinh: $ngayTinh, vaoChamcong: $vaoChamcong, raChamcong: $raChamcong, vaoChamtay: $vaoChamtay, raChamtay: $raChamtay, soNgayCongthucte: $soNgayCongthucte)';
  }

  factory BangChamCong.fromMap(Map<String, dynamic> data) => BangChamCong(
        maCty: data['ma_cty'] as String?,
        nam: data['nam'] as String?,
        thang: data['thang'] as String?,
        ngay: data['ngay'] as String?,
        maNhanvien: data['ma_nhanvien'] as String?,
        ngayTinh: data['ngay_tinh'] as String?,
        vaoChamcong: data['vao_chamcong'] as String?,
        raChamcong: data['ra_chamcong'] as String?,
        vaoChamtay: data['vao_chamtay'] as dynamic,
        raChamtay: data['ra_chamtay'] as dynamic,
        soNgayCongthucte: data['so_ngay_congthucte'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'ma_cty': maCty,
        'nam': nam,
        'thang': thang,
        'ngay': ngay,
        'ma_nhanvien': maNhanvien,
        'ngay_tinh': ngayTinh,
        'vao_chamcong': vaoChamcong,
        'ra_chamcong': raChamcong,
        'vao_chamtay': vaoChamtay,
        'ra_chamtay': raChamtay,
        'so_ngay_congthucte': soNgayCongthucte,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BangChamCong].
  factory BangChamCong.fromJson(String data) {
    return BangChamCong.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BangChamCong] to a JSON string.
  String toJson() => json.encode(toMap());

  BangChamCong copyWith({
    String? maCty,
    String? nam,
    String? thang,
    String? ngay,
    String? maNhanvien,
    String? ngayTinh,
    String? vaoChamcong,
    String? raChamcong,
    dynamic vaoChamtay,
    dynamic raChamtay,
    double? soNgayCongthucte,
  }) {
    return BangChamCong(
      maCty: maCty ?? this.maCty,
      nam: nam ?? this.nam,
      thang: thang ?? this.thang,
      ngay: ngay ?? this.ngay,
      maNhanvien: maNhanvien ?? this.maNhanvien,
      ngayTinh: ngayTinh ?? this.ngayTinh,
      vaoChamcong: vaoChamcong ?? this.vaoChamcong,
      raChamcong: raChamcong ?? this.raChamcong,
      vaoChamtay: vaoChamtay ?? this.vaoChamtay,
      raChamtay: raChamtay ?? this.raChamtay,
      soNgayCongthucte: soNgayCongthucte ?? this.soNgayCongthucte,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BangChamCong) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      maCty.hashCode ^
      nam.hashCode ^
      thang.hashCode ^
      ngay.hashCode ^
      maNhanvien.hashCode ^
      ngayTinh.hashCode ^
      vaoChamcong.hashCode ^
      raChamcong.hashCode ^
      vaoChamtay.hashCode ^
      raChamtay.hashCode ^
      soNgayCongthucte.hashCode;
}
