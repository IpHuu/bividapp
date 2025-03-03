import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class LenhCongTac extends IDocument {
  String logoCongTy;
  String? nguoiNhanBg;
  String? nguoiTruongBp;
  String? nguoiDaiDienCTy;
  String? nguoiTgd;
  String? nguoiTrinhKy;
  String? maCty;
  String? maBophan;
  String? maChucvu;
  String? tenBoPhan;
  String? chucVuNhanVien;
  String tinhTrangChu;
  int idGiayXinPhep;
  String maCongTy;
  String loaiPhieu;
  DateTime? ngayLamDon;
  String? guiNguoi;
  String? nguoiLamDon;
  double? tongThoiGian;
  String? nguoiNhanBanGiao;
  String? barcode;
  String? nguoiTao;
  DateTime? ngayTao;
  String? nguoiSua;
  DateTime? ngaySua;
  DateTime? ngayTrinhKy;
  String? listNhanBg;
  String? ndNhanBg;
  String? listTruongBp;
  String? ndTruongBp;
  String? listDaiDienCTy;
  String? ndDaiDienCTy;
  String? listTgd;
  String? ndtgd;
  String? soPhieuAuto;
  String? tenCty2;
  String? nguoiKhac;
  String? idCamKetUngPhep;
  String? tenNguoiLamDon;
  String? tenChucvu;
  String? tenBophan;
  String? noiDungTraVe;
  DateTime? tuNgay;
  DateTime? denNgay;
  bool? isCongTacTheoDoan;
  String? diCongTacTai;
  String? ngoaiTe;
  int? hinhThucNghi;
  String? hinhThucKhac;
  String lyDo;
  int tinhTrang;

  LenhCongTac({
    this.logoCongTy = '',
    this.nguoiNhanBg,
    this.nguoiTruongBp,
    this.nguoiDaiDienCTy,
    this.nguoiTgd,
    this.nguoiTrinhKy,
    this.maCty,
    this.maBophan,
    this.maChucvu,
    this.tenBoPhan,
    this.chucVuNhanVien,
    this.tinhTrangChu = '',
    this.idGiayXinPhep = 0,
    this.maCongTy = '',
    this.loaiPhieu = '',
    this.ngayLamDon,
    this.guiNguoi,
    this.nguoiLamDon,
    this.tongThoiGian,
    this.nguoiNhanBanGiao,
    this.barcode,
    this.nguoiTao,
    this.ngayTao,
    this.nguoiSua,
    this.ngaySua,
    this.ngayTrinhKy,
    this.listNhanBg,
    this.ndNhanBg,
    this.listTruongBp,
    this.ndTruongBp,
    this.listDaiDienCTy,
    this.ndDaiDienCTy,
    this.listTgd,
    this.ndtgd,
    this.soPhieuAuto,
    this.tenCty2,
    this.nguoiKhac,
    this.idCamKetUngPhep,
    this.tenNguoiLamDon,
    this.tenChucvu,
    this.tenBophan,
    this.noiDungTraVe,
    this.tuNgay,
    this.denNgay,
    this.isCongTacTheoDoan,
    this.diCongTacTai,
    this.ngoaiTe,
    this.hinhThucNghi,
    this.hinhThucKhac,
    this.lyDo = '',
    this.tinhTrang = 0,
  });

  @override
  String toString() {
    return 'LenhCongTac(logoCongTy: $logoCongTy, nguoiNhanBg: $nguoiNhanBg, nguoiTruongBp: $nguoiTruongBp, nguoiDaiDienCTy: $nguoiDaiDienCTy, nguoiTgd: $nguoiTgd, nguoiTrinhKy: $nguoiTrinhKy, maCty: $maCty, maBophan: $maBophan, maChucvu: $maChucvu, tenBoPhan: $tenBoPhan, chucVuNhanVien: $chucVuNhanVien, tinhTrangChu: $tinhTrangChu, idGiayXinPhep: $idGiayXinPhep, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, ngayLamDon: $ngayLamDon, guiNguoi: $guiNguoi, nguoiLamDon: $nguoiLamDon, tongThoiGian: $tongThoiGian, nguoiNhanBanGiao: $nguoiNhanBanGiao, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, ngayTrinhKy: $ngayTrinhKy, listNhanBg: $listNhanBg, ndNhanBg: $ndNhanBg, listTruongBp: $listTruongBp, ndTruongBp: $ndTruongBp, listDaiDienCTy: $listDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listTgd: $listTgd, ndtgd: $ndtgd, soPhieuAuto: $soPhieuAuto, tenCty2: $tenCty2, nguoiKhac: $nguoiKhac, idCamKetUngPhep: $idCamKetUngPhep, tenNguoiLamDon: $tenNguoiLamDon, tenChucvu: $tenChucvu, tenBophan: $tenBophan, noiDungTraVe: $noiDungTraVe, tuNgay: $tuNgay, denNgay: $denNgay, isCongTacTheoDoan: $isCongTacTheoDoan, diCongTacTai: $diCongTacTai, ngoaiTe: $ngoaiTe, hinhThucNghi: $hinhThucNghi, hinhThucKhac: $hinhThucKhac, lyDo: $lyDo, tinhTrang: $tinhTrang)';
  }

  factory LenhCongTac.fromMap(Map<String, dynamic> data) => LenhCongTac(
        logoCongTy: data['logoCongTy'] ?? '',
        nguoiNhanBg: data['nguoiNhanBG'] as String?,
        nguoiTruongBp: data['nguoiTruongBP'] as String?,
        nguoiDaiDienCTy: data['nguoiDaiDienCTy'] as String?,
        nguoiTgd: data['nguoiTGD'] as String?,
        nguoiTrinhKy: data['nguoiTrinhKy'] as String?,
        maCty: data['ma_cty'] as String?,
        maBophan: data['ma_bophan'] as String?,
        maChucvu: data['ma_chucvu'] as String?,
        tenBoPhan: data['tenBoPhan'] as String?,
        chucVuNhanVien: data['chucVuNhanVien'] as String?,
        tinhTrangChu: data['tinhTrangChu'] ?? '',
        idGiayXinPhep: data['idGiayXinPhep'] ?? 0,
        maCongTy: data['maCongTy'] ?? '',
        loaiPhieu: data['loaiPhieu'] ?? '',
        ngayLamDon: data['ngayLamDon'] == null
            ? null
            : DateTime.parse(data['ngayLamDon'] as String),
        guiNguoi: data['guiNguoi'] as String?,
        nguoiLamDon: data['nguoiLamDon'] as String?,
        tongThoiGian: data['tongThoiGian'] != null
            ? double.parse(data['tongThoiGian'].toString())
            : 0,
        nguoiNhanBanGiao: data['nguoiNhanBanGiao'] as String?,
        barcode: data['barcode'] as String?,
        nguoiTao: data['nguoiTao'] as String?,
        ngayTao: data['ngayTao'] == null
            ? null
            : DateTime.parse(data['ngayTao'] as String),
        nguoiSua: data['nguoiSua'] as String?,
        ngaySua: data['ngaySua'] == null
            ? null
            : DateTime.parse(data['ngaySua'] as String),
        ngayTrinhKy: data['ngayTrinhKy'] == null
            ? null
            : DateTime.parse(data['ngayTrinhKy'] as String),
        listNhanBg: data['listNhanBG'] as String?,
        ndNhanBg: data['ndNhanBG'] as String?,
        listTruongBp: data['listTruongBP'] as String?,
        ndTruongBp: data['ndTruongBP'] as String?,
        listDaiDienCTy: data['listDaiDienCTy'] as String?,
        ndDaiDienCTy: data['ndDaiDienCTy'] as String?,
        listTgd: data['listTGD'] as String?,
        ndtgd: data['ndtgd'] as String?,
        soPhieuAuto: data['soPhieuAuto'] as String?,
        tenCty2: data['ten_cty2'] as String?,
        nguoiKhac: data['nguoiKhac'] as String?,
        idCamKetUngPhep: data['idCamKetUngPhep'] as String?,
        tenNguoiLamDon: data['tenNguoiLamDon'] as String?,
        tenChucvu: data['ten_chucvu'] as String?,
        tenBophan: data['ten_bophan'] as String?,
        noiDungTraVe: data['noiDungTraVe'] as String?,
        tuNgay: data['tuNgay'] == null
            ? null
            : DateTime.parse(data['tuNgay'] as String),
        denNgay: data['denNgay'] == null
            ? null
            : DateTime.parse(data['denNgay'] as String),
        isCongTacTheoDoan: data['isCongTacTheoDoan'] as bool?,
        diCongTacTai: data['diCongTacTai'] as String?,
        ngoaiTe: data['ngoaiTe'] as String?,
        hinhThucNghi: data['hinhThucNghi'] as int?,
        hinhThucKhac: data['hinhThucKhac'] as String?,
        lyDo: data['lyDo'] ?? '',
        tinhTrang: data['tinhTrang'] ?? -1,
      );

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'nguoiNhanBG': nguoiNhanBg,
        'nguoiTruongBP': nguoiTruongBp,
        'nguoiDaiDienCTy': nguoiDaiDienCTy,
        'nguoiTGD': nguoiTgd,
        'nguoiTrinhKy': nguoiTrinhKy,
        'ma_cty': maCty,
        'ma_bophan': maBophan,
        'ma_chucvu': maChucvu,
        'tenBoPhan': tenBoPhan,
        'chucVuNhanVien': chucVuNhanVien,
        'tinhTrangChu': tinhTrangChu,
        'idGiayXinPhep': idGiayXinPhep,
        'maCongTy': maCongTy,
        'loaiPhieu': loaiPhieu,
        'ngayLamDon': ngayLamDon?.toIso8601String(),
        'guiNguoi': guiNguoi,
        'nguoiLamDon': nguoiLamDon,
        'tongThoiGian': tongThoiGian,
        'nguoiNhanBanGiao': nguoiNhanBanGiao,
        'barcode': barcode,
        'nguoiTao': nguoiTao,
        'ngayTao': ngayTao?.toIso8601String(),
        'nguoiSua': nguoiSua,
        'ngaySua': ngaySua?.toIso8601String(),
        'ngayTrinhKy': ngayTrinhKy?.toIso8601String(),
        'listNhanBG': listNhanBg,
        'ndNhanBG': ndNhanBg,
        'listTruongBP': listTruongBp,
        'ndTruongBP': ndTruongBp,
        'listDaiDienCTy': listDaiDienCTy,
        'ndDaiDienCTy': ndDaiDienCTy,
        'listTGD': listTgd,
        'ndtgd': ndtgd,
        'soPhieuAuto': soPhieuAuto,
        'ten_cty2': tenCty2,
        'nguoiKhac': nguoiKhac,
        'idCamKetUngPhep': idCamKetUngPhep,
        'tenNguoiLamDon': tenNguoiLamDon,
        'ten_chucvu': tenChucvu,
        'ten_bophan': tenBophan,
        'noiDungTraVe': noiDungTraVe,
        'tuNgay': tuNgay,
        'denNgay': denNgay,
        'isCongTacTheoDoan': isCongTacTheoDoan,
        'diCongTacTai': diCongTacTai,
        'ngoaiTe': ngoaiTe,
        'hinhThucNghi': hinhThucNghi,
        'hinhThucKhac': hinhThucKhac,
        'lyDo': lyDo,
        'tinhTrang': tinhTrang,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LenhCongTac].
  factory LenhCongTac.fromJson(String data) {
    return LenhCongTac.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LenhCongTac] to a JSON string.
  String toJson() => json.encode(toMap());

  LenhCongTac copyWith({
    String? logoCongTy,
    String? nguoiNhanBg,
    String? nguoiTruongBp,
    String? nguoiDaiDienCTy,
    String? nguoiTgd,
    String? nguoiTrinhKy,
    String? maCty,
    String? maBophan,
    String? maChucvu,
    String? tenBoPhan,
    String? chucVuNhanVien,
    String? tinhTrangChu,
    int? idGiayXinPhep,
    String? maCongTy,
    String? loaiPhieu,
    DateTime? ngayLamDon,
    String? guiNguoi,
    String? nguoiLamDon,
    double? tongThoiGian,
    String? nguoiNhanBanGiao,
    String? barcode,
    String? nguoiTao,
    DateTime? ngayTao,
    String? nguoiSua,
    DateTime? ngaySua,
    DateTime? ngayTrinhKy,
    String? listNhanBg,
    String? ndNhanBg,
    String? listTruongBp,
    String? ndTruongBp,
    String? listDaiDienCTy,
    String? ndDaiDienCTy,
    String? listTgd,
    String? ndtgd,
    String? soPhieuAuto,
    String? tenCty2,
    String? nguoiKhac,
    String? idCamKetUngPhep,
    String? tenNguoiLamDon,
    String? tenChucvu,
    String? tenBophan,
    String? noiDungTraVe,
    DateTime? tuNgay,
    DateTime? denNgay,
    bool? isCongTacTheoDoan,
    String? diCongTacTai,
    String? ngoaiTe,
    int? hinhThucNghi,
    String? hinhThucKhac,
    String? lyDo,
    int? tinhTrang,
  }) {
    return LenhCongTac(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      nguoiNhanBg: nguoiNhanBg ?? this.nguoiNhanBg,
      nguoiTruongBp: nguoiTruongBp ?? this.nguoiTruongBp,
      nguoiDaiDienCTy: nguoiDaiDienCTy ?? this.nguoiDaiDienCTy,
      nguoiTgd: nguoiTgd ?? this.nguoiTgd,
      nguoiTrinhKy: nguoiTrinhKy ?? this.nguoiTrinhKy,
      maCty: maCty ?? this.maCty,
      maBophan: maBophan ?? this.maBophan,
      maChucvu: maChucvu ?? this.maChucvu,
      tenBoPhan: tenBoPhan ?? this.tenBoPhan,
      chucVuNhanVien: chucVuNhanVien ?? this.chucVuNhanVien,
      tinhTrangChu: tinhTrangChu ?? this.tinhTrangChu,
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiPhieu: loaiPhieu ?? this.loaiPhieu,
      ngayLamDon: ngayLamDon ?? this.ngayLamDon,
      guiNguoi: guiNguoi ?? this.guiNguoi,
      nguoiLamDon: nguoiLamDon ?? this.nguoiLamDon,
      tongThoiGian: tongThoiGian ?? this.tongThoiGian,
      nguoiNhanBanGiao: nguoiNhanBanGiao ?? this.nguoiNhanBanGiao,
      barcode: barcode ?? this.barcode,
      nguoiTao: nguoiTao ?? this.nguoiTao,
      ngayTao: ngayTao ?? this.ngayTao,
      nguoiSua: nguoiSua ?? this.nguoiSua,
      ngaySua: ngaySua ?? this.ngaySua,
      ngayTrinhKy: ngayTrinhKy ?? this.ngayTrinhKy,
      listNhanBg: listNhanBg ?? this.listNhanBg,
      ndNhanBg: ndNhanBg ?? this.ndNhanBg,
      listTruongBp: listTruongBp ?? this.listTruongBp,
      ndTruongBp: ndTruongBp ?? this.ndTruongBp,
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      ndDaiDienCTy: ndDaiDienCTy ?? this.ndDaiDienCTy,
      listTgd: listTgd ?? this.listTgd,
      ndtgd: ndtgd ?? this.ndtgd,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      tenCty2: tenCty2 ?? this.tenCty2,
      nguoiKhac: nguoiKhac ?? this.nguoiKhac,
      idCamKetUngPhep: idCamKetUngPhep ?? this.idCamKetUngPhep,
      tenNguoiLamDon: tenNguoiLamDon ?? this.tenNguoiLamDon,
      tenChucvu: tenChucvu ?? this.tenChucvu,
      tenBophan: tenBophan ?? this.tenBophan,
      noiDungTraVe: noiDungTraVe ?? this.noiDungTraVe,
      tuNgay: tuNgay ?? this.tuNgay,
      denNgay: denNgay ?? this.denNgay,
      isCongTacTheoDoan: isCongTacTheoDoan ?? this.isCongTacTheoDoan,
      diCongTacTai: diCongTacTai ?? this.diCongTacTai,
      ngoaiTe: ngoaiTe ?? this.ngoaiTe,
      hinhThucNghi: hinhThucNghi ?? this.hinhThucNghi,
      hinhThucKhac: hinhThucKhac ?? this.hinhThucKhac,
      lyDo: lyDo ?? this.lyDo,
      tinhTrang: tinhTrang ?? this.tinhTrang,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LenhCongTac) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      logoCongTy.hashCode ^
      nguoiNhanBg.hashCode ^
      nguoiTruongBp.hashCode ^
      nguoiDaiDienCTy.hashCode ^
      nguoiTgd.hashCode ^
      nguoiTrinhKy.hashCode ^
      maCty.hashCode ^
      maBophan.hashCode ^
      maChucvu.hashCode ^
      tenBoPhan.hashCode ^
      chucVuNhanVien.hashCode ^
      tinhTrangChu.hashCode ^
      idGiayXinPhep.hashCode ^
      maCongTy.hashCode ^
      loaiPhieu.hashCode ^
      ngayLamDon.hashCode ^
      guiNguoi.hashCode ^
      nguoiLamDon.hashCode ^
      tongThoiGian.hashCode ^
      nguoiNhanBanGiao.hashCode ^
      barcode.hashCode ^
      nguoiTao.hashCode ^
      ngayTao.hashCode ^
      nguoiSua.hashCode ^
      ngaySua.hashCode ^
      ngayTrinhKy.hashCode ^
      listNhanBg.hashCode ^
      ndNhanBg.hashCode ^
      listTruongBp.hashCode ^
      ndTruongBp.hashCode ^
      listDaiDienCTy.hashCode ^
      ndDaiDienCTy.hashCode ^
      listTgd.hashCode ^
      ndtgd.hashCode ^
      soPhieuAuto.hashCode ^
      tenCty2.hashCode ^
      nguoiKhac.hashCode ^
      idCamKetUngPhep.hashCode ^
      tenNguoiLamDon.hashCode ^
      tenChucvu.hashCode ^
      tenBophan.hashCode ^
      noiDungTraVe.hashCode ^
      tuNgay.hashCode ^
      denNgay.hashCode ^
      isCongTacTheoDoan.hashCode ^
      diCongTacTai.hashCode ^
      ngoaiTe.hashCode ^
      hinhThucNghi.hashCode ^
      hinhThucKhac.hashCode ^
      lyDo.hashCode ^
      tinhTrang.hashCode;

  @override
  int getId() {
    return idGiayXinPhep;
  }

  @override
  String getType() {
    return loaiPhieu;
  }
}
