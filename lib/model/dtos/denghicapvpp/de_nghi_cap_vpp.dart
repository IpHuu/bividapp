import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class DeNghiCapVpp extends IDocument {
  String logoCongTy;
  String? boPhanNhanVien;
  String? maChucvu;
  String? maBophan;
  double? soTienTuongUng;
  String? mucDichSuDung;
  String tinhTrangChu;
  int idDeNghi;
  String maCongTy;
  String? tenCty2;
  String loaiPhieu;
  String? nguoiDeNghi;
  String lyDoDeNghi;
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
  String? listHcns;
  bool? isHcns;
  String? nguoiHcns;
  DateTime? ngayHcns;
  String? ndhcns;
  String? listTgd;
  bool? isTgd;
  bool? isKhongTgd;
  String? nguoiTgd;
  DateTime? ngayTgd;
  String? ndtgd;
  String? soPhieuAuto;
  String? noiDungTraVe;
  String? tenNguoiDeNghi;
  String? tenChucVuNguoiDeNghi;
  String? tenBoPhanNguoiDeNghi;
  int tinhTrang;

  DeNghiCapVpp({
    this.logoCongTy = '',
    this.boPhanNhanVien,
    this.maChucvu,
    this.maBophan,
    this.soTienTuongUng,
    this.mucDichSuDung,
    this.tinhTrangChu = '',
    this.idDeNghi = 0,
    this.maCongTy = '',
    this.tenCty2,
    this.loaiPhieu = '',
    this.nguoiDeNghi,
    this.lyDoDeNghi = '',
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
    this.listHcns,
    this.isHcns,
    this.nguoiHcns,
    this.ngayHcns,
    this.ndhcns,
    this.listTgd,
    this.isTgd,
    this.isKhongTgd,
    this.nguoiTgd,
    this.ngayTgd,
    this.ndtgd,
    this.soPhieuAuto,
    this.noiDungTraVe,
    this.tenNguoiDeNghi,
    this.tenChucVuNguoiDeNghi,
    this.tenBoPhanNguoiDeNghi,
    this.tinhTrang = -1,
  });

  @override
  String toString() {
    return 'DeNghiCapVpp(logoCongTy: $logoCongTy, boPhanNhanVien: $boPhanNhanVien, maChucvu: $maChucvu, maBophan: $maBophan, soTienTuongUng: $soTienTuongUng, mucDichSuDung: $mucDichSuDung, tinhTrangChu: $tinhTrangChu, idDeNghi: $idDeNghi, maCongTy: $maCongTy, tenCty2: $tenCty2, loaiPhieu: $loaiPhieu, nguoiDeNghi: $nguoiDeNghi, lyDoDeNghi: $lyDoDeNghi, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, isHuy: $isHuy, nguoiHuy: $nguoiHuy, ngayHuy: $ngayHuy, isTrinhKy: $isTrinhKy, ngayTrinhKy: $ngayTrinhKy, nguoiTrinhKy: $nguoiTrinhKy, listTruongBp: $listTruongBp, isTruongBp: $isTruongBp, nguoiTruongBp: $nguoiTruongBp, ngayTruongBp: $ngayTruongBp, ndTruongBp: $ndTruongBp, listDaiDienCTy: $listDaiDienCTy, isDaiDienCTy: $isDaiDienCTy, nguoiDaiDienCTy: $nguoiDaiDienCTy, ngayDaiDienCTy: $ngayDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listHcns: $listHcns, isHcns: $isHcns, nguoiHcns: $nguoiHcns, ngayHcns: $ngayHcns, ndhcns: $ndhcns, listTgd: $listTgd, isTgd: $isTgd, isKhongTgd: $isKhongTgd, nguoiTgd: $nguoiTgd, ngayTgd: $ngayTgd, ndtgd: $ndtgd, soPhieuAuto: $soPhieuAuto, noiDungTraVe: $noiDungTraVe, tenNguoiDeNghi: $tenNguoiDeNghi, tenChucVuNguoiDeNghi: $tenChucVuNguoiDeNghi, tenBoPhanNguoiDeNghi: $tenBoPhanNguoiDeNghi, tinhTrang: $tinhTrang)';
  }

  factory DeNghiCapVpp.fromMap(Map<String, dynamic> data) {
    return DeNghiCapVpp(
      logoCongTy: data['logoCongTy'] ?? '',
      boPhanNhanVien: data['boPhanNhanVien'] as String?,
      maChucvu: data['ma_chucvu'] as String?,
      maBophan: data['ma_bophan'] as String?,
      soTienTuongUng: (data['soTienTuongUng'] as num?)?.toDouble(),
      mucDichSuDung: data['mucDichSuDung'] as String?,
      tinhTrangChu: data['tinhTrangChu'] ?? '',
      idDeNghi: data['idDeNghi'] ?? 0,
      maCongTy: data['maCongTy'] ?? '',
      tenCty2: data['ten_cty2'] as String?,
      loaiPhieu: data['loaiPhieu'] ?? '',
      nguoiDeNghi: data['nguoiDeNghi'] as String?,
      lyDoDeNghi: data['lyDoDeNghi'] ?? '',
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
      listHcns: data['listHCNS'] as String?,
      isHcns: data['isHCNS'] as bool?,
      nguoiHcns: data['nguoiHCNS'] as String?,
      ngayHcns: data['ngayHCNS'] == null
          ? null
          : DateTime.parse(data['ngayHCNS'] as String),
      ndhcns: data['ndhcns'] as String?,
      listTgd: data['listTGD'] as String?,
      isTgd: data['isTGD'] as bool?,
      isKhongTgd: data['isKhongTGD'] as bool?,
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
      tinhTrang: data['tinhTrang'] ?? -1,
    );
  }

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'boPhanNhanVien': boPhanNhanVien,
        'ma_chucvu': maChucvu,
        'ma_bophan': maBophan,
        'soTienTuongUng': soTienTuongUng,
        'mucDichSuDung': mucDichSuDung,
        'tinhTrangChu': tinhTrangChu,
        'idDeNghi': idDeNghi,
        'maCongTy': maCongTy,
        'ten_cty2': tenCty2,
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
        'listHCNS': listHcns,
        'isHCNS': isHcns,
        'nguoiHCNS': nguoiHcns,
        'ngayHCNS': ngayHcns?.toIso8601String(),
        'ndhcns': ndhcns,
        'listTGD': listTgd,
        'isTGD': isTgd,
        'isKhongTGD': isKhongTgd,
        'nguoiTGD': nguoiTgd,
        'ngayTGD': ngayTgd?.toIso8601String(),
        'ndtgd': ndtgd,
        'soPhieuAuto': soPhieuAuto,
        'noiDungTraVe': noiDungTraVe,
        'tenNguoiDeNghi': tenNguoiDeNghi,
        'tenChucVuNguoiDeNghi': tenChucVuNguoiDeNghi,
        'tenBoPhanNguoiDeNghi': tenBoPhanNguoiDeNghi,
        'tinhTrang': tinhTrang,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeNghiCapVpp].
  factory DeNghiCapVpp.fromJson(String data) {
    return DeNghiCapVpp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiCapVpp] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiCapVpp copyWith({
    String? logoCongTy,
    String? boPhanNhanVien,
    String? maChucvu,
    String? maBophan,
    double? soTienTuongUng,
    String? mucDichSuDung,
    String? tinhTrangChu,
    int? idDeNghi,
    String? maCongTy,
    String? tenCty2,
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
    String? listHcns,
    bool? isHcns,
    String? nguoiHcns,
    DateTime? ngayHcns,
    String? ndhcns,
    String? listTgd,
    bool? isTgd,
    bool? isKhongTgd,
    String? nguoiTgd,
    DateTime? ngayTgd,
    String? ndtgd,
    String? soPhieuAuto,
    String? noiDungTraVe,
    String? tenNguoiDeNghi,
    String? tenChucVuNguoiDeNghi,
    String? tenBoPhanNguoiDeNghi,
    int? tinhTrang,
  }) {
    return DeNghiCapVpp(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      boPhanNhanVien: boPhanNhanVien ?? this.boPhanNhanVien,
      maChucvu: maChucvu ?? this.maChucvu,
      maBophan: maBophan ?? this.maBophan,
      soTienTuongUng: soTienTuongUng ?? this.soTienTuongUng,
      mucDichSuDung: mucDichSuDung ?? this.mucDichSuDung,
      tinhTrangChu: tinhTrangChu ?? this.tinhTrangChu,
      idDeNghi: idDeNghi ?? this.idDeNghi,
      maCongTy: maCongTy ?? this.maCongTy,
      tenCty2: tenCty2 ?? this.tenCty2,
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
      listHcns: listHcns ?? this.listHcns,
      isHcns: isHcns ?? this.isHcns,
      nguoiHcns: nguoiHcns ?? this.nguoiHcns,
      ngayHcns: ngayHcns ?? this.ngayHcns,
      ndhcns: ndhcns ?? this.ndhcns,
      listTgd: listTgd ?? this.listTgd,
      isTgd: isTgd ?? this.isTgd,
      isKhongTgd: isKhongTgd ?? this.isKhongTgd,
      nguoiTgd: nguoiTgd ?? this.nguoiTgd,
      ngayTgd: ngayTgd ?? this.ngayTgd,
      ndtgd: ndtgd ?? this.ndtgd,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      noiDungTraVe: noiDungTraVe ?? this.noiDungTraVe,
      tenNguoiDeNghi: tenNguoiDeNghi ?? this.tenNguoiDeNghi,
      tenChucVuNguoiDeNghi: tenChucVuNguoiDeNghi ?? this.tenChucVuNguoiDeNghi,
      tenBoPhanNguoiDeNghi: tenBoPhanNguoiDeNghi ?? this.tenBoPhanNguoiDeNghi,
      tinhTrang: tinhTrang ?? this.tinhTrang,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeNghiCapVpp) return false;
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
      tinhTrangChu.hashCode ^
      idDeNghi.hashCode ^
      maCongTy.hashCode ^
      tenCty2.hashCode ^
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
      listHcns.hashCode ^
      isHcns.hashCode ^
      nguoiHcns.hashCode ^
      ngayHcns.hashCode ^
      ndhcns.hashCode ^
      listTgd.hashCode ^
      isTgd.hashCode ^
      isKhongTgd.hashCode ^
      nguoiTgd.hashCode ^
      ngayTgd.hashCode ^
      ndtgd.hashCode ^
      soPhieuAuto.hashCode ^
      noiDungTraVe.hashCode ^
      tenNguoiDeNghi.hashCode ^
      tenChucVuNguoiDeNghi.hashCode ^
      tenBoPhanNguoiDeNghi.hashCode ^
      tinhTrang.hashCode;

  @override
  int getId() {
    return idDeNghi;
  }

  @override
  String getType() {
    return loaiPhieu;
  }
}
