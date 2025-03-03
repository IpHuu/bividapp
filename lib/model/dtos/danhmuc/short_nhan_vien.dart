import 'dart:convert';

import 'package:collection/collection.dart';

class ShortNhanVien {
  bool? chon;
  String? maNhanvien;
  String? userName;
  String? fullName;
  String? chucVu;
  String? email;
  String? maCty;

  ShortNhanVien({
    this.chon,
    this.maNhanvien,
    this.userName,
    this.fullName,
    this.chucVu,
    this.email,
    this.maCty,
  });

  @override
  String toString() {
    return 'ShortNhanVien(chon: $chon, maNhanvien: $maNhanvien, userName: $userName, fullName: $fullName, chucVu: $chucVu, email: $email, maCty: $maCty)';
  }

  factory ShortNhanVien.fromMap(Map<String, dynamic> data) => ShortNhanVien(
        chon: data['chon'] as bool?,
        maNhanvien: data['ma_nhanvien'] as String?,
        userName: data['userName'] as String?,
        fullName: data['fullName'] as String?,
        chucVu: data['chucVu'] as String?,
        email: data['email'] as String?,
        maCty: data['ma_cty'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'chon': chon,
        'ma_nhanvien': maNhanvien,
        'userName': userName,
        'fullName': fullName,
        'chucVu': chucVu,
        'email': email,
        'ma_cty': maCty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShortNhanVien].
  factory ShortNhanVien.fromJson(String data) {
    return ShortNhanVien.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShortNhanVien] to a JSON string.
  String toJson() => json.encode(toMap());

  ShortNhanVien copyWith({
    bool? chon,
    String? maNhanvien,
    String? userName,
    String? fullName,
    String? chucVu,
    String? email,
    String? maCty,
  }) {
    return ShortNhanVien(
      chon: chon ?? this.chon,
      maNhanvien: maNhanvien ?? this.maNhanvien,
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      chucVu: chucVu ?? this.chucVu,
      email: email ?? this.email,
      maCty: maCty ?? this.maCty,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ShortNhanVien) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      chon.hashCode ^
      maNhanvien.hashCode ^
      userName.hashCode ^
      fullName.hashCode ^
      chucVu.hashCode ^
      email.hashCode ^
      maCty.hashCode;
}
