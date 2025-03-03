import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserInfo {
  final String? maNhanvien;
  final String? tenNhanvien;
  final int? isadmin;
  final String? tenPhongban;
  final String? tenBophan;
  final String? tenChucvu;
  final String? maCty;
  final String? tenCty;
  final String? maNhanvienKt;

  final String? maSoThue;
  final String? soBaoHiem;
  final String? soTaiKhoan;
  final String? maNganHang;
  final String? tenNganHang;

  //nv.ma_so_thue, nv.so_sobaohiem, so_tai_khoan, nv.ma_ngh, nv.ten_ngh

  const UserInfo({
    this.maSoThue,
    this.soBaoHiem,
    this.soTaiKhoan,
    this.maNganHang,
    this.tenNganHang,
    this.maNhanvien,
    this.tenNhanvien,
    this.isadmin,
    this.tenPhongban,
    this.tenBophan,
    this.tenChucvu,
    this.maCty,
    this.tenCty,
    this.maNhanvienKt,
  });

  @override
  String toString() {
    return 'UserInfo(maNhanvien: $maNhanvien, tenNhanvien: $tenNhanvien, isadmin: $isadmin, tenPhongban: $tenPhongban, tenBophan: $tenBophan, tenChucvu: $tenChucvu, maCty: $maCty, tenCty: $tenCty, maNhanvienKt: $maNhanvienKt)';
  }

  factory UserInfo.fromMap(Map<String, dynamic> data) => UserInfo(
        maSoThue: data['ma_so_thue'] as String?,
        soBaoHiem: data['so_sobaohiem'] as String?,
        soTaiKhoan: data['so_tai_khoan'] as String?,
        maNganHang: data['ma_ngh'] as String?,
        tenNganHang: data['ten_ngh'] as String?,
        maNhanvien: data['ma_nhanvien'] as String?,
        tenNhanvien: data['ten_nhanvien'] as String?,
        isadmin: data['isadmin'] as int?,
        tenPhongban: data['ten_phongban'] as String?,
        tenBophan: data['ten_bophan'] as String?,
        tenChucvu: data['ten_chucvu'] as String?,
        maCty: data['ma_cty'] as String?,
        tenCty: data['ten_cty'] as String?,
        maNhanvienKt: data['ma_nhanvien_kt'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'ma_nhanvien': maNhanvien,
        'ten_nhanvien': tenNhanvien,
        'isadmin': isadmin,
        'ten_phongban': tenPhongban,
        'ten_bophan': tenBophan,
        'ten_chucvu': tenChucvu,
        'ma_cty': maCty,
        'ten_cty': tenCty,
        'ma_nhanvien_kt': maNhanvienKt,
        'ma_so_thue': maSoThue,
        'so_sobaohiem': soBaoHiem,
        'so_tai_khoan': soTaiKhoan,
        'ma_ngh': maNganHang,
        'ten_ngh': tenNganHang,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserInfo].
  factory UserInfo.fromJson(String data) {
    return UserInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserInfo] to a JSON string.
  String toJson() => json.encode(toMap());

  UserInfo copyWith({
    String? maNhanvien,
    String? tenNhanvien,
    int? isadmin,
    String? tenPhongban,
    String? tenBophan,
    String? tenChucvu,
    String? maCty,
    String? tenCty,
    String? maNhanvienKt,
    String? maSoThue,
    String? soBaoHiem,
    String? soTaiKhoan,
    String? maNganHang,
    String? tenNganHang,
  }) {
    return UserInfo(
      maNhanvien: maNhanvien ?? this.maNhanvien,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      isadmin: isadmin ?? this.isadmin,
      tenPhongban: tenPhongban ?? this.tenPhongban,
      tenBophan: tenBophan ?? this.tenBophan,
      tenChucvu: tenChucvu ?? this.tenChucvu,
      maCty: maCty ?? this.maCty,
      tenCty: tenCty ?? this.tenCty,
      maNhanvienKt: maNhanvienKt ?? this.maNhanvienKt,
      maSoThue: maSoThue ?? this.maSoThue,
      soBaoHiem: maSoThue ?? this.soBaoHiem,
      soTaiKhoan: maSoThue ?? this.soTaiKhoan,
      maNganHang: maSoThue ?? this.maNganHang,
      tenNganHang: maSoThue ?? this.tenNganHang,
    );
  }

  factory UserInfo.copyFrom(UserInfo source) {
    return UserInfo(
      maNhanvien: source.maNhanvien ?? source.maNhanvien,
      tenNhanvien: source.tenNhanvien ?? source.tenNhanvien,
      isadmin: source.isadmin ?? source.isadmin,
      tenPhongban: source.tenPhongban ?? source.tenPhongban,
      tenBophan: source.tenBophan ?? source.tenBophan,
      tenChucvu: source.tenChucvu ?? source.tenChucvu,
      maCty: source.maCty ?? source.maCty,
      tenCty: source.tenCty ?? source.tenCty,
      maNhanvienKt: source.maNhanvienKt ?? source.maNhanvienKt,
      maSoThue: source.maSoThue ?? source.maSoThue,
      soBaoHiem: source.soBaoHiem ?? source.soBaoHiem,
      soTaiKhoan: source.soTaiKhoan ?? source.soTaiKhoan,
      maNganHang: source.maNganHang ?? source.maNganHang,
      tenNganHang: source.tenNganHang ?? source.tenNganHang,
    );
  }
  factory UserInfo.fromEmpty() {
    return const UserInfo(
      maNhanvien: "",
      tenNhanvien: "",
      isadmin: 0,
      tenPhongban: "",
      tenBophan: "",
      tenChucvu: "",
      maCty: "",
      tenCty: "",
      maNhanvienKt: "",
      maSoThue: "",
      soBaoHiem: "",
      soTaiKhoan: "",
      maNganHang: "",
      tenNganHang: "",
    );
  }
}
