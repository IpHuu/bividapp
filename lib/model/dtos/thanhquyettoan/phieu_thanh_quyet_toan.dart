import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class PhieuThanhQuyetToan extends IDocument {
  int idThanhQuyetToan;
  String? tenHinhThucTt;
  String logoCongTy;
  String? chucVuNhanVien;
  String? maChucvu;
  String? maBophan;
  String? maCty;
  String? tenBoPhan;
  String maCongTy;
  String? loaiPhieu;
  String? nguoiQuyetToan;
  int? hinhThucTt;
  String? soTk;
  String? nguoiHuongThu;
  String? nganHang;
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
  String? listDaiDienCTy;
  bool? isDaiDienCTy;
  String? nguoiDaiDienCTy;
  DateTime? ngayDaiDienCTy;
  String? ndDaiDienCTy;
  String? listKeToan;
  bool? isKeToan;
  String? nguoiKeToan;
  DateTime? ngayKeToan;
  String? ndKeToan;
  String? listKeToanPho;
  bool? isKeToanPho;
  String? nguoiKeToanPho;
  DateTime? ngayKeToanPho;
  String? ndKeToanPho;
  String? listKeToanTruong;
  bool? isKeToanTruong;
  String? nguoiKeToanTruong;
  DateTime? ngayKeToanTruong;
  String? ndKeToanTruong;
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
  int? thuThem;
  int? chiThem;
  String? tenCty2;
  String? tenNhanvien;
  int tinhTrang;
  String tinhTrangChu;
  String? listKtnb;
  bool? isKtnb;
  String? nguoiKtnb;
  DateTime? ngayKtnb;
  String? ndktnb;
  String? noiDungtqt;
  String? tenTcty;
  bool hasConvertError = false;

  PhieuThanhQuyetToan({
    this.tenHinhThucTt = '',
    this.logoCongTy = '',
    this.chucVuNhanVien,
    this.maChucvu,
    this.maBophan,
    this.maCty,
    this.tenBoPhan = '',
    this.idThanhQuyetToan = 0,
    this.maCongTy = '',
    this.loaiPhieu,
    this.nguoiQuyetToan,
    this.hinhThucTt,
    this.soTk,
    this.nguoiHuongThu,
    this.nganHang,
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
    this.listDaiDienCTy,
    this.isDaiDienCTy,
    this.nguoiDaiDienCTy,
    this.ngayDaiDienCTy,
    this.ndDaiDienCTy,
    this.listKeToan,
    this.isKeToan,
    this.nguoiKeToan,
    this.ngayKeToan,
    this.ndKeToan,
    this.listKeToanPho,
    this.isKeToanPho,
    this.nguoiKeToanPho,
    this.ngayKeToanPho,
    this.ndKeToanPho,
    this.listKeToanTruong,
    this.isKeToanTruong,
    this.nguoiKeToanTruong,
    this.ngayKeToanTruong,
    this.ndKeToanTruong,
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
    this.thuThem,
    this.chiThem,
    this.tenCty2,
    this.tenNhanvien,
    this.tinhTrang = 0,
    this.tinhTrangChu = '',
    this.listKtnb,
    this.isKtnb,
    this.nguoiKtnb,
    this.ngayKtnb,
    this.ndktnb,
    this.noiDungtqt,
    this.tenTcty,
  });

  @override
  String toString() {
    return 'PhieuThanhQuyetToan(tenHinhThucTt: $tenHinhThucTt, logoCongTy: $logoCongTy, chucVuNhanVien: $chucVuNhanVien, maChucvu: $maChucvu, maBophan: $maBophan, maCty: $maCty, tenBoPhan: $tenBoPhan, idThanhQuyetToan: $idThanhQuyetToan, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, nguoiQuyetToan: $nguoiQuyetToan, hinhThucTt: $hinhThucTt, soTk: $soTk, nguoiHuongThu: $nguoiHuongThu, nganHang: $nganHang, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, isHuy: $isHuy, nguoiHuy: $nguoiHuy, ngayHuy: $ngayHuy, isTrinhKy: $isTrinhKy, ngayTrinhKy: $ngayTrinhKy, nguoiTrinhKy: $nguoiTrinhKy, listTruongBp: $listTruongBp, isTruongBp: $isTruongBp, nguoiTruongBp: $nguoiTruongBp, ngayTruongBp: $ngayTruongBp, ndTruongBp: $ndTruongBp, listDaiDienCTy: $listDaiDienCTy, isDaiDienCTy: $isDaiDienCTy, nguoiDaiDienCTy: $nguoiDaiDienCTy, ngayDaiDienCTy: $ngayDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listKeToan: $listKeToan, isKeToan: $isKeToan, nguoiKeToan: $nguoiKeToan, ngayKeToan: $ngayKeToan, ndKeToan: $ndKeToan, listKeToanPho: $listKeToanPho, isKeToanPho: $isKeToanPho, nguoiKeToanPho: $nguoiKeToanPho, ngayKeToanPho: $ngayKeToanPho, ndKeToanPho: $ndKeToanPho, listKeToanTruong: $listKeToanTruong, isKeToanTruong: $isKeToanTruong, nguoiKeToanTruong: $nguoiKeToanTruong, ngayKeToanTruong: $ngayKeToanTruong, ndKeToanTruong: $ndKeToanTruong, listKsnb: $listKsnb, isKsnb: $isKsnb, nguoiKsnb: $nguoiKsnb, ngayKsnb: $ngayKsnb, ndksnb: $ndksnb, listTgd: $listTgd, isTgd: $isTgd, isKhongTgd: $isKhongTgd, nguoiTgd: $nguoiTgd, ngayTgd: $ngayTgd, ndtgd: $ndtgd, isTatToan: $isTatToan, soPhieuAuto: $soPhieuAuto, thuThem: $thuThem, chiThem: $chiThem, tenCty2: $tenCty2, tenNhanvien: $tenNhanvien, tinhTrang: $tinhTrang, tinhTrangChu: $tinhTrangChu, listKtnb: $listKtnb, isKtnb: $isKtnb, nguoiKtnb: $nguoiKtnb, ngayKtnb: $ngayKtnb, ndktnb: $ndktnb, noiDungtqt: $noiDungtqt, tenTcty: $tenTcty)';
  }

  factory PhieuThanhQuyetToan.fromMap(Map<String, dynamic> data) {
    try {
      return PhieuThanhQuyetToan(
        tenHinhThucTt: data['tenHinhThucTT'] as String?,
        logoCongTy: data['logoCongTy'] ?? '',
        chucVuNhanVien: data['chucVuNhanVien'] as String?,
        maChucvu: data['ma_chucvu'] as String?,
        maBophan: data['ma_bophan'] as String?,
        maCty: data['ma_cty'] as String?,
        tenBoPhan: data['tenBoPhan'] as String?,
        idThanhQuyetToan: data['idThanhQuyetToan'] ?? 0,
        maCongTy: data['maCongTy'] ?? '',
        loaiPhieu: data['loaiPhieu'] as String?,
        nguoiQuyetToan: data['nguoiQuyetToan'] as String?,
        hinhThucTt: data['hinhThucTT'] as int?,
        soTk: data['soTK'] as String?,
        nguoiHuongThu: data['nguoiHuongThu'] as String?,
        nganHang: data['nganHang'] as String?,
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
        listDaiDienCTy: data['listDaiDienCTy'] as String?,
        isDaiDienCTy: data['isDaiDienCTy'] as bool?,
        nguoiDaiDienCTy: data['nguoiDaiDienCTy'] as String?,
        ngayDaiDienCTy: data['ngayDaiDienCTy'] == null
            ? null
            : DateTime.parse(data['ngayDaiDienCTy'] as String),
        ndDaiDienCTy: data['ndDaiDienCTy'] as String?,
        listKeToan: data['listKeToan'] as String?,
        isKeToan: data['isKeToan'] as bool?,
        nguoiKeToan: data['nguoiKeToan'] as String?,
        ngayKeToan: data['ngayKeToan'] == null
            ? null
            : DateTime.parse(data['ngayKeToan'] as String),
        ndKeToan: data['ndKeToan'] as String?,
        listKeToanPho: data['listKeToanPho'] as String?,
        isKeToanPho: data['isKeToanPho'] as bool?,
        nguoiKeToanPho: data['nguoiKeToanPho'] as String?,
        ngayKeToanPho: data['ngayKeToanPho'] == null
            ? null
            : DateTime.parse(data['ngayKeToanPho'] as String),
        ndKeToanPho: data['ndKeToanPho'] as String?,
        listKeToanTruong: data['listKeToanTruong'] as String?,
        isKeToanTruong: data['isKeToanTruong'] as bool?,
        nguoiKeToanTruong: data['nguoiKeToanTruong'] as String?,
        ngayKeToanTruong: data['ngayKeToanTruong'] == null
            ? null
            : DateTime.parse(data['ngayKeToanTruong'] as String),
        ndKeToanTruong: data['ndKeToanTruong'] as String?,
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
        isTatToan: data['isTatToan'] ?? false,
        soPhieuAuto: data['soPhieuAuto'] as String?,
        thuThem: data['thuThem'] as int?,
        chiThem: data['chiThem'] as int?,
        tenCty2: data['ten_cty2'] as String?,
        tenNhanvien: data['ten_nhanvien'] as String?,
        tinhTrang: data['tinhTrang'] ?? 0,
        tinhTrangChu: data['tinhTrangChu'] ?? '',
        listKtnb: data['listKTNB'] as String?,
        isKtnb: data['isKTNB'] as bool?,
        nguoiKtnb: data['nguoiKTNB'] as String?,
        ngayKtnb: data['ngayKTNB'] == null
            ? null
            : DateTime.parse(data['ngayKTNB'] as String),
        ndktnb: data['ndktnb'] as String?,
        noiDungtqt: data['noi_dungtqt'] as String?,
        tenTcty: data['ten_tcty'] as String?,
      );
    } on Exception catch (_) {
      late PhieuThanhQuyetToan tempRow = PhieuThanhQuyetToan();
      tempRow.idThanhQuyetToan = -1;
      tempRow.hasConvertError = true;
      return tempRow;
    }
  }

  Map<String, dynamic> toMap() => {
        'tenHinhThucTT': tenHinhThucTt,
        'logoCongTy': logoCongTy,
        'chucVuNhanVien': chucVuNhanVien,
        'ma_chucvu': maChucvu,
        'ma_bophan': maBophan,
        'ma_cty': maCty,
        'tenBoPhan': tenBoPhan,
        'idThanhQuyetToan': idThanhQuyetToan,
        'maCongTy': maCongTy,
        'loaiPhieu': loaiPhieu,
        'nguoiQuyetToan': nguoiQuyetToan,
        'hinhThucTT': hinhThucTt,
        'soTK': soTk,
        'nguoiHuongThu': nguoiHuongThu,
        'nganHang': nganHang,
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
        'listDaiDienCTy': listDaiDienCTy,
        'isDaiDienCTy': isDaiDienCTy,
        'nguoiDaiDienCTy': nguoiDaiDienCTy,
        'ngayDaiDienCTy': ngayDaiDienCTy?.toIso8601String(),
        'ndDaiDienCTy': ndDaiDienCTy,
        'listKeToan': listKeToan,
        'isKeToan': isKeToan,
        'nguoiKeToan': nguoiKeToan,
        'ngayKeToan': ngayKeToan?.toIso8601String(),
        'ndKeToan': ndKeToan,
        'listKeToanPho': listKeToanPho,
        'isKeToanPho': isKeToanPho,
        'nguoiKeToanPho': nguoiKeToanPho,
        'ngayKeToanPho': ngayKeToanPho?.toIso8601String(),
        'ndKeToanPho': ndKeToanPho,
        'listKeToanTruong': listKeToanTruong,
        'isKeToanTruong': isKeToanTruong,
        'nguoiKeToanTruong': nguoiKeToanTruong,
        'ngayKeToanTruong': ngayKeToanTruong?.toIso8601String(),
        'ndKeToanTruong': ndKeToanTruong,
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
        'thuThem': thuThem,
        'chiThem': chiThem,
        'ten_cty2': tenCty2,
        'ten_nhanvien': tenNhanvien,
        'tinhTrang': tinhTrang,
        'tinhTrangChu': tinhTrangChu,
        'listKTNB': listKtnb,
        'isKTNB': isKtnb,
        'nguoiKTNB': nguoiKtnb,
        'ngayKTNB': ngayKtnb?.toIso8601String(),
        'ndktnb': ndktnb,
        'noi_dungtqt': noiDungtqt,
        'ten_tcty': tenTcty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PhieuThanhQuyetToan].
  factory PhieuThanhQuyetToan.fromJson(String data) {
    return PhieuThanhQuyetToan.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PhieuThanhQuyetToan] to a JSON string.
  String toJson() => json.encode(toMap());

  PhieuThanhQuyetToan copyWith({
    String? tenHinhThucTt,
    String? logoCongTy,
    String? chucVuNhanVien,
    String? maChucvu,
    String? maBophan,
    String? maCty,
    String? tenBoPhan,
    int? idThanhQuyetToan,
    String? maCongTy,
    String? loaiPhieu,
    String? nguoiQuyetToan,
    int? hinhThucTt,
    String? soTk,
    String? nguoiHuongThu,
    String? nganHang,
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
    String? listDaiDienCTy,
    bool? isDaiDienCTy,
    String? nguoiDaiDienCTy,
    DateTime? ngayDaiDienCTy,
    String? ndDaiDienCTy,
    String? listKeToan,
    bool? isKeToan,
    String? nguoiKeToan,
    DateTime? ngayKeToan,
    String? ndKeToan,
    String? listKeToanPho,
    bool? isKeToanPho,
    String? nguoiKeToanPho,
    DateTime? ngayKeToanPho,
    String? ndKeToanPho,
    String? listKeToanTruong,
    bool? isKeToanTruong,
    String? nguoiKeToanTruong,
    DateTime? ngayKeToanTruong,
    String? ndKeToanTruong,
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
    int? thuThem,
    int? chiThem,
    String? tenCty2,
    String? tenNhanvien,
    int? tinhTrang,
    String? tinhTrangChu,
    String? listKtnb,
    bool? isKtnb,
    String? nguoiKtnb,
    DateTime? ngayKtnb,
    String? ndktnb,
    String? noiDungtqt,
    String? tenTcty,
  }) {
    return PhieuThanhQuyetToan(
      tenHinhThucTt: tenHinhThucTt ?? this.tenHinhThucTt,
      logoCongTy: logoCongTy ?? this.logoCongTy,
      chucVuNhanVien: chucVuNhanVien ?? this.chucVuNhanVien,
      maChucvu: maChucvu ?? this.maChucvu,
      maBophan: maBophan ?? this.maBophan,
      maCty: maCty ?? this.maCty,
      tenBoPhan: tenBoPhan ?? this.tenBoPhan,
      idThanhQuyetToan: idThanhQuyetToan ?? this.idThanhQuyetToan,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiPhieu: loaiPhieu ?? this.loaiPhieu,
      nguoiQuyetToan: nguoiQuyetToan ?? this.nguoiQuyetToan,
      hinhThucTt: hinhThucTt ?? this.hinhThucTt,
      soTk: soTk ?? this.soTk,
      nguoiHuongThu: nguoiHuongThu ?? this.nguoiHuongThu,
      nganHang: nganHang ?? this.nganHang,
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
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      isDaiDienCTy: isDaiDienCTy ?? this.isDaiDienCTy,
      nguoiDaiDienCTy: nguoiDaiDienCTy ?? this.nguoiDaiDienCTy,
      ngayDaiDienCTy: ngayDaiDienCTy ?? this.ngayDaiDienCTy,
      ndDaiDienCTy: ndDaiDienCTy ?? this.ndDaiDienCTy,
      listKeToan: listKeToan ?? this.listKeToan,
      isKeToan: isKeToan ?? this.isKeToan,
      nguoiKeToan: nguoiKeToan ?? this.nguoiKeToan,
      ngayKeToan: ngayKeToan ?? this.ngayKeToan,
      ndKeToan: ndKeToan ?? this.ndKeToan,
      listKeToanPho: listKeToanPho ?? this.listKeToanPho,
      isKeToanPho: isKeToanPho ?? this.isKeToanPho,
      nguoiKeToanPho: nguoiKeToanPho ?? this.nguoiKeToanPho,
      ngayKeToanPho: ngayKeToanPho ?? this.ngayKeToanPho,
      ndKeToanPho: ndKeToanPho ?? this.ndKeToanPho,
      listKeToanTruong: listKeToanTruong ?? this.listKeToanTruong,
      isKeToanTruong: isKeToanTruong ?? this.isKeToanTruong,
      nguoiKeToanTruong: nguoiKeToanTruong ?? this.nguoiKeToanTruong,
      ngayKeToanTruong: ngayKeToanTruong ?? this.ngayKeToanTruong,
      ndKeToanTruong: ndKeToanTruong ?? this.ndKeToanTruong,
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
      thuThem: thuThem ?? this.thuThem,
      chiThem: chiThem ?? this.chiThem,
      tenCty2: tenCty2 ?? this.tenCty2,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      tinhTrangChu: tinhTrangChu ?? this.tinhTrangChu,
      listKtnb: listKtnb ?? this.listKtnb,
      isKtnb: isKtnb ?? this.isKtnb,
      nguoiKtnb: nguoiKtnb ?? this.nguoiKtnb,
      ngayKtnb: ngayKtnb ?? this.ngayKtnb,
      ndktnb: ndktnb ?? this.ndktnb,
      noiDungtqt: noiDungtqt ?? this.noiDungtqt,
      tenTcty: tenTcty ?? this.tenTcty,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PhieuThanhQuyetToan) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      tenHinhThucTt.hashCode ^
      logoCongTy.hashCode ^
      chucVuNhanVien.hashCode ^
      maChucvu.hashCode ^
      maBophan.hashCode ^
      maCty.hashCode ^
      tenBoPhan.hashCode ^
      idThanhQuyetToan.hashCode ^
      maCongTy.hashCode ^
      loaiPhieu.hashCode ^
      nguoiQuyetToan.hashCode ^
      hinhThucTt.hashCode ^
      soTk.hashCode ^
      nguoiHuongThu.hashCode ^
      nganHang.hashCode ^
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
      listDaiDienCTy.hashCode ^
      isDaiDienCTy.hashCode ^
      nguoiDaiDienCTy.hashCode ^
      ngayDaiDienCTy.hashCode ^
      ndDaiDienCTy.hashCode ^
      listKeToan.hashCode ^
      isKeToan.hashCode ^
      nguoiKeToan.hashCode ^
      ngayKeToan.hashCode ^
      ndKeToan.hashCode ^
      listKeToanPho.hashCode ^
      isKeToanPho.hashCode ^
      nguoiKeToanPho.hashCode ^
      ngayKeToanPho.hashCode ^
      ndKeToanPho.hashCode ^
      listKeToanTruong.hashCode ^
      isKeToanTruong.hashCode ^
      nguoiKeToanTruong.hashCode ^
      ngayKeToanTruong.hashCode ^
      ndKeToanTruong.hashCode ^
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
      thuThem.hashCode ^
      chiThem.hashCode ^
      tenCty2.hashCode ^
      tenNhanvien.hashCode ^
      tinhTrang.hashCode ^
      tinhTrangChu.hashCode ^
      listKtnb.hashCode ^
      isKtnb.hashCode ^
      nguoiKtnb.hashCode ^
      ngayKtnb.hashCode ^
      ndktnb.hashCode ^
      noiDungtqt.hashCode ^
      tenTcty.hashCode;

  @override
  int getId() {
    return idThanhQuyetToan;
  }

  @override
  String getType() {
    return 'TQTOAN';
  }
}
