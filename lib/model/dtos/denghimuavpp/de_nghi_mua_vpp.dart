import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class DeNghiMuaVpp extends IDocument {
  String logoCongTy;
  String? boPhanNhanVien;
  String? maChucvu;
  String? maBophan;
  int? soTienTuongUng;
  String? mucDichSuDung;
  int idDeNghi;
  String maCongTy;
  String loaiPhieu;
  String? nguoiDeNghi;
  String? lyDoDeNghi;
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
  String? listTruONgBp;
  bool? isTruONgBp;
  String? nguoiTruONgBp;
  DateTime? ngayTruONgBp;
  String? ndTruONgBp;
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
  String? listTgd;
  bool? isTgd;
  bool? isKhONgTgd;
  String? nguoiTgd;
  DateTime? ngayTgd;
  String? ndtgd;
  String? soPhieuAuto;
  String? noiDungTraVe;
  String? tenNguoiDeNghi;
  String? tenChucVuNguoiDeNghi;
  String? tenBoPhanNguoiDeNghi;
  DateTime? ngayDeNghi;
  String? tenCty2;
  int tinhTrang;
  String tinhTrangChu;

  DeNghiMuaVpp({
    this.logoCongTy = '',
    this.boPhanNhanVien,
    this.maChucvu,
    this.maBophan,
    this.soTienTuongUng,
    this.mucDichSuDung,
    this.idDeNghi = 0,
    this.maCongTy = '',
    this.loaiPhieu = '',
    this.nguoiDeNghi,
    this.lyDoDeNghi,
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
    this.listTruONgBp,
    this.isTruONgBp,
    this.nguoiTruONgBp,
    this.ngayTruONgBp,
    this.ndTruONgBp,
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
    this.listTgd,
    this.isTgd,
    this.isKhONgTgd,
    this.nguoiTgd,
    this.ngayTgd,
    this.ndtgd,
    this.soPhieuAuto,
    this.noiDungTraVe,
    this.tenNguoiDeNghi,
    this.tenChucVuNguoiDeNghi,
    this.tenBoPhanNguoiDeNghi,
    this.ngayDeNghi,
    this.tenCty2,
    this.tinhTrang = -1,
    this.tinhTrangChu = '',
  });

  @override
  String toString() {
    return 'DeNghiMuaVpp(logoCongTy: $logoCongTy, boPhanNhanVien: $boPhanNhanVien, maChucvu: $maChucvu, maBophan: $maBophan, soTienTuongUng: $soTienTuongUng, mucDichSuDung: $mucDichSuDung, idDeNghi: $idDeNghi, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, nguoiDeNghi: $nguoiDeNghi, lyDoDeNghi: $lyDoDeNghi, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, isHuy: $isHuy, nguoiHuy: $nguoiHuy, ngayHuy: $ngayHuy, isTrinhKy: $isTrinhKy, ngayTrinhKy: $ngayTrinhKy, nguoiTrinhKy: $nguoiTrinhKy, listTruONgBp: $listTruONgBp, isTruONgBp: $isTruONgBp, nguoiTruONgBp: $nguoiTruONgBp, ngayTruONgBp: $ngayTruONgBp, ndTruONgBp: $ndTruONgBp, listDaiDienCTy: $listDaiDienCTy, isDaiDienCTy: $isDaiDienCTy, nguoiDaiDienCTy: $nguoiDaiDienCTy, ngayDaiDienCTy: $ngayDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listKeToan: $listKeToan, isKeToan: $isKeToan, nguoiKeToan: $nguoiKeToan, ngayKeToan: $ngayKeToan, ndKeToan: $ndKeToan, listTgd: $listTgd, isTgd: $isTgd, isKhONgTgd: $isKhONgTgd, nguoiTgd: $nguoiTgd, ngayTgd: $ngayTgd, ndtgd: $ndtgd, soPhieuAuto: $soPhieuAuto, noiDungTraVe: $noiDungTraVe, tenNguoiDeNghi: $tenNguoiDeNghi, tenChucVuNguoiDeNghi: $tenChucVuNguoiDeNghi, tenBoPhanNguoiDeNghi: $tenBoPhanNguoiDeNghi, ngayDeNghi: $ngayDeNghi, tenCty2: $tenCty2, tinhTrang: $tinhTrang, tinhTrangChu: $tinhTrangChu)';
  }

  factory DeNghiMuaVpp.fromMap(Map<String, dynamic> data) => DeNghiMuaVpp(
        logoCongTy: data['logoCongTy'] ?? '',
        boPhanNhanVien: data['boPhanNhanVien'] as String?,
        maChucvu: data['ma_chucvu'] as String?,
        maBophan: data['ma_bophan'] as String?,
        soTienTuongUng: data['soTienTuongUng'] as int?,
        mucDichSuDung: data['mucDichSuDung'] as String?,
        idDeNghi: data['idDeNghi'] ?? 0,
        maCongTy: data['maCongTy'] ?? '',
        loaiPhieu: data['loaiPhieu'] ?? '',
        nguoiDeNghi: data['nguoiDeNghi'] as String?,
        lyDoDeNghi: data['lyDoDeNghi'] as String?,
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
        listTruONgBp: data['listTruONgBP'] as String?,
        isTruONgBp: data['isTruONgBP'] as bool?,
        nguoiTruONgBp: data['nguoiTruONgBP'] as String?,
        ngayTruONgBp: data['ngayTruONgBP'] == null
            ? null
            : DateTime.parse(data['ngayTruONgBP'] as String),
        ndTruONgBp: data['ndTruONgBP'] as String?,
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
        listTgd: data['listTGD'] as String?,
        isTgd: data['isTGD'] as bool?,
        isKhONgTgd: data['isKhONgTGD'] as bool?,
        nguoiTgd: data['nguoiTGD'] as String?,
        ngayTgd: data['ngayTGD'] == null
            ? null
            : DateTime.parse(data['ngayTGD'] as String),
        ndtgd: data['ndtgd'] as String?,
        soPhieuAuto: data['soPhieuAuto'] as String?,
        noiDungTraVe: data['noiDungTraVe'] as String?,
        tenNguoiDeNghi: data['tenNguoiDeNghi'] as String?,
        tenChucVuNguoiDeNghi: data['tenChucVuNguoiDeNghi'] as String?,
        tenBoPhanNguoiDeNghi: data['tenBoPhanNguoiDeNghi'] as String?,
        ngayDeNghi: data['ngayDeNghi'] == null
            ? null
            : DateTime.parse(data['ngayDeNghi'] as String),
        tenCty2: data['ten_cty2'] as String?,
        tinhTrang: data['tinhTrang'] ?? 0,
        tinhTrangChu: data['tinhTrangChu'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'boPhanNhanVien': boPhanNhanVien,
        'ma_chucvu': maChucvu,
        'ma_bophan': maBophan,
        'soTienTuongUng': soTienTuongUng,
        'mucDichSuDung': mucDichSuDung,
        'idDeNghi': idDeNghi,
        'maCongTy': maCongTy,
        'loaiPhieu': loaiPhieu,
        'nguoiDeNghi': nguoiDeNghi,
        'lyDoDeNghi': lyDoDeNghi,
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
        'listTruONgBP': listTruONgBp,
        'isTruONgBP': isTruONgBp,
        'nguoiTruONgBP': nguoiTruONgBp,
        'ngayTruONgBP': ngayTruONgBp?.toIso8601String(),
        'ndTruONgBP': ndTruONgBp,
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
        'listTGD': listTgd,
        'isTGD': isTgd,
        'isKhONgTGD': isKhONgTgd,
        'nguoiTGD': nguoiTgd,
        'ngayTGD': ngayTgd?.toIso8601String(),
        'ndtgd': ndtgd,
        'soPhieuAuto': soPhieuAuto,
        'noiDungTraVe': noiDungTraVe,
        'tenNguoiDeNghi': tenNguoiDeNghi,
        'tenChucVuNguoiDeNghi': tenChucVuNguoiDeNghi,
        'tenBoPhanNguoiDeNghi': tenBoPhanNguoiDeNghi,
        'ngayDeNghi': ngayDeNghi?.toIso8601String(),
        'ten_cty2': tenCty2,
        'tinhTrang': tinhTrang,
        'tinhTrangChu': tinhTrangChu,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeNghiMuaVpp].
  factory DeNghiMuaVpp.fromJson(String data) {
    return DeNghiMuaVpp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiMuaVpp] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiMuaVpp copyWith({
    String? logoCongTy,
    String? boPhanNhanVien,
    String? maChucvu,
    String? maBophan,
    int? soTienTuongUng,
    String? mucDichSuDung,
    int? idDeNghi,
    String? maCongTy,
    String? loaiPhieu,
    String? nguoiDeNghi,
    String? lyDoDeNghi,
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
    String? listTruONgBp,
    bool? isTruONgBp,
    String? nguoiTruONgBp,
    DateTime? ngayTruONgBp,
    String? ndTruONgBp,
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
    String? listTgd,
    bool? isTgd,
    bool? isKhONgTgd,
    String? nguoiTgd,
    DateTime? ngayTgd,
    String? ndtgd,
    String? soPhieuAuto,
    String? noiDungTraVe,
    String? tenNguoiDeNghi,
    String? tenChucVuNguoiDeNghi,
    String? tenBoPhanNguoiDeNghi,
    DateTime? ngayDeNghi,
    String? tenCty2,
    int? tinhTrang,
    String? tinhTrangChu,
  }) {
    return DeNghiMuaVpp(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      boPhanNhanVien: boPhanNhanVien ?? this.boPhanNhanVien,
      maChucvu: maChucvu ?? this.maChucvu,
      maBophan: maBophan ?? this.maBophan,
      soTienTuongUng: soTienTuongUng ?? this.soTienTuongUng,
      mucDichSuDung: mucDichSuDung ?? this.mucDichSuDung,
      idDeNghi: idDeNghi ?? this.idDeNghi,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiPhieu: loaiPhieu ?? this.loaiPhieu,
      nguoiDeNghi: nguoiDeNghi ?? this.nguoiDeNghi,
      lyDoDeNghi: lyDoDeNghi ?? this.lyDoDeNghi,
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
      listTruONgBp: listTruONgBp ?? this.listTruONgBp,
      isTruONgBp: isTruONgBp ?? this.isTruONgBp,
      nguoiTruONgBp: nguoiTruONgBp ?? this.nguoiTruONgBp,
      ngayTruONgBp: ngayTruONgBp ?? this.ngayTruONgBp,
      ndTruONgBp: ndTruONgBp ?? this.ndTruONgBp,
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
      listTgd: listTgd ?? this.listTgd,
      isTgd: isTgd ?? this.isTgd,
      isKhONgTgd: isKhONgTgd ?? this.isKhONgTgd,
      nguoiTgd: nguoiTgd ?? this.nguoiTgd,
      ngayTgd: ngayTgd ?? this.ngayTgd,
      ndtgd: ndtgd ?? this.ndtgd,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      noiDungTraVe: noiDungTraVe ?? this.noiDungTraVe,
      tenNguoiDeNghi: tenNguoiDeNghi ?? this.tenNguoiDeNghi,
      tenChucVuNguoiDeNghi: tenChucVuNguoiDeNghi ?? this.tenChucVuNguoiDeNghi,
      tenBoPhanNguoiDeNghi: tenBoPhanNguoiDeNghi ?? this.tenBoPhanNguoiDeNghi,
      ngayDeNghi: ngayDeNghi ?? this.ngayDeNghi,
      tenCty2: tenCty2 ?? this.tenCty2,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      tinhTrangChu: tinhTrangChu ?? this.tinhTrangChu,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeNghiMuaVpp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      logoCongTy.hashCode ^
      boPhanNhanVien.hashCode ^
      maChucvu.hashCode ^
      maBophan.hashCode ^
      soTienTuongUng.hashCode ^
      mucDichSuDung.hashCode ^
      idDeNghi.hashCode ^
      maCongTy.hashCode ^
      loaiPhieu.hashCode ^
      nguoiDeNghi.hashCode ^
      lyDoDeNghi.hashCode ^
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
      listTruONgBp.hashCode ^
      isTruONgBp.hashCode ^
      nguoiTruONgBp.hashCode ^
      ngayTruONgBp.hashCode ^
      ndTruONgBp.hashCode ^
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
      listTgd.hashCode ^
      isTgd.hashCode ^
      isKhONgTgd.hashCode ^
      nguoiTgd.hashCode ^
      ngayTgd.hashCode ^
      ndtgd.hashCode ^
      soPhieuAuto.hashCode ^
      noiDungTraVe.hashCode ^
      tenNguoiDeNghi.hashCode ^
      tenChucVuNguoiDeNghi.hashCode ^
      tenBoPhanNguoiDeNghi.hashCode ^
      ngayDeNghi.hashCode ^
      tenCty2.hashCode ^
      tinhTrang.hashCode ^
      tinhTrangChu.hashCode;
  @override
  int getId() {
    return idDeNghi;
  }

  @override
  String getType() {
    return loaiPhieu;
  }
}
