import 'dart:convert';
import 'package:bividpharma/common/data_helpers.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class YeuCauThietKe extends IDocument {
  String logoCongTy;
  String? chucVuNhanVien;
  String? maChucvu;
  String? maBophan;
  String? maCty;
  String? tenBoPhan;
  String tinhTrangChu;
  int idAutoQc;
  String maCongTy;
  String? maNhanvien;
  String? tenNhanvien;
  String? congTyKh;
  bool? isInAn;
  String? soLuongInAn;
  int? hangMucThietKe;
  String? ndHangMucThietKe;
  String? quyCachThucHien;
  String? yeuCauKhac;
  String? mucDichSuDung;
  String? tenCty2;
  DateTime? ngayMongMuon;
  bool? isTrinhKy;
  String? nguoiTrinhKy;
  DateTime? ngayTrinhKy;
  String? listTruongBp;
  bool? isTruongBp;
  String? nguoiTruongBp;
  DateTime? ngayTruongBp;
  String? ndTruongBpTraVe;
  String? ndTinhKhaThi;
  bool? isLapTrinh;
  String? nguoiLapTrinh;
  DateTime? ngayLapTrinh;
  String? listTgd;
  bool? isTgd;
  bool? isKhongTgd;
  String? nguoiTgd;
  DateTime? ngayTgd;
  String? ndtgd;
  String? nguoiTao;
  DateTime? ngayTao;
  String? nguoiSua;
  DateTime? ngaySua;
  String? barcode;
  int tinhTrang;

  YeuCauThietKe({
    this.logoCongTy = '',
    this.chucVuNhanVien,
    this.maChucvu,
    this.maBophan,
    this.maCty,
    this.tenBoPhan,
    this.tinhTrangChu = '',
    this.idAutoQc = 0,
    this.maCongTy = '',
    this.maNhanvien,
    this.tenNhanvien,
    this.congTyKh,
    this.isInAn,
    this.soLuongInAn,
    this.hangMucThietKe,
    this.ndHangMucThietKe,
    this.quyCachThucHien,
    this.yeuCauKhac,
    this.mucDichSuDung,
    this.tenCty2,
    this.ngayMongMuon,
    this.isTrinhKy,
    this.nguoiTrinhKy,
    this.ngayTrinhKy,
    this.listTruongBp,
    this.isTruongBp,
    this.nguoiTruongBp,
    this.ngayTruongBp,
    this.ndTruongBpTraVe,
    this.ndTinhKhaThi,
    this.isLapTrinh,
    this.nguoiLapTrinh,
    this.ngayLapTrinh,
    this.listTgd,
    this.isTgd,
    this.isKhongTgd,
    this.nguoiTgd,
    this.ngayTgd,
    this.ndtgd,
    this.nguoiTao,
    this.ngayTao,
    this.nguoiSua,
    this.ngaySua,
    this.barcode,
    this.tinhTrang = -1,
  });

  @override
  String toString() {
    return 'YeuCauThietKe(logoCongTy: $logoCongTy, chucVuNhanVien: $chucVuNhanVien, maChucvu: $maChucvu, maBophan: $maBophan, maCty: $maCty, tenBoPhan: $tenBoPhan, tinhTrangChu: $tinhTrangChu, idAutoQc: $idAutoQc, maCongTy: $maCongTy, maNhanvien: $maNhanvien, tenNhanvien: $tenNhanvien, congTyKh: $congTyKh, isInAn: $isInAn, soLuongInAn: $soLuongInAn, hangMucThietKe: $hangMucThietKe, ndHangMucThietKe: $ndHangMucThietKe, quyCachThucHien: $quyCachThucHien, yeuCauKhac: $yeuCauKhac, mucDichSuDung: $mucDichSuDung, tenCty2: $tenCty2, ngayMongMuon: $ngayMongMuon, isTrinhKy: $isTrinhKy, nguoiTrinhKy: $nguoiTrinhKy, ngayTrinhKy: $ngayTrinhKy, listTruongBp: $listTruongBp, isTruongBp: $isTruongBp, nguoiTruongBp: $nguoiTruongBp, ngayTruongBp: $ngayTruongBp, ndTruongBpTraVe: $ndTruongBpTraVe, ndTinhKhaThi: $ndTinhKhaThi, isLapTrinh: $isLapTrinh, nguoiLapTrinh: $nguoiLapTrinh, ngayLapTrinh: $ngayLapTrinh, listTgd: $listTgd, isTgd: $isTgd, isKhongTgd: $isKhongTgd, nguoiTgd: $nguoiTgd, ngayTgd: $ngayTgd, ndtgd: $ndtgd, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, barcode: $barcode, tinhTrang: $tinhTrang)';
  }

  factory YeuCauThietKe.fromMap(Map<String, dynamic> data) {
    try {
      final YeuCauThietKe newItem = YeuCauThietKe();
      newItem.logoCongTy = data['logoCongTy'] ?? '';
      newItem.chucVuNhanVien = data['chucVuNhanVien'] ?? '';
      newItem.maChucvu = data['ma_chucvu'] ?? '';
      newItem.maBophan = data['ma_bophan'] ?? '';
      newItem.maCty = data['ma_cty'] ?? '';
      newItem.tenBoPhan = data['tenBoPhan'] ?? '';
      newItem.tinhTrangChu = data['tinhTrangChu'] ?? '';
      newItem.idAutoQc = data['idAutoQC'] ?? 0;
      newItem.maCongTy = data['maCongTy'] ?? '';
      newItem.maNhanvien = data['ma_nhanvien'] ?? '';
      newItem.tenNhanvien = data['ten_nhanvien'] ?? '';
      newItem.congTyKh = data['congTyKH'] ?? '';
      newItem.isInAn = data['isInAn'] ?? false;
      newItem.soLuongInAn = data['soLuongInAn'] ?? 0;
      newItem.hangMucThietKe = data['hangMucThietKe'] ?? 0;
      newItem.ndHangMucThietKe = data['ndHangMucThietKe'] ?? '';
      newItem.quyCachThucHien = data['quyCachThucHien'] ?? '';
      newItem.yeuCauKhac = data['yeuCauKhac'] ?? '';
      newItem.mucDichSuDung = data['mucDichSuDung'] ?? '';
      newItem.tenCty2 = data['ten_cty2'] ?? '';
      newItem.ngayMongMuon = data['ngayMongMuon'] == null
          ? null
          : DateTime.parse(data['ngayMongMuon'] as String);
      newItem.isTrinhKy = data['isTrinhKy'] ?? false;
      newItem.nguoiTrinhKy = data['nguoiTrinhKy'] ?? '';
      newItem.ngayTrinhKy = data['ngayTrinhKy'] == null
          ? null
          : DateTime.parse(data['ngayTrinhKy'] as String);
      newItem.listTruongBp = data['listTruongBP'] ?? '';
      newItem.isTruongBp = data['isTruongBP'] ?? false;
      newItem.nguoiTruongBp = data['nguoiTruongBP'] ?? '';
      newItem.ngayTruongBp = data['ngayTruongBP'] == null
          ? null
          : DateTime.parse(data['ngayTruongBP'] as String);
      newItem.ndTruongBpTraVe = data['ndTruongBPTraVe'] ?? '';
      newItem.ndTinhKhaThi = data['ndTinhKhaThi'] ?? '';
      newItem.isLapTrinh = data['isLapTrinh'] ?? false;
      newItem.nguoiLapTrinh = data['nguoiLapTrinh'] ?? '';
      newItem.ngayLapTrinh = data['ngayLapTrinh'] == null
          ? null
          : DateTime.parse(data['ngayLapTrinh'] as String);
      newItem.listTgd = data['listTGD'] ?? '';
      newItem.isTgd = data['isTGD'] ?? false;
      newItem.isKhongTgd = data['isKhongTGD'] ?? false;
      newItem.nguoiTgd = data['nguoiTGD'] ?? '';
      newItem.ngayTgd = data['ngayTGD'] == null
          ? null
          : DateTime.parse(data['ngayTGD'] as String);
      newItem.ndtgd = data['ndtgd'] ?? '';
      newItem.nguoiTao = data['nguoiTao'] ?? '';
      newItem.ngayTao = data['ngayTao'] == null
          ? null
          : DateTime.parse(data['ngayTao'] as String);
      newItem.nguoiSua = data['nguoiSua'] ?? '';
      newItem.ngaySua = data['ngaySua'] == null
          ? null
          : DateTime.parse(data['ngaySua'] as String);
      newItem.barcode = data['barcode'] ?? '';
      newItem.tinhTrang = data['tinhTrang'] ?? -1;

      return newItem;
    } on Exception catch (_) {
      late YeuCauThietKe tempRow = YeuCauThietKe();
      tempRow.idAutoQc = -1;
      return tempRow;
    }
  }

  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'chucVuNhanVien': chucVuNhanVien,
        'ma_chucvu': maChucvu,
        'ma_bophan': maBophan,
        'ma_cty': maCty,
        'tenBoPhan': tenBoPhan,
        'tinhTrangChu': tinhTrangChu,
        'idAutoQC': idAutoQc,
        'maCongTy': maCongTy,
        'ma_nhanvien': maNhanvien,
        'ten_nhanvien': tenNhanvien,
        'congTyKH': congTyKh,
        'isInAn': isInAn,
        'soLuongInAn': soLuongInAn,
        'hangMucThietKe': hangMucThietKe,
        'ndHangMucThietKe': ndHangMucThietKe,
        'quyCachThucHien': quyCachThucHien,
        'yeuCauKhac': yeuCauKhac,
        'mucDichSuDung': mucDichSuDung,
        'ten_cty2': tenCty2,
        'ngayMongMuon': ngayMongMuon,
        'isTrinhKy': isTrinhKy,
        'nguoiTrinhKy': nguoiTrinhKy,
        'ngayTrinhKy': ngayTrinhKy?.toIso8601String(),
        'listTruongBP': listTruongBp,
        'isTruongBP': isTruongBp,
        'nguoiTruongBP': nguoiTruongBp,
        'ngayTruongBP': ngayTruongBp?.toIso8601String(),
        'ndTruongBPTraVe': ndTruongBpTraVe,
        'ndTinhKhaThi': ndTinhKhaThi,
        'isLapTrinh': isLapTrinh,
        'nguoiLapTrinh': nguoiLapTrinh,
        'ngayLapTrinh': ngayLapTrinh?.toIso8601String(),
        'listTGD': listTgd,
        'isTGD': isTgd,
        'isKhongTGD': isKhongTgd,
        'nguoiTGD': nguoiTgd,
        'ngayTGD': ngayTgd?.toIso8601String(),
        'ndtgd': ndtgd,
        'nguoiTao': nguoiTao,
        'ngayTao': ngayTao?.toIso8601String(),
        'nguoiSua': nguoiSua,
        'ngaySua': ngaySua?.toIso8601String(),
        'barcode': barcode,
        'tinhTrang': tinhTrang,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [YeuCauThietKe].
  factory YeuCauThietKe.fromJson(String data) {
    return YeuCauThietKe.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [YeuCauThietKe] to a JSON string.
  String toJson() => json.encode(toMap());

  YeuCauThietKe copyWith({
    String? logoCongTy,
    String? chucVuNhanVien,
    String? maChucvu,
    String? maBophan,
    String? maCty,
    String? tenBoPhan,
    String? tinhTrangChu,
    int? idAutoQc,
    String? maCongTy,
    String? maNhanvien,
    String? tenNhanvien,
    String? congTyKh,
    bool? isInAn,
    String? soLuongInAn,
    int? hangMucThietKe,
    String? ndHangMucThietKe,
    String? quyCachThucHien,
    String? yeuCauKhac,
    String? mucDichSuDung,
    String? tenCty2,
    DateTime? ngayMongMuon,
    bool? isTrinhKy,
    String? nguoiTrinhKy,
    DateTime? ngayTrinhKy,
    String? listTruongBp,
    bool? isTruongBp,
    String? nguoiTruongBp,
    DateTime? ngayTruongBp,
    String? ndTruongBpTraVe,
    String? ndTinhKhaThi,
    bool? isLapTrinh,
    String? nguoiLapTrinh,
    DateTime? ngayLapTrinh,
    String? listTgd,
    bool? isTgd,
    bool? isKhongTgd,
    String? nguoiTgd,
    DateTime? ngayTgd,
    String? ndtgd,
    String? nguoiTao,
    DateTime? ngayTao,
    String? nguoiSua,
    DateTime? ngaySua,
    String? barcode,
    int? tinhTrang,
  }) {
    return YeuCauThietKe(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      chucVuNhanVien: chucVuNhanVien ?? this.chucVuNhanVien,
      maChucvu: maChucvu ?? this.maChucvu,
      maBophan: maBophan ?? this.maBophan,
      maCty: maCty ?? this.maCty,
      tenBoPhan: tenBoPhan ?? this.tenBoPhan,
      tinhTrangChu: tinhTrangChu ?? this.tinhTrangChu,
      idAutoQc: idAutoQc ?? this.idAutoQc,
      maCongTy: maCongTy ?? this.maCongTy,
      maNhanvien: maNhanvien ?? this.maNhanvien,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      congTyKh: congTyKh ?? this.congTyKh,
      isInAn: isInAn ?? this.isInAn,
      soLuongInAn: soLuongInAn ?? this.soLuongInAn,
      hangMucThietKe: hangMucThietKe ?? this.hangMucThietKe,
      ndHangMucThietKe: ndHangMucThietKe ?? this.ndHangMucThietKe,
      quyCachThucHien: quyCachThucHien ?? this.quyCachThucHien,
      yeuCauKhac: yeuCauKhac ?? this.yeuCauKhac,
      mucDichSuDung: mucDichSuDung ?? this.mucDichSuDung,
      tenCty2: tenCty2 ?? this.tenCty2,
      ngayMongMuon: ngayMongMuon ?? this.ngayMongMuon,
      isTrinhKy: isTrinhKy ?? this.isTrinhKy,
      nguoiTrinhKy: nguoiTrinhKy ?? this.nguoiTrinhKy,
      ngayTrinhKy: ngayTrinhKy ?? this.ngayTrinhKy,
      listTruongBp: listTruongBp ?? this.listTruongBp,
      isTruongBp: isTruongBp ?? this.isTruongBp,
      nguoiTruongBp: nguoiTruongBp ?? this.nguoiTruongBp,
      ngayTruongBp: ngayTruongBp ?? this.ngayTruongBp,
      ndTruongBpTraVe: ndTruongBpTraVe ?? this.ndTruongBpTraVe,
      ndTinhKhaThi: ndTinhKhaThi ?? this.ndTinhKhaThi,
      isLapTrinh: isLapTrinh ?? this.isLapTrinh,
      nguoiLapTrinh: nguoiLapTrinh ?? this.nguoiLapTrinh,
      ngayLapTrinh: ngayLapTrinh ?? this.ngayLapTrinh,
      listTgd: listTgd ?? this.listTgd,
      isTgd: isTgd ?? this.isTgd,
      isKhongTgd: isKhongTgd ?? this.isKhongTgd,
      nguoiTgd: nguoiTgd ?? this.nguoiTgd,
      ngayTgd: ngayTgd ?? this.ngayTgd,
      ndtgd: ndtgd ?? this.ndtgd,
      nguoiTao: nguoiTao ?? this.nguoiTao,
      ngayTao: ngayTao ?? this.ngayTao,
      nguoiSua: nguoiSua ?? this.nguoiSua,
      ngaySua: ngaySua ?? this.ngaySua,
      barcode: barcode ?? this.barcode,
      tinhTrang: tinhTrang ?? this.tinhTrang,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! YeuCauThietKe) return false;
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
      tinhTrangChu.hashCode ^
      idAutoQc.hashCode ^
      maCongTy.hashCode ^
      maNhanvien.hashCode ^
      tenNhanvien.hashCode ^
      congTyKh.hashCode ^
      isInAn.hashCode ^
      soLuongInAn.hashCode ^
      hangMucThietKe.hashCode ^
      ndHangMucThietKe.hashCode ^
      quyCachThucHien.hashCode ^
      yeuCauKhac.hashCode ^
      mucDichSuDung.hashCode ^
      tenCty2.hashCode ^
      ngayMongMuon.hashCode ^
      isTrinhKy.hashCode ^
      nguoiTrinhKy.hashCode ^
      ngayTrinhKy.hashCode ^
      listTruongBp.hashCode ^
      isTruongBp.hashCode ^
      nguoiTruongBp.hashCode ^
      ngayTruongBp.hashCode ^
      ndTruongBpTraVe.hashCode ^
      ndTinhKhaThi.hashCode ^
      isLapTrinh.hashCode ^
      nguoiLapTrinh.hashCode ^
      ngayLapTrinh.hashCode ^
      listTgd.hashCode ^
      isTgd.hashCode ^
      isKhongTgd.hashCode ^
      nguoiTgd.hashCode ^
      ngayTgd.hashCode ^
      ndtgd.hashCode ^
      nguoiTao.hashCode ^
      ngayTao.hashCode ^
      nguoiSua.hashCode ^
      ngaySua.hashCode ^
      barcode.hashCode ^
      tinhTrang.hashCode;

  @override
  int getId() {
    return idAutoQc;
  }

  @override
  String getType() {
    return DataHelper.phieuYeuCauThietKeName;
  }
}
