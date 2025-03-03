import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class GiayRaCong extends IDocument {
  String logoCongTy;
  String nguoiNhanBg;
  String nguoiTruongBp;
  String nguoiDaiDienCTy;
  String nguoiTgd;
  String? nguoiTrinhKy;
  String maBophan;
  String maChucvu;
  String? boPhanNhanVien;
  DateTime? ngayTrinhKy;
  int idGiayXinPhep;
  String maCongTy;
  String loaiPhieu;
  DateTime? ngayLamDon;
  String? guiNguoi;
  String? nguoiLamDon;
  int? hinhThucNghi;
  String? hinhThucKhac;
  String lyDo;
  DateTime? tuNgay;
  DateTime? denNgay;
  double? tongThoiGian;
  String nguoiNhanBanGiao;
  String? barcode;
  String? nguoiTao;
  DateTime? ngayTao;
  String? nguoiSua;
  DateTime? ngaySua;
  String? listNhanBg;
  String? ndNhanBg;
  String? listTruongBp;
  String? ndTruongBp;
  String? listDaiDienCTy;
  DateTime? ngayDaiDienCTy;
  String? ndDaiDienCTy;
  String listTgd;
  String? ndtgd;
  String? soPhieuAuto;
  String? nguoiKhac;
  String? tenCty2;
  int? idCamKetUngPhep;
  String? tenNguoiLamDon;
  bool? isCongTacTheoDoan;
  int tinhTrang;
  String tinhTrangChu;

  GiayRaCong({
    this.logoCongTy = '',
    this.nguoiNhanBg = '',
    this.nguoiTruongBp = '',
    this.nguoiDaiDienCTy = '',
    this.nguoiTgd = '',
    this.nguoiTrinhKy = '',
    this.maBophan = '',
    this.maChucvu = '',
    this.boPhanNhanVien,
    this.ngayTrinhKy,
    this.idGiayXinPhep = 0,
    this.maCongTy = '',
    this.loaiPhieu = '',
    this.ngayLamDon,
    this.guiNguoi,
    this.nguoiLamDon,
    this.hinhThucNghi,
    this.hinhThucKhac,
    this.lyDo = '',
    this.tuNgay,
    this.denNgay,
    this.tongThoiGian,
    this.nguoiNhanBanGiao = '',
    this.barcode,
    this.nguoiTao,
    this.ngayTao,
    this.nguoiSua,
    this.ngaySua,
    this.listNhanBg,
    this.ndNhanBg,
    this.listTruongBp,
    this.ndTruongBp,
    this.listDaiDienCTy,
    this.ngayDaiDienCTy,
    this.ndDaiDienCTy,
    this.listTgd = '',
    this.ndtgd,
    this.soPhieuAuto,
    this.nguoiKhac,
    this.tenCty2,
    this.idCamKetUngPhep,
    this.tenNguoiLamDon,
    this.isCongTacTheoDoan,
    this.tinhTrang = -1,
    this.tinhTrangChu = '',
  });

  @override
  String toString() {
    return 'GiayRaCong(logoCongTy: $logoCongTy, nguoiNhanBg: $nguoiNhanBg, nguoiTruongBp: $nguoiTruongBp, nguoiDaiDienCTy: $nguoiDaiDienCTy, nguoiTgd: $nguoiTgd, nguoiTrinhKy: $nguoiTrinhKy, maBophan: $maBophan, maChucvu: $maChucvu, boPhanNhanVien: $boPhanNhanVien, ngayTrinhKy: $ngayTrinhKy, idGiayXinPhep: $idGiayXinPhep, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, ngayLamDon: $ngayLamDon, guiNguoi: $guiNguoi, nguoiLamDon: $nguoiLamDon, hinhThucNghi: $hinhThucNghi, hinhThucKhac: $hinhThucKhac, lyDo: $lyDo, tuNgay: $tuNgay, denNgay: $denNgay, tongThoiGian: $tongThoiGian, nguoiNhanBanGiao: $nguoiNhanBanGiao, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, listNhanBg: $listNhanBg, ndNhanBg: $ndNhanBg, listTruongBp: $listTruongBp, ndTruongBp: $ndTruongBp, listDaiDienCTy: $listDaiDienCTy, ngayDaiDienCTy: $ngayDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listTgd: $listTgd, ndtgd: $ndtgd, soPhieuAuto: $soPhieuAuto, nguoiKhac: $nguoiKhac, tenCty2: $tenCty2, idCamKetUngPhep: $idCamKetUngPhep, tenNguoiLamDon: $tenNguoiLamDon, isCongTacTheoDoan: $isCongTacTheoDoan, tinhTrang: $tinhTrang, tinhTrangChu: $tinhTrangChu)';
  }

  factory GiayRaCong.fromMap(Map<String, dynamic> data) => GiayRaCong(
        logoCongTy: data['logoCongTy'] ?? '',
        nguoiNhanBg: data['nguoiNhanBG'] ?? '',
        nguoiTruongBp: data['nguoiTruongBP'] ?? '',
        nguoiDaiDienCTy: data['nguoiDaiDienCTy'] ?? '',
        nguoiTgd: data['nguoiTGD'] ?? '',
        nguoiTrinhKy: data['nguoiTrinhKy'] ?? '',
        maBophan: data['ma_bophan'] ?? '',
        maChucvu: data['ma_chucvu'] ?? '',
        boPhanNhanVien: data['boPhanNhanVien'] ?? '',
        ngayTrinhKy: data['ngayTrinhKy'] == null
            ? null
            : DateTime.parse(data['ngayTrinhKy'] as String),
        idGiayXinPhep: data['idGiayXinPhep'] as int,
        maCongTy: data['maCongTy'] ?? '',
        loaiPhieu: data['loaiPhieu'] ?? '',
        ngayLamDon: data['ngayLamDon'] == null
            ? null
            : DateTime.parse(data['ngayLamDon'] as String),
        guiNguoi: data['guiNguoi'] as String?,
        nguoiLamDon: data['nguoiLamDon'] ?? '',
        hinhThucNghi: data['hinhThucNghi'] as int?,
        hinhThucKhac: data['hinhThucKhac'] ?? '',
        lyDo: data['lyDo'] ?? '',
        tuNgay: data['tuNgay'] == null
            ? null
            : DateTime.parse(data['tuNgay'] as String),
        denNgay: data['denNgay'] == null
            ? null
            : DateTime.parse(data['denNgay'] as String),
        tongThoiGian: (data['tongThoiGian'] as num?)?.toDouble(),
        nguoiNhanBanGiao: data['nguoiNhanBanGiao'] ?? '',
        barcode: data['barcode'] ?? '',
        nguoiTao: data['nguoiTao'] ?? '',
        ngayTao: data['ngayTao'] == null
            ? null
            : DateTime.parse(data['ngayTao'] as String),
        nguoiSua: data['nguoiSua'] ?? '',
        ngaySua: data['ngaySua'] == null
            ? null
            : DateTime.parse(data['ngaySua'] as String),
        listNhanBg: data['listNhanBG'] ?? '',
        ndNhanBg: data['ndNhanBG'] ?? '',
        listTruongBp: data['listTruongBP'] ?? '',
        ndTruongBp: data['ndTruongBP'] ?? '',
        listDaiDienCTy: data['listDaiDienCTy'] ?? '',
        ngayDaiDienCTy: data['ngayDaiDienCTy'] == null
            ? null
            : DateTime.parse(data['ngayDaiDienCTy'] as String),
        ndDaiDienCTy: data['ndDaiDienCTy'] ?? '',
        listTgd: data['listTGD'] ?? '',
        ndtgd: data['ndtgd'] ?? '',
        soPhieuAuto: data['soPhieuAuto'] ?? '',
        nguoiKhac: data['nguoiKhac'] ?? '',
        tenCty2: data['ten_cty2'] ?? '',
        idCamKetUngPhep: data['idCamKetUngPhep'] as int?,
        tenNguoiLamDon: data['tenNguoiLamDon'] ?? '',
        isCongTacTheoDoan: data['isCongTacTheoDoan'] ?? false,
        tinhTrang: data['tinhTrang'] ?? -1,
        tinhTrangChu: data['tinhTrangChu'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'nguoiNhanBG': nguoiNhanBg,
        'nguoiTruongBP': nguoiTruongBp,
        'nguoiDaiDienCTy': nguoiDaiDienCTy,
        'nguoiTGD': nguoiTgd,
        'nguoiTrinhKy': nguoiTrinhKy,
        'ma_bophan': maBophan,
        'ma_chucvu': maChucvu,
        'boPhanNhanVien': boPhanNhanVien,
        'ngayTrinhKy': ngayTrinhKy?.toIso8601String(),
        'idGiayXinPhep': idGiayXinPhep,
        'maCongTy': maCongTy,
        'loaiPhieu': loaiPhieu,
        'ngayLamDon': ngayLamDon,
        'guiNguoi': guiNguoi,
        'nguoiLamDon': nguoiLamDon,
        'hinhThucNghi': hinhThucNghi,
        'hinhThucKhac': hinhThucKhac,
        'lyDo': lyDo,
        'tuNgay': tuNgay,
        'denNgay': denNgay,
        'tongThoiGian': tongThoiGian,
        'nguoiNhanBanGiao': nguoiNhanBanGiao,
        'barcode': barcode,
        'nguoiTao': nguoiTao,
        'ngayTao': ngayTao?.toIso8601String(),
        'nguoiSua': nguoiSua,
        'ngaySua': ngaySua?.toIso8601String(),
        'listNhanBG': listNhanBg,
        'ndNhanBG': ndNhanBg,
        'listTruongBP': listTruongBp,
        'ndTruongBP': ndTruongBp,
        'listDaiDienCTy': listDaiDienCTy,
        'ngayDaiDienCTy': ngayDaiDienCTy,
        'ndDaiDienCTy': ndDaiDienCTy,
        'listTGD': listTgd,
        'ndtgd': ndtgd,
        'soPhieuAuto': soPhieuAuto,
        'nguoiKhac': nguoiKhac,
        'ten_cty2': tenCty2,
        'idCamKetUngPhep': idCamKetUngPhep,
        'tenNguoiLamDon': tenNguoiLamDon,
        'isCongTacTheoDoan': isCongTacTheoDoan,
        'tinhTrang': tinhTrang,
        'tinhTrangChu': tinhTrangChu,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GiayRaCong].
  factory GiayRaCong.fromJson(String data) {
    return GiayRaCong.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GiayRaCong] to a JSON string.
  String toJson() => json.encode(toMap());

  GiayRaCong copyWith({
    String? logoCongTy,
    String? nguoiNhanBg = '',
    String? nguoiTruongBp = '',
    String? nguoiDaiDienCTy = '',
    String? nguoiTgd = '',
    String? nguoiTrinhKy,
    String? maBophan,
    String? maChucvu,
    String? boPhanNhanVien,
    DateTime? ngayTrinhKy,
    int? idGiayXinPhep,
    String? maCongTy,
    String? loaiPhieu,
    DateTime? ngayLamDon,
    String? guiNguoi,
    String? nguoiLamDon,
    int? hinhThucNghi,
    String? hinhThucKhac,
    String? lyDo,
    DateTime? tuNgay,
    DateTime? denNgay,
    double? tongThoiGian,
    String? nguoiNhanBanGiao = '',
    String? barcode,
    String? nguoiTao,
    DateTime? ngayTao,
    String? nguoiSua,
    DateTime? ngaySua,
    String? listNhanBg,
    String? ndNhanBg,
    String? listTruongBp,
    String? ndTruongBp,
    String? listDaiDienCTy,
    DateTime? ngayDaiDienCTy,
    String? ndDaiDienCTy,
    String listTgd = '',
    String? ndtgd,
    String? soPhieuAuto,
    String? nguoiKhac,
    String? tenCty2,
    int? idCamKetUngPhep,
    String? tenNguoiLamDon,
    bool? isCongTacTheoDoan,
    int? tinhTrang,
    String? tinhTrangChu,
  }) {
    return GiayRaCong(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      nguoiNhanBg: nguoiNhanBg ?? this.nguoiNhanBg,
      nguoiTruongBp: nguoiTruongBp ?? this.nguoiTruongBp,
      nguoiDaiDienCTy: nguoiDaiDienCTy ?? this.nguoiDaiDienCTy,
      nguoiTgd: nguoiTgd ?? this.nguoiTgd,
      nguoiTrinhKy: nguoiTrinhKy ?? this.nguoiTrinhKy,
      maBophan: maBophan ?? this.maBophan,
      maChucvu: maChucvu ?? this.maChucvu,
      boPhanNhanVien: boPhanNhanVien ?? this.boPhanNhanVien,
      ngayTrinhKy: ngayTrinhKy ?? this.ngayTrinhKy,
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiPhieu: loaiPhieu ?? this.loaiPhieu,
      ngayLamDon: ngayLamDon ?? this.ngayLamDon,
      guiNguoi: guiNguoi ?? this.guiNguoi,
      nguoiLamDon: nguoiLamDon ?? this.nguoiLamDon,
      hinhThucNghi: hinhThucNghi ?? this.hinhThucNghi,
      hinhThucKhac: hinhThucKhac ?? this.hinhThucKhac,
      lyDo: lyDo ?? this.lyDo,
      tuNgay: tuNgay ?? this.tuNgay,
      denNgay: denNgay ?? this.denNgay,
      tongThoiGian: tongThoiGian ?? this.tongThoiGian,
      nguoiNhanBanGiao: nguoiNhanBanGiao ?? this.nguoiNhanBanGiao,
      barcode: barcode ?? this.barcode,
      nguoiTao: nguoiTao ?? this.nguoiTao,
      ngayTao: ngayTao ?? this.ngayTao,
      nguoiSua: nguoiSua ?? this.nguoiSua,
      ngaySua: ngaySua ?? this.ngaySua,
      listNhanBg: listNhanBg ?? this.listNhanBg,
      ndNhanBg: ndNhanBg ?? this.ndNhanBg,
      listTruongBp: listTruongBp ?? this.listTruongBp,
      ndTruongBp: ndTruongBp ?? this.ndTruongBp,
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      ngayDaiDienCTy: ngayDaiDienCTy ?? this.ngayDaiDienCTy,
      ndDaiDienCTy: ndDaiDienCTy ?? this.ndDaiDienCTy,
      listTgd: listTgd,
      ndtgd: ndtgd ?? this.ndtgd,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      nguoiKhac: nguoiKhac ?? this.nguoiKhac,
      tenCty2: tenCty2 ?? this.tenCty2,
      idCamKetUngPhep: idCamKetUngPhep ?? this.idCamKetUngPhep,
      tenNguoiLamDon: tenNguoiLamDon ?? this.tenNguoiLamDon,
      isCongTacTheoDoan: isCongTacTheoDoan ?? this.isCongTacTheoDoan,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      tinhTrangChu: tinhTrangChu ?? this.tinhTrangChu,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GiayRaCong) return false;
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
      maBophan.hashCode ^
      maChucvu.hashCode ^
      boPhanNhanVien.hashCode ^
      ngayTrinhKy.hashCode ^
      idGiayXinPhep.hashCode ^
      maCongTy.hashCode ^
      loaiPhieu.hashCode ^
      ngayLamDon.hashCode ^
      guiNguoi.hashCode ^
      nguoiLamDon.hashCode ^
      hinhThucNghi.hashCode ^
      hinhThucKhac.hashCode ^
      lyDo.hashCode ^
      tuNgay.hashCode ^
      denNgay.hashCode ^
      tongThoiGian.hashCode ^
      nguoiNhanBanGiao.hashCode ^
      barcode.hashCode ^
      nguoiTao.hashCode ^
      ngayTao.hashCode ^
      nguoiSua.hashCode ^
      ngaySua.hashCode ^
      listNhanBg.hashCode ^
      ndNhanBg.hashCode ^
      listTruongBp.hashCode ^
      ndTruongBp.hashCode ^
      listDaiDienCTy.hashCode ^
      ngayDaiDienCTy.hashCode ^
      ndDaiDienCTy.hashCode ^
      listTgd.hashCode ^
      ndtgd.hashCode ^
      soPhieuAuto.hashCode ^
      nguoiKhac.hashCode ^
      tenCty2.hashCode ^
      idCamKetUngPhep.hashCode ^
      tenNguoiLamDon.hashCode ^
      isCongTacTheoDoan.hashCode ^
      tinhTrang.hashCode ^
      tinhTrangChu.hashCode;

  @override
  int getId() {
    return idGiayXinPhep;
  }

  @override
  String getType() {
    return loaiPhieu;
  }
}
