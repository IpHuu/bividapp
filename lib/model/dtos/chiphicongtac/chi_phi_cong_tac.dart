import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class ChiPhiCongTac extends IDocument {
  String logoCongTy;
  String? boPhanNhanVien;
  String? maChucvu;
  String? maBophan;
  String tinhTrangChu;
  int idGiayXinPhep;
  String maCongTy;
  String loaiPhieu;
  DateTime? ngayLamDon;
  String? guiNguoi;
  String? nguoiLamDon;
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
  String? ndDaiDienCTy;
  String? listTgd;
  String? ndtgd;
  String? soPhieuAuto;
  String? tenCty2;
  String? nguoiKhac;
  int? idCamKetUngPhep;
  String? tenNguoiLamDon;
  String? tenChucvu;
  String? tenBophan;
  String? noiDungTraVe;
  DateTime? tuNgay;
  DateTime? denNgay;
  bool? isCongTacTheoDoan;
  String diCongTacTai;
  String? ngoaiTe;
  int tinhTrang;

  ChiPhiCongTac({
    this.logoCongTy = '',
    this.boPhanNhanVien,
    this.maChucvu,
    this.maBophan,
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
    this.diCongTacTai = '',
    this.ngoaiTe,
    this.tinhTrang = -1,
  });

  @override
  String toString() {
    return 'ChiPhiCongTac(logoCongTy: $logoCongTy, boPhanNhanVien: $boPhanNhanVien, maChucvu: $maChucvu, maBophan: $maBophan, tinhTrangChu: $tinhTrangChu, idGiayXinPhep: $idGiayXinPhep, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, ngayLamDon: $ngayLamDon, guiNguoi: $guiNguoi, nguoiLamDon: $nguoiLamDon, tongThoiGian: $tongThoiGian, nguoiNhanBanGiao: $nguoiNhanBanGiao, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, listNhanBg: $listNhanBg, ndNhanBg: $ndNhanBg, listTruongBp: $listTruongBp, ndTruongBp: $ndTruongBp, listDaiDienCTy: $listDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listTgd: $listTgd, ndtgd: $ndtgd, soPhieuAuto: $soPhieuAuto, tenCty2: $tenCty2, nguoiKhac: $nguoiKhac, idCamKetUngPhep: $idCamKetUngPhep, tenNguoiLamDon: $tenNguoiLamDon, tenChucvu: $tenChucvu, tenBophan: $tenBophan, noiDungTraVe: $noiDungTraVe, tuNgay: $tuNgay, denNgay: $denNgay, isCongTacTheoDoan: $isCongTacTheoDoan, diCongTacTai: $diCongTacTai, ngoaiTe: $ngoaiTe, tinhTrang: $tinhTrang)';
  }

  factory ChiPhiCongTac.fromMap(Map<String, dynamic> data) => ChiPhiCongTac(
        logoCongTy: data['logoCongTy'] ?? '',
        boPhanNhanVien: data['boPhanNhanVien'] as String?,
        maChucvu: data['ma_chucvu'] as String?,
        maBophan: data['ma_bophan'] as String?,
        tinhTrangChu: data['tinhTrangChu'] ?? '',
        idGiayXinPhep: data['idGiayXinPhep'] ?? 0,
        maCongTy: data['maCongTy'] ?? '',
        loaiPhieu: data['loaiPhieu'] ?? '',
        ngayLamDon: data['ngayLamDon'] == null
            ? null
            : DateTime.parse(data['ngayLamDon'] as String),
        guiNguoi: data['guiNguoi'] as String?,
        nguoiLamDon: data['nguoiLamDon'] as String?,
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
        ndDaiDienCTy: data['ndDaiDienCTy'] as String?,
        listTgd: data['listTGD'] as String?,
        ndtgd: data['ndtgd'] as String?,
        soPhieuAuto: data['soPhieuAuto'] as String?,
        tenCty2: data['ten_cty2'] as String?,
        nguoiKhac: data['nguoiKhac'] as String?,
        idCamKetUngPhep: data['idCamKetUngPhep'] as int?,
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
        diCongTacTai: data['diCongTacTai'] ?? '',
        ngoaiTe: data['ngoaiTe'] ?? '',
        tinhTrang: data['tinhTrang'] ?? -1,
      );

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'boPhanNhanVien': boPhanNhanVien,
        'ma_chucvu': maChucvu,
        'ma_bophan': maBophan,
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
        'tuNgay': tuNgay?.toIso8601String(),
        'denNgay': denNgay?.toIso8601String(),
        'isCongTacTheoDoan': isCongTacTheoDoan,
        'diCongTacTai': diCongTacTai,
        'ngoaiTe': ngoaiTe,
        'tinhTrang': tinhTrang,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChiPhiCongTac].
  factory ChiPhiCongTac.fromJson(String data) {
    return ChiPhiCongTac.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChiPhiCongTac] to a JSON string.
  String toJson() => json.encode(toMap());

  ChiPhiCongTac copyWith({
    String? logoCongTy,
    String? boPhanNhanVien,
    String? maChucvu,
    String? maBophan,
    String? tinhTrangChu,
    int? idGiayXinPhep,
    String? maCongTy,
    String? loaiPhieu,
    DateTime? ngayLamDon,
    String? guiNguoi,
    String? nguoiLamDon,
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
    String? ndDaiDienCTy,
    String? listTgd,
    String? ndtgd,
    String? soPhieuAuto,
    String? tenCty2,
    String? nguoiKhac,
    int? idCamKetUngPhep,
    String? tenNguoiLamDon,
    String? tenChucvu,
    String? tenBophan,
    String? noiDungTraVe,
    DateTime? tuNgay,
    DateTime? denNgay,
    bool? isCongTacTheoDoan,
    String? diCongTacTai,
    String? ngoaiTe,
    int? tinhTrang,
  }) {
    return ChiPhiCongTac(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      boPhanNhanVien: boPhanNhanVien ?? this.boPhanNhanVien,
      maChucvu: maChucvu ?? this.maChucvu,
      maBophan: maBophan ?? this.maBophan,
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
      tinhTrang: tinhTrang ?? this.tinhTrang,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ChiPhiCongTac) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      logoCongTy.hashCode ^
      boPhanNhanVien.hashCode ^
      maChucvu.hashCode ^
      maBophan.hashCode ^
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
