import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class KeHoachCongTac extends IDocument {
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
  int? hinhThucNghi;
  String? hinhThucKhac;
  String? lyDo;
  DateTime? tuNgay;
  DateTime? denNgay;
  int? tongThoiGian;
  String? nguoiNhanBanGiao;
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
  String? listTgd;
  String? ndtgd;
  String? soPhieuAuto;
  String? nguoiKhac;
  String? tenCty2;
  int? idCamKetUngPhep;
  String? tenNguoiLamDon;
  int tinhTrang;
  String? tenChucvu;
  String? tenBophan;
  DateTime? ngayTrinhKy;
  String mucDichNguoi1;

  KeHoachCongTac({
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
    this.hinhThucNghi,
    this.hinhThucKhac,
    this.lyDo,
    this.tuNgay,
    this.denNgay,
    this.tongThoiGian,
    this.nguoiNhanBanGiao,
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
    this.listTgd,
    this.ndtgd,
    this.soPhieuAuto,
    this.nguoiKhac,
    this.tenCty2,
    this.idCamKetUngPhep,
    this.tenNguoiLamDon,
    this.tinhTrang = -1,
    this.tenChucvu,
    this.tenBophan,
    this.ngayTrinhKy,
    this.mucDichNguoi1 = '',
  });

  @override
  String toString() {
    return 'KeHoachCongTac(logoCongTy: $logoCongTy, nguoiNhanBg: $nguoiNhanBg, nguoiTruongBp: $nguoiTruongBp, nguoiDaiDienCTy: $nguoiDaiDienCTy, nguoiTgd: $nguoiTgd, nguoiTrinhKy: $nguoiTrinhKy, maCty: $maCty, maBophan: $maBophan, maChucvu: $maChucvu, tenBoPhan: $tenBoPhan, chucVuNhanVien: $chucVuNhanVien, tinhTrangChu: $tinhTrangChu, idGiayXinPhep: $idGiayXinPhep, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, ngayLamDon: $ngayLamDon, guiNguoi: $guiNguoi, nguoiLamDon: $nguoiLamDon, hinhThucNghi: $hinhThucNghi, hinhThucKhac: $hinhThucKhac, lyDo: $lyDo, tuNgay: $tuNgay, denNgay: $denNgay, tongThoiGian: $tongThoiGian, nguoiNhanBanGiao: $nguoiNhanBanGiao, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, listNhanBg: $listNhanBg, ndNhanBg: $ndNhanBg, listTruongBp: $listTruongBp, ndTruongBp: $ndTruongBp, listDaiDienCTy: $listDaiDienCTy, ngayDaiDienCTy: $ngayDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listTgd: $listTgd, ndtgd: $ndtgd, soPhieuAuto: $soPhieuAuto, nguoiKhac: $nguoiKhac, tenCty2: $tenCty2, idCamKetUngPhep: $idCamKetUngPhep, tenNguoiLamDon: $tenNguoiLamDon, tinhTrang: $tinhTrang, tenChucvu: $tenChucvu, tenBophan: $tenBophan, ngayTrinhKy: $ngayTrinhKy, mucDichNguoi1: $mucDichNguoi1)';
  }

  factory KeHoachCongTac.fromMap(Map<String, dynamic> data) {
    return KeHoachCongTac(
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
      hinhThucNghi: data['hinhThucNghi'] as int?,
      hinhThucKhac: data['hinhThucKhac'] as String?,
      lyDo: data['lyDo'] as String?,
      tuNgay: data['tuNgay'] == null
          ? null
          : DateTime.parse(data['tuNgay'] as String),
      denNgay: data['denNgay'] == null
          ? null
          : DateTime.parse(data['denNgay'] as String),
      tongThoiGian: data['tongThoiGian'] as int?,
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
      listNhanBg: data['listNhanBG'] as String?,
      ndNhanBg: data['ndNhanBG'] as String?,
      listTruongBp: data['listTruongBP'] as String?,
      ndTruongBp: data['ndTruongBP'] as String?,
      listDaiDienCTy: data['listDaiDienCTy'] as String?,
      ngayDaiDienCTy: data['ngayDaiDienCTy'] == null
          ? null
          : DateTime.parse(data['ngayDaiDienCTy'] as String),
      ndDaiDienCTy: data['ndDaiDienCTy'] as String?,
      listTgd: data['listTGD'] as String?,
      ndtgd: data['ndtgd'] as String?,
      soPhieuAuto: data['soPhieuAuto'] as String?,
      nguoiKhac: data['nguoiKhac'] as String?,
      tenCty2: data['ten_cty2'] as String?,
      idCamKetUngPhep: data['idCamKetUngPhep'] as int?,
      tenNguoiLamDon: data['tenNguoiLamDon'] as String?,
      tinhTrang: data['tinhTrang'] ?? -1,
      tenChucvu: data['ten_chucvu'] as String?,
      tenBophan: data['ten_bophan'] as String?,
      ngayTrinhKy: data['ngayTrinhKy'] == null
          ? null
          : DateTime.parse(data['ngayTrinhKy'] as String),
      mucDichNguoi1: data['mucDichNguoi1'] ?? '',
    );
  }

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
        'hinhThucNghi': hinhThucNghi,
        'hinhThucKhac': hinhThucKhac,
        'lyDo': lyDo,
        'tuNgay': tuNgay?.toIso8601String(),
        'denNgay': denNgay?.toIso8601String(),
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
        'ngayDaiDienCTy': ngayDaiDienCTy?.toIso8601String(),
        'ndDaiDienCTy': ndDaiDienCTy,
        'listTGD': listTgd,
        'ndtgd': ndtgd,
        'soPhieuAuto': soPhieuAuto,
        'nguoiKhac': nguoiKhac,
        'ten_cty2': tenCty2,
        'idCamKetUngPhep': idCamKetUngPhep,
        'tenNguoiLamDon': tenNguoiLamDon,
        'tinhTrang': tinhTrang,
        'ten_chucvu': tenChucvu,
        'ten_bophan': tenBophan,
        'ngayTrinhKy': ngayTrinhKy?.toIso8601String(),
        'mucDichNguoi1': mucDichNguoi1,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KeHoachCongTac].
  factory KeHoachCongTac.fromJson(String data) {
    return KeHoachCongTac.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KeHoachCongTac] to a JSON string.
  String toJson() => json.encode(toMap());

  KeHoachCongTac copyWith({
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
    int? hinhThucNghi,
    String? hinhThucKhac,
    String? lyDo,
    DateTime? tuNgay,
    DateTime? denNgay,
    int? tongThoiGian,
    String? nguoiNhanBanGiao,
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
    String? listTgd,
    String? ndtgd,
    String? soPhieuAuto,
    String? nguoiKhac,
    String? tenCty2,
    int? idCamKetUngPhep,
    String? tenNguoiLamDon,
    int? tinhTrang,
    String? tenChucvu,
    String? tenBophan,
    DateTime? ngayTrinhKy,
    String? mucDichNguoi1,
  }) {
    return KeHoachCongTac(
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
      listTgd: listTgd ?? this.listTgd,
      ndtgd: ndtgd ?? this.ndtgd,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      nguoiKhac: nguoiKhac ?? this.nguoiKhac,
      tenCty2: tenCty2 ?? this.tenCty2,
      idCamKetUngPhep: idCamKetUngPhep ?? this.idCamKetUngPhep,
      tenNguoiLamDon: tenNguoiLamDon ?? this.tenNguoiLamDon,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      tenChucvu: tenChucvu ?? this.tenChucvu,
      tenBophan: tenBophan ?? this.tenBophan,
      ngayTrinhKy: ngayTrinhKy ?? this.ngayTrinhKy,
      mucDichNguoi1: mucDichNguoi1 ?? this.mucDichNguoi1,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! KeHoachCongTac) return false;
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
      tinhTrang.hashCode ^
      tenChucvu.hashCode ^
      tenBophan.hashCode ^
      ngayTrinhKy.hashCode ^
      mucDichNguoi1.hashCode;

  @override
  int getId() {
    return idGiayXinPhep;
  }

  @override
  String getType() {
    return loaiPhieu;
  }
}
