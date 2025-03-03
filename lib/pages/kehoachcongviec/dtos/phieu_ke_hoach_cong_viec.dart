import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class KeHoachCongViec extends IDocument {
  String logoCongTy;
  String? nguoiTrinhKy;
  String? nguoiTruongBp;
  String? nguoiDaiDienCTy;
  String? nguoiTruongBpKhac;
  String? nguoiTgd;
  int idKeHoachCongViec;
  String maCongTy;
  String? loaiKeHoach;
  String? veViec;
  String? maNguoiDeNghi;
  String? mucTieu;
  String? thoiGianThucHien;
  String noiDungKeHoach;
  String? soPhieuAuto;
  String? barcode;
  String? nguoiTao;
  DateTime? ngayTao;
  String? nguoiSua;
  DateTime? ngaySua;
  String? ndTruongBp;
  String? ndTruongBpKhac;
  String? listTruongBp;
  String? listTruongBpKhac;
  String? listTgd;
  String? tenCty2;
  String? tenloaikehoach;
  String? tenNhanvien;
  int tinhTrang;
  String tinhTrangChu;
  String tenBoPhan;
  String chucVuNhanVien;
  bool isHuy;
  // Version 2
  String mainId;
  String loaiTrinhKy;
  String danhDau;
  int versionNo;

  KeHoachCongViec({
    this.logoCongTy = '',
    this.nguoiTrinhKy,
    this.nguoiTruongBp,
    this.nguoiDaiDienCTy,
    this.nguoiTruongBpKhac,
    this.nguoiTgd,
    this.idKeHoachCongViec = 0,
    this.maCongTy = '',
    this.loaiKeHoach,
    this.veViec,
    this.maNguoiDeNghi,
    this.mucTieu,
    this.thoiGianThucHien,
    this.noiDungKeHoach = '',
    this.soPhieuAuto,
    this.barcode,
    this.nguoiTao,
    this.ngayTao,
    this.nguoiSua,
    this.ngaySua,
    this.ndTruongBp,
    this.ndTruongBpKhac,
    this.listTruongBp,
    this.listTruongBpKhac,
    this.listTgd,
    this.tenCty2,
    this.tenloaikehoach,
    this.tenNhanvien,
    this.tinhTrang = -1,
    this.tinhTrangChu = '',
    this.tenBoPhan = '',
    this.chucVuNhanVien = '',
    this.mainId = '',
    this.danhDau = '',
    this.loaiTrinhKy = '',
    this.versionNo = 0,
    this.isHuy = false,
  });

  @override
  String toString() {
    return 'KeHoachCongViec(logoCongTy: $logoCongTy, nguoiTrinhKy: $nguoiTrinhKy, nguoiTruongBp: $nguoiTruongBp, nguoiDaiDienCTy: $nguoiDaiDienCTy, nguoiTruongBpKhac: $nguoiTruongBpKhac, nguoiTgd: $nguoiTgd, idKeHoachCongViec: $idKeHoachCongViec, maCongTy: $maCongTy, loaiKeHoach: $loaiKeHoach, veViec: $veViec, maNguoiDeNghi: $maNguoiDeNghi, mucTieu: $mucTieu, thoiGianThucHien: $thoiGianThucHien, noiDungKeHoach: $noiDungKeHoach, soPhieuAuto: $soPhieuAuto, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, ndTruongBp: $ndTruongBp, ndTruongBpKhac: $ndTruongBpKhac, listTruongBp: $listTruongBp, listTruongBpKhac: $listTruongBpKhac, listTgd: $listTgd, tenCty2: $tenCty2, tenloaikehoach: $tenloaikehoach, tenNhanvien: $tenNhanvien, tinhTrang: $tinhTrang)';
  }

  factory KeHoachCongViec.fromMap(Map<String, dynamic> data) {
    try {
      final newItem = KeHoachCongViec();
      newItem.logoCongTy =
          data['logoCongTy'] == null ? '' : (data['logoCongTy'] as String);
      newItem.nguoiTrinhKy = data['nguoiTrinhKy'] as String?;
      newItem.nguoiTruongBp = data['nguoiTruongBP'] as String?;
      newItem.nguoiDaiDienCTy = data['nguoiDaiDienCTy'] as String?;
      newItem.nguoiTruongBpKhac = data['nguoiTruongBPKhac'] as String?;
      newItem.nguoiTgd = data['nguoiTGD'] as String?;
      newItem.idKeHoachCongViec = (data['idKeHoachCongViec'] == null)
          ? 0
          : (data['idKeHoachCongViec'] as int);
      newItem.maCongTy = data['maCongTy'] as String;
      newItem.loaiKeHoach = data['loaiKeHoach'] as String?;
      newItem.veViec = data['veViec'] as String?;
      newItem.maNguoiDeNghi = data['maNguoiDeNghi'] as String?;
      newItem.mucTieu = data['mucTieu'] as String?;
      newItem.thoiGianThucHien = data['thoiGianThucHien'] as String?;
      newItem.noiDungKeHoach = data['noiDungKeHoach'] ?? '';
      newItem.soPhieuAuto = data['soPhieuAuto'] as String?;
      newItem.barcode = data['barcode'] as String?;
      newItem.nguoiTao = data['nguoiTao'] as String?;
      newItem.ngayTao =
          data["ngayTao"] != null ? DateTime.parse(data["ngayTao"]) : null;
      newItem.nguoiSua = data['nguoiSua'] as String?;
      newItem.ngaySua =
          data["ngaySua"] != null ? DateTime.parse(data["ngaySua"]) : null;
      newItem.ndTruongBp = data['ndTruongBP'] as String?;
      newItem.ndTruongBpKhac = data['ndTruongBPKhac'] as String?;
      newItem.listTruongBp = data['listTruongBP'] as String?;
      newItem.listTruongBpKhac = data['listTruongBPKhac'] as String?;
      newItem.listTgd = data['listTGD'] as String?;
      newItem.tenCty2 = data['ten_cty2'] as String?;
      newItem.tenloaikehoach = data['tenloaikehoach'] as String?;
      newItem.tenNhanvien = data['ten_nhanvien'] ?? '';
      newItem.tinhTrang =
          (data['tinhTrang'] == null) ? -1 : (data['tinhTrang'] as int);
      newItem.tinhTrangChu = data['tinhTrangChu'] ?? '';
      newItem.tenBoPhan = data['tenBoPhan'] ?? '';
      newItem.chucVuNhanVien = data['chucVuNhanVien'] ?? '';

      newItem.mainId = data['main_id'] ?? '';
      newItem.danhDau = data['danhdau'] ?? '';
      newItem.loaiTrinhKy = data['loai_trinhky'] ?? '';
      newItem.versionNo =
          (data['versionNo'] == null) ? -1 : (data['versionNo'] as int);

      newItem.isHuy = data['isHuy'] ?? true;

      return newItem;
    } on Exception catch (ex) {
      debugPrint(ex.toString());
      late KeHoachCongViec tempRow = KeHoachCongViec();
      tempRow.idKeHoachCongViec = -1;
      return tempRow;
    }
  }

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'nguoiTrinhKy': nguoiTrinhKy,
        'nguoiTruongBP': nguoiTruongBp,
        'nguoiDaiDienCTy': nguoiDaiDienCTy,
        'nguoiTruongBPKhac': nguoiTruongBpKhac,
        'nguoiTGD': nguoiTgd,
        'idKeHoachCongViec': idKeHoachCongViec,
        'maCongTy': maCongTy,
        'loaiKeHoach': loaiKeHoach,
        'veViec': veViec,
        'maNguoiDeNghi': maNguoiDeNghi,
        'mucTieu': mucTieu,
        'thoiGianThucHien': thoiGianThucHien,
        'noiDungKeHoach': noiDungKeHoach,
        'soPhieuAuto': soPhieuAuto,
        'barcode': barcode,
        'nguoiTao': nguoiTao,
        'ngayTao': ngayTao,
        'nguoiSua': nguoiSua,
        'ngaySua': ngaySua,
        'ndTruongBP': ndTruongBp,
        'ndTruongBPKhac': ndTruongBpKhac,
        'listTruongBP': listTruongBp,
        'listTruongBPKhac': listTruongBpKhac,
        'listTGD': listTgd,
        'ten_cty2': tenCty2,
        'tenloaikehoach': tenloaikehoach,
        'ten_nhanvien': tenNhanvien,
        'tinhTrang': tinhTrang,
        'tinhTrangChu': tinhTrangChu,
        'tenBoPhan': tenBoPhan,
        'chucVuNhanVien': chucVuNhanVien,
        'main_id': mainId,
        'loai_trinhky': loaiTrinhKy,
        'danhdau': danhDau,
        'versionNo': versionNo,
        'isHuy': isHuy,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KeHoachCongViec].
  factory KeHoachCongViec.fromJson(String data) {
    return KeHoachCongViec.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KeHoachCongViec] to a JSON string.
  String toJson() => json.encode(toMap());

  KeHoachCongViec copyWith({
    String? logoCongTy,
    String? nguoiTrinhKy,
    String? nguoiTruongBp,
    String? nguoiDaiDienCTy,
    String? nguoiTruongBpKhac,
    String? nguoiTgd,
    int? idKeHoachCongViec,
    String? maCongTy,
    String? loaiKeHoach,
    String? veViec,
    String? maNguoiDeNghi,
    String? mucTieu,
    String? thoiGianThucHien,
    String? noiDungKeHoach,
    String? soPhieuAuto,
    String? barcode,
    String? nguoiTao,
    String? ngayTao,
    String? nguoiSua,
    String? ngaySua,
    String? ndTruongBp,
    String? ndTruongBpKhac,
    String? listTruongBp,
    String? listTruongBpKhac,
    String? listTgd,
    String? tenCty2,
    String? tenloaikehoach,
    String? tenNhanvien,
    int? tinhTrang,
    bool isHuy = false,
    String tinhTrangChu = '',
    String tenBoPhan = '',
    String chucVuNhanVien = '',
  }) {
    return KeHoachCongViec(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      nguoiTrinhKy: nguoiTrinhKy ?? this.nguoiTrinhKy,
      nguoiTruongBp: nguoiTruongBp ?? this.nguoiTruongBp,
      nguoiDaiDienCTy: nguoiDaiDienCTy ?? this.nguoiDaiDienCTy,
      nguoiTruongBpKhac: nguoiTruongBpKhac ?? this.nguoiTruongBpKhac,
      nguoiTgd: nguoiTgd ?? this.nguoiTgd,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiKeHoach: loaiKeHoach ?? this.loaiKeHoach,
      veViec: veViec ?? this.veViec,
      maNguoiDeNghi: maNguoiDeNghi ?? this.maNguoiDeNghi,
      mucTieu: mucTieu ?? this.mucTieu,
      thoiGianThucHien: thoiGianThucHien ?? this.thoiGianThucHien,
      noiDungKeHoach: noiDungKeHoach ?? this.noiDungKeHoach,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      barcode: barcode ?? this.barcode,
      nguoiTao: nguoiTao ?? this.nguoiTao,
      ngayTao: this.ngayTao,
      nguoiSua: nguoiSua ?? this.nguoiSua,
      ngaySua: this.ngaySua,
      ndTruongBp: ndTruongBp ?? this.ndTruongBp,
      ndTruongBpKhac: ndTruongBpKhac ?? this.ndTruongBpKhac,
      listTruongBp: listTruongBp ?? this.listTruongBp,
      listTruongBpKhac: listTruongBpKhac ?? this.listTruongBpKhac,
      listTgd: listTgd ?? this.listTgd,
      tenCty2: tenCty2 ?? this.tenCty2,
      tenloaikehoach: tenloaikehoach ?? this.tenloaikehoach,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      tinhTrangChu: tinhTrangChu,
      tenBoPhan: tenBoPhan,
      chucVuNhanVien: chucVuNhanVien,
      isHuy: isHuy,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! KeHoachCongViec) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      logoCongTy.hashCode ^
      nguoiTrinhKy.hashCode ^
      nguoiTruongBp.hashCode ^
      nguoiDaiDienCTy.hashCode ^
      nguoiTruongBpKhac.hashCode ^
      nguoiTgd.hashCode ^
      idKeHoachCongViec.hashCode ^
      maCongTy.hashCode ^
      loaiKeHoach.hashCode ^
      veViec.hashCode ^
      maNguoiDeNghi.hashCode ^
      mucTieu.hashCode ^
      thoiGianThucHien.hashCode ^
      noiDungKeHoach.hashCode ^
      soPhieuAuto.hashCode ^
      barcode.hashCode ^
      nguoiTao.hashCode ^
      ngayTao.hashCode ^
      nguoiSua.hashCode ^
      ngaySua.hashCode ^
      ndTruongBp.hashCode ^
      ndTruongBpKhac.hashCode ^
      listTruongBp.hashCode ^
      listTruongBpKhac.hashCode ^
      listTgd.hashCode ^
      tenCty2.hashCode ^
      tenloaikehoach.hashCode ^
      tenNhanvien.hashCode ^
      tinhTrang.hashCode;
  @override
  int getId() {
    return idKeHoachCongViec;
  }

  @override
  String getType() {
    return 'KHCV';
  }
}
