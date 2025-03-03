import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class PhieuDeXuatMuaHang extends IDocument {
  String logoCongTy;
  String chucVuNhanVien;
  String? maChucvu;
  String? maBophan;
  String maCty;
  String? tenBoPhan;
  int idDeXuatMh;
  int? idKeHoachCongViec;
  String maCongTy;
  String loaiPhieu;
  DateTime? ngayDeXuat;
  String? nguoiDeXuat;
  String lyDoDeXuat;
  String? barcode;
  String? nguoiTao;
  DateTime? ngayTao;
  String? nguoiSua;
  DateTime? ngaySua;
  bool? isHuy;
  String? nguoiHuy;
  DateTime? ngayHuy;
  bool? isTrinhKy;
  DateTime? ngayTrinhKy;
  String? nguoiTrinhKy;
  String? listTruongBp;
  bool? isTruongBp;
  String? nguoiTruongBp;
  DateTime? ngayTruongBp;
  String? ndTruongBp;
  String? listKeToan;
  bool? isKeToan;
  String? nguoiKeToan;
  DateTime? ngayKeToan;
  String? ndKeToan;
  String? listKsnb;
  bool? isKsnb;
  String? nguoiKsnb;
  DateTime? ngayKsnb;
  String? ndksnb;
  String? listTgd;
  bool? isTgd;
  bool? isKhongTgd;
  String? nguoiTgd;
  DateTime? ngayTgd;
  String? ndtgd;
  bool? isTatToan;
  String? soPhieuAuto;
  String? tenCty2;
  String? tenNhanvien;
  int tinhTrang = 0;
  String tinhTrangChu;
  double tongTien;

  PhieuDeXuatMuaHang(
      {this.logoCongTy = '',
      this.chucVuNhanVien = '',
      this.maChucvu,
      this.maBophan,
      this.maCty = '',
      this.tenBoPhan,
      this.idDeXuatMh = 0,
      this.idKeHoachCongViec,
      this.maCongTy = '',
      this.loaiPhieu = '',
      this.ngayDeXuat,
      this.nguoiDeXuat,
      this.lyDoDeXuat = '',
      this.barcode,
      this.nguoiTao,
      this.ngayTao,
      this.nguoiSua,
      this.ngaySua,
      this.isHuy,
      this.nguoiHuy,
      this.ngayHuy,
      this.isTrinhKy,
      this.ngayTrinhKy,
      this.nguoiTrinhKy,
      this.listTruongBp,
      this.isTruongBp,
      this.nguoiTruongBp,
      this.ngayTruongBp,
      this.ndTruongBp,
      this.listKeToan,
      this.isKeToan,
      this.nguoiKeToan,
      this.ngayKeToan,
      this.ndKeToan,
      this.listKsnb,
      this.isKsnb,
      this.nguoiKsnb,
      this.ngayKsnb,
      this.ndksnb,
      this.listTgd,
      this.isTgd,
      this.isKhongTgd,
      this.nguoiTgd,
      this.ngayTgd,
      this.ndtgd,
      this.isTatToan,
      this.soPhieuAuto,
      this.tenCty2,
      this.tenNhanvien,
      this.tinhTrang = 0,
      this.tinhTrangChu = '',
      this.tongTien = 0});

  @override
  String toString() {
    return 'PhieuDeXuatMuaHang(logoCongTy: $logoCongTy, chucVuNhanVien: $chucVuNhanVien, maChucvu: $maChucvu, maBophan: $maBophan, maCty: $maCty, tenBoPhan: $tenBoPhan, idDeXuatMh: $idDeXuatMh, idKeHoachCongViec: $idKeHoachCongViec, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, ngayDeXuat: $ngayDeXuat, nguoiDeXuat: $nguoiDeXuat, lyDoDeXuat: $lyDoDeXuat, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, isHuy: $isHuy, nguoiHuy: $nguoiHuy, ngayHuy: $ngayHuy, isTrinhKy: $isTrinhKy, ngayTrinhKy: $ngayTrinhKy, nguoiTrinhKy: $nguoiTrinhKy, listTruongBp: $listTruongBp, isTruongBp: $isTruongBp, nguoiTruongBp: $nguoiTruongBp, ngayTruongBp: $ngayTruongBp, ndTruongBp: $ndTruongBp, listKeToan: $listKeToan, isKeToan: $isKeToan, nguoiKeToan: $nguoiKeToan, ngayKeToan: $ngayKeToan, ndKeToan: $ndKeToan, listKsnb: $listKsnb, isKsnb: $isKsnb, nguoiKsnb: $nguoiKsnb, ngayKsnb: $ngayKsnb, ndksnb: $ndksnb, listTgd: $listTgd, isTgd: $isTgd, isKhongTgd: $isKhongTgd, nguoiTgd: $nguoiTgd, ngayTgd: $ngayTgd, ndtgd: $ndtgd, isTatToan: $isTatToan, soPhieuAuto: $soPhieuAuto, tenCty2: $tenCty2, tenNhanvien: $tenNhanvien, tinhTrang: $tinhTrang)';
  }

  factory PhieuDeXuatMuaHang.fromMap(Map<String, dynamic> data) {
    return PhieuDeXuatMuaHang(
      logoCongTy: (data['logoCongTy'] ?? '') ?? '',
      chucVuNhanVien: (data['chucVuNhanVien'] ?? ''),
      maChucvu: data['ma_chucvu'] as String?,
      maBophan: data['ma_bophan'] as String?,
      maCty: (data['ma_cty'] ?? ''),
      tenBoPhan: data['tenBoPhan'] as String?,
      idDeXuatMh: (data['idDeXuatMH'] ?? 0),
      idKeHoachCongViec: data['idKeHoachCongViec'] as int?,
      maCongTy: (data['maCongTy'] ?? ''),
      loaiPhieu: (data['loaiPhieu'] ?? ''),
      ngayDeXuat: data['ngayDeXuat'] == null
          ? null
          : DateTime.parse(data['ngayDeXuat'] as String),
      nguoiDeXuat: data['nguoiDeXuat'] as String?,
      lyDoDeXuat: (data['lyDoDeXuat'] ?? ''),
      barcode: data['barcode'] as String?,
      nguoiTao: data['nguoiTao'] as String?,
      ngayTao: data['ngayTao'] == null
          ? null
          : DateTime.parse(data['ngayTao'] as String),
      nguoiSua: data['nguoiSua'] as String?,
      ngaySua: data['ngaySua'] == null
          ? null
          : DateTime.parse(data['ngaySua'] as String),
      isHuy: data['isHuy'] as bool?,
      nguoiHuy: data['nguoiHuy'] as String?,
      ngayHuy: data['ngayHuy'] == null
          ? null
          : DateTime.parse(data['ngayHuy'] as String),
      isTrinhKy: data['isTrinhKy'] as bool?,
      ngayTrinhKy: data['ngayTrinhKy'] == null
          ? null
          : DateTime.parse(data['ngayTrinhKy'] as String),
      nguoiTrinhKy: data['nguoiTrinhKy'] as String?,
      listTruongBp: data['listTruongBP'] as String?,
      isTruongBp: data['isTruongBP'] as bool?,
      nguoiTruongBp: data['nguoiTruongBP'] as String?,
      ngayTruongBp: data['ngayTruongBP'] == null
          ? null
          : DateTime.parse(data['ngayTruongBP'] as String),
      ndTruongBp: data['ndTruongBP'] as String?,
      listKeToan: data['listKeToan'] as String?,
      isKeToan: data['isKeToan'] as bool?,
      nguoiKeToan: data['nguoiKeToan'] as String?,
      ngayKeToan: data['ngayKeToan'] == null
          ? null
          : DateTime.parse(data['ngayKeToan'] as String),
      ndKeToan: data['ndKeToan'] as String?,
      listKsnb: data['listKSNB'] as String?,
      isKsnb: data['isKSNB'] as bool?,
      nguoiKsnb: data['nguoiKSNB'] as String?,
      ngayKsnb: data['ngayKSNB'] == null
          ? null
          : DateTime.parse(data['ngayKSNB'] as String),
      ndksnb: data['ndksnb'] as String?,
      listTgd: data['listTGD'] as String?,
      isTgd: data['isTGD'] as bool?,
      isKhongTgd: data['isKhongTGD'] as bool?,
      nguoiTgd: data['nguoiTGD'] as String?,
      ngayTgd: data['ngayTGD'] == null
          ? null
          : DateTime.parse(data['ngayTGD'] as String),
      ndtgd: data['ndtgd'] as String?,
      isTatToan: data['isTatToan'] as bool?,
      soPhieuAuto: data['soPhieuAuto'] as String?,
      tenCty2: data['ten_cty2'] as String?,
      tenNhanvien: data['ten_nhanvien'] as String?,
      tinhTrang: (data['tinhTrang'] ?? 0),
      tinhTrangChu: (data['tinhTrangChu'] ?? ''),
      tongTien: (data['tongTien'] != null
          ? double.parse(data['tongTien'].toString())
          : 0.0),
    );
  }

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'chucVuNhanVien': chucVuNhanVien,
        'ma_chucvu': maChucvu,
        'ma_bophan': maBophan,
        'ma_cty': maCty,
        'tenBoPhan': tenBoPhan,
        'idDeXuatMH': idDeXuatMh,
        'idKeHoachCongViec': idKeHoachCongViec,
        'maCongTy': maCongTy,
        'loaiPhieu': loaiPhieu,
        'ngayDeXuat': ngayDeXuat?.toIso8601String(),
        'nguoiDeXuat': nguoiDeXuat,
        'lyDoDeXuat': lyDoDeXuat,
        'barcode': barcode,
        'nguoiTao': nguoiTao,
        'ngayTao': ngayTao?.toIso8601String(),
        'nguoiSua': nguoiSua,
        'ngaySua': ngaySua?.toIso8601String(),
        'isHuy': isHuy,
        'nguoiHuy': nguoiHuy,
        'ngayHuy': ngayHuy?.toIso8601String(),
        'isTrinhKy': isTrinhKy,
        'ngayTrinhKy': ngayTrinhKy?.toIso8601String(),
        'nguoiTrinhKy': nguoiTrinhKy,
        'listTruongBP': listTruongBp,
        'isTruongBP': isTruongBp,
        'nguoiTruongBP': nguoiTruongBp,
        'ngayTruongBP': ngayTruongBp?.toIso8601String(),
        'ndTruongBP': ndTruongBp,
        'listKeToan': listKeToan,
        'isKeToan': isKeToan,
        'nguoiKeToan': nguoiKeToan,
        'ngayKeToan': ngayKeToan?.toIso8601String(),
        'ndKeToan': ndKeToan,
        'listKSNB': listKsnb,
        'isKSNB': isKsnb,
        'nguoiKSNB': nguoiKsnb,
        'ngayKSNB': ngayKsnb?.toIso8601String(),
        'ndksnb': ndksnb,
        'listTGD': listTgd,
        'isTGD': isTgd,
        'isKhongTGD': isKhongTgd,
        'nguoiTGD': nguoiTgd,
        'ngayTGD': ngayTgd?.toIso8601String(),
        'ndtgd': ndtgd,
        'isTatToan': isTatToan,
        'soPhieuAuto': soPhieuAuto,
        'ten_cty2': tenCty2,
        'ten_nhanvien': tenNhanvien,
        'tinhTrang': tinhTrang,
        'tinhTrangChu': tinhTrangChu,
        'tongTien': tongTien,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PhieuDeXuatMuaHang].
  factory PhieuDeXuatMuaHang.fromJson(String data) {
    return PhieuDeXuatMuaHang.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PhieuDeXuatMuaHang] to a JSON string.
  String toJson() => json.encode(toMap());

  PhieuDeXuatMuaHang copyWith({
    String? logoCongTy,
    String? chucVuNhanVien,
    String? maChucvu,
    String? maBophan,
    String? maCty,
    String? tenBoPhan,
    int? idDeXuatMh,
    int? idKeHoachCongViec,
    String? maCongTy,
    String? loaiPhieu,
    DateTime? ngayDeXuat,
    String? nguoiDeXuat,
    String? lyDoDeXuat,
    String? barcode,
    String? nguoiTao,
    DateTime? ngayTao,
    String? nguoiSua,
    DateTime? ngaySua,
    bool? isHuy,
    String? nguoiHuy,
    DateTime? ngayHuy,
    bool? isTrinhKy,
    DateTime? ngayTrinhKy,
    String? nguoiTrinhKy,
    String? listTruongBp,
    bool? isTruongBp,
    String? nguoiTruongBp,
    DateTime? ngayTruongBp,
    String? ndTruongBp,
    String? listKeToan,
    bool? isKeToan,
    String? nguoiKeToan,
    DateTime? ngayKeToan,
    String? ndKeToan,
    String? listKsnb,
    bool? isKsnb,
    String? nguoiKsnb,
    DateTime? ngayKsnb,
    String? ndksnb,
    String? listTgd,
    bool? isTgd,
    bool? isKhongTgd,
    String? nguoiTgd,
    DateTime? ngayTgd,
    String? ndtgd,
    bool? isTatToan,
    String? soPhieuAuto,
    String? tenCty2,
    String? tenNhanvien,
    int? tinhTrang,
  }) {
    return PhieuDeXuatMuaHang(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      chucVuNhanVien: chucVuNhanVien ?? this.chucVuNhanVien,
      maChucvu: maChucvu ?? this.maChucvu,
      maBophan: maBophan ?? this.maBophan,
      maCty: maCty ?? this.maCty,
      tenBoPhan: tenBoPhan ?? this.tenBoPhan,
      idDeXuatMh: idDeXuatMh ?? this.idDeXuatMh,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiPhieu: loaiPhieu ?? this.loaiPhieu,
      ngayDeXuat: ngayDeXuat ?? this.ngayDeXuat,
      nguoiDeXuat: nguoiDeXuat ?? this.nguoiDeXuat,
      lyDoDeXuat: lyDoDeXuat ?? this.lyDoDeXuat,
      barcode: barcode ?? this.barcode,
      nguoiTao: nguoiTao ?? this.nguoiTao,
      ngayTao: ngayTao ?? this.ngayTao,
      nguoiSua: nguoiSua ?? this.nguoiSua,
      ngaySua: ngaySua ?? this.ngaySua,
      isHuy: isHuy ?? this.isHuy,
      nguoiHuy: nguoiHuy ?? this.nguoiHuy,
      ngayHuy: ngayHuy ?? this.ngayHuy,
      isTrinhKy: isTrinhKy ?? this.isTrinhKy,
      ngayTrinhKy: ngayTrinhKy ?? this.ngayTrinhKy,
      nguoiTrinhKy: nguoiTrinhKy ?? this.nguoiTrinhKy,
      listTruongBp: listTruongBp ?? this.listTruongBp,
      isTruongBp: isTruongBp ?? this.isTruongBp,
      nguoiTruongBp: nguoiTruongBp ?? this.nguoiTruongBp,
      ngayTruongBp: ngayTruongBp ?? this.ngayTruongBp,
      ndTruongBp: ndTruongBp ?? this.ndTruongBp,
      listKeToan: listKeToan ?? this.listKeToan,
      isKeToan: isKeToan ?? this.isKeToan,
      nguoiKeToan: nguoiKeToan ?? this.nguoiKeToan,
      ngayKeToan: ngayKeToan ?? this.ngayKeToan,
      ndKeToan: ndKeToan ?? this.ndKeToan,
      listKsnb: listKsnb ?? this.listKsnb,
      isKsnb: isKsnb ?? this.isKsnb,
      nguoiKsnb: nguoiKsnb ?? this.nguoiKsnb,
      ngayKsnb: ngayKsnb ?? this.ngayKsnb,
      ndksnb: ndksnb ?? this.ndksnb,
      listTgd: listTgd ?? this.listTgd,
      isTgd: isTgd ?? this.isTgd,
      isKhongTgd: isKhongTgd ?? this.isKhongTgd,
      nguoiTgd: nguoiTgd ?? this.nguoiTgd,
      ngayTgd: ngayTgd ?? this.ngayTgd,
      ndtgd: ndtgd ?? this.ndtgd,
      isTatToan: isTatToan ?? this.isTatToan,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      tenCty2: tenCty2 ?? this.tenCty2,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      tinhTrang: tinhTrang ?? this.tinhTrang,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PhieuDeXuatMuaHang) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      logoCongTy.hashCode ^
      chucVuNhanVien.hashCode ^
      maChucvu.hashCode ^
      maBophan.hashCode ^
      maCty.hashCode ^
      tenBoPhan.hashCode ^
      idDeXuatMh.hashCode ^
      idKeHoachCongViec.hashCode ^
      maCongTy.hashCode ^
      loaiPhieu.hashCode ^
      ngayDeXuat.hashCode ^
      nguoiDeXuat.hashCode ^
      lyDoDeXuat.hashCode ^
      barcode.hashCode ^
      nguoiTao.hashCode ^
      ngayTao.hashCode ^
      nguoiSua.hashCode ^
      ngaySua.hashCode ^
      isHuy.hashCode ^
      nguoiHuy.hashCode ^
      ngayHuy.hashCode ^
      isTrinhKy.hashCode ^
      ngayTrinhKy.hashCode ^
      nguoiTrinhKy.hashCode ^
      listTruongBp.hashCode ^
      isTruongBp.hashCode ^
      nguoiTruongBp.hashCode ^
      ngayTruongBp.hashCode ^
      ndTruongBp.hashCode ^
      listKeToan.hashCode ^
      isKeToan.hashCode ^
      nguoiKeToan.hashCode ^
      ngayKeToan.hashCode ^
      ndKeToan.hashCode ^
      listKsnb.hashCode ^
      isKsnb.hashCode ^
      nguoiKsnb.hashCode ^
      ngayKsnb.hashCode ^
      ndksnb.hashCode ^
      listTgd.hashCode ^
      isTgd.hashCode ^
      isKhongTgd.hashCode ^
      nguoiTgd.hashCode ^
      ngayTgd.hashCode ^
      ndtgd.hashCode ^
      isTatToan.hashCode ^
      soPhieuAuto.hashCode ^
      tenCty2.hashCode ^
      tenNhanvien.hashCode ^
      tinhTrang.hashCode;

  @override
  int getId() {
    return idDeXuatMh;
  }

  @override
  String getType() {
    return loaiPhieu;
  }
}
