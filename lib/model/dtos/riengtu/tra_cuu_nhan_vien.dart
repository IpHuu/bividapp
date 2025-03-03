import 'dart:convert';

import 'package:collection/collection.dart';

class TraCuuNhanVien {
  String? maCty;
  String? tenCty;
  String? maNhanvien;
  String? tenNhanvien;
  String? tenGioitinh;
  String? tel;
  String? email;
  String? lienHe1;
  String? lienHe2;
  String? lienHe3;
  String? lienHe4;
  String? tenBophan;
  String? tenChucvu;
  String? chinhanhnhanvien;
  String? logo;
  String? logoUrl;

  TraCuuNhanVien(
      {this.maCty,
      this.tenCty,
      this.maNhanvien,
      this.tenNhanvien,
      this.tenGioitinh,
      this.tel,
      this.email,
      this.lienHe1,
      this.lienHe2,
      this.lienHe3,
      this.lienHe4,
      this.tenBophan,
      this.tenChucvu,
      this.chinhanhnhanvien,
      this.logo,
      this.logoUrl = ''});

  @override
  String toString() {
    return 'TraCuuNhanVien(maCty: $maCty, tenCty: $tenCty, maNhanvien: $maNhanvien, tenNhanvien: $tenNhanvien, tenGioitinh: $tenGioitinh, tel: $tel, email: $email, lienHe1: $lienHe1, lienHe2: $lienHe2, lienHe3: $lienHe3, lienHe4: $lienHe4, tenBophan: $tenBophan, tenChucvu: $tenChucvu, chinhanhnhanvien: $chinhanhnhanvien)';
  }

  factory TraCuuNhanVien.fromMap(Map<String, dynamic> data) {
    return TraCuuNhanVien(
        maCty: data['ma_cty'] as String?,
        tenCty: data['ten_cty'] as String?,
        maNhanvien: data['ma_nhanvien'] as String?,
        tenNhanvien: data['ten_nhanvien'] as String?,
        tenGioitinh: data['ten_gioitinh'] as String?,
        tel: data['tel'] as String?,
        email: data['email'] as String?,
        lienHe1: data['lien_he1'] as String?,
        lienHe2: data['lien_he2'] as String?,
        lienHe3: data['lien_he3'] as String?,
        lienHe4: data['lien_he4'] as String?,
        tenBophan: data['ten_bophan'] as String?,
        tenChucvu: data['ten_chucvu'] as String?,
        chinhanhnhanvien: data['chinhanhnhanvien'] as String?,
        logo: data['logo'] as String?);
  }

  Map<String, dynamic> toMap() => {
        'ma_cty': maCty,
        'ten_cty': tenCty,
        'ma_nhanvien': maNhanvien,
        'ten_nhanvien': tenNhanvien,
        'ten_gioitinh': tenGioitinh,
        'tel': tel,
        'email': email,
        'lien_he1': lienHe1,
        'lien_he2': lienHe2,
        'lien_he3': lienHe3,
        'lien_he4': lienHe4,
        'ten_bophan': tenBophan,
        'ten_chucvu': tenChucvu,
        'chinhanhnhanvien': chinhanhnhanvien,
        'logo': logo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TraCuuNhanVien].
  factory TraCuuNhanVien.fromJson(String data) {
    return TraCuuNhanVien.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TraCuuNhanVien] to a JSON string.
  String toJson() => json.encode(toMap());

  TraCuuNhanVien copyWith({
    String? maCty,
    String? tenCty,
    String? maNhanvien,
    String? tenNhanvien,
    String? tenGioitinh,
    String? tel,
    String? email,
    String? lienHe1,
    String? lienHe2,
    String? lienHe3,
    String? lienHe4,
    String? tenBophan,
    String? tenChucvu,
    String? chinhanhnhanvien,
    String? logo,
  }) {
    return TraCuuNhanVien(
      maCty: maCty ?? this.maCty,
      tenCty: tenCty ?? this.tenCty,
      maNhanvien: maNhanvien ?? this.maNhanvien,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      tenGioitinh: tenGioitinh ?? this.tenGioitinh,
      tel: tel ?? this.tel,
      email: email ?? this.email,
      lienHe1: lienHe1 ?? this.lienHe1,
      lienHe2: lienHe2 ?? this.lienHe2,
      lienHe3: lienHe3 ?? this.lienHe3,
      lienHe4: lienHe4 ?? this.lienHe4,
      tenBophan: tenBophan ?? this.tenBophan,
      tenChucvu: tenChucvu ?? this.tenChucvu,
      chinhanhnhanvien: chinhanhnhanvien ?? this.chinhanhnhanvien,
      logo: logo ?? this.logo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TraCuuNhanVien) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      maCty.hashCode ^
      tenCty.hashCode ^
      maNhanvien.hashCode ^
      tenNhanvien.hashCode ^
      tenGioitinh.hashCode ^
      tel.hashCode ^
      email.hashCode ^
      lienHe1.hashCode ^
      lienHe2.hashCode ^
      lienHe3.hashCode ^
      lienHe4.hashCode ^
      tenBophan.hashCode ^
      tenChucvu.hashCode ^
      chinhanhnhanvien.hashCode;
}
