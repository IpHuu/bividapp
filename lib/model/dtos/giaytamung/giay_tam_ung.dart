import 'dart:convert';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class GiayTamUng extends IDocument {
  String logoCongTy;
  int idTamUng;
  int? idKeHoachCongViec;
  int idDeXuatMh;
  String maCongTy;
  String loaiPhieu;
  DateTime? ngayTamUng;
  String nguoiTamUng;
  double? tienTamUng;
  String ngoaiTe;
  String lyDoTamUng;
  String? thoiHanThanhToan;
  double? duyet;
  String barcode;
  String nguoiTao;
  DateTime? ngayTao;
  String nguoiSua;
  DateTime? ngaySua;
  bool? isHuy;
  String nguoiHuy;
  DateTime? ngayHuy;
  bool isTrinhKy;
  DateTime? ngayTrinhKy;
  String nguoiTrinhKy;
  String listTruongBp;
  bool isTruongBp;
  String nguoiTruongBp;
  DateTime? ngayTruongBp;
  String ndTruongBp;
  String listDaiDienCTy;
  bool isDaiDienCTy;
  String nguoiDaiDienCTy;
  DateTime? ngayDaiDienCTy;
  String ndDaiDienCTy;
  String listKeToanPho;
  bool isKeToanPho;
  String nguoiKeToanPho;
  DateTime? ngayKeToanPho;
  String ndKeToanPho;
  String listKeToan;
  bool isKeToan;
  String nguoiKeToan;
  DateTime? ngayKeToan;
  String ndKeToan;
  String listKsnb;
  bool isKsnb;
  String nguoiKsnb;
  DateTime? ngayKsnb;
  String ndksnb;
  String listTgd;
  bool isTgd;
  bool isKhongTgd;
  String nguoiTgd;
  DateTime? ngayTgd;
  String ndtgd;
  bool isTatToan;
  String nguoiTatToan;
  DateTime? ngayiTatToan;
  String soPhieuAuto;
  String tenCty2;
  String tenNhanvien;
  int tinhTrang;
  String tenBoPhan;
  String tinhTrangChu;
  bool hasConvertError = false;

  GiayTamUng({
    this.logoCongTy = '',
    this.idTamUng = -1,
    this.idKeHoachCongViec,
    this.idDeXuatMh = 0,
    this.maCongTy = '',
    this.loaiPhieu = '',
    this.ngayTamUng,
    this.nguoiTamUng = '',
    this.tienTamUng,
    this.ngoaiTe = '',
    this.lyDoTamUng = '',
    this.thoiHanThanhToan,
    this.duyet,
    this.barcode = '',
    this.nguoiTao = '',
    this.ngayTao,
    this.nguoiSua = '',
    this.ngaySua,
    this.isHuy,
    this.nguoiHuy = '',
    this.ngayHuy,
    this.isTrinhKy = false,
    this.ngayTrinhKy,
    this.nguoiTrinhKy = '',
    this.listTruongBp = '',
    this.isTruongBp = false,
    this.nguoiTruongBp = '',
    this.ngayTruongBp,
    this.ndTruongBp = '',
    this.listDaiDienCTy = '',
    this.isDaiDienCTy = false,
    this.nguoiDaiDienCTy = '',
    this.ngayDaiDienCTy,
    this.ndDaiDienCTy = '',
    this.listKeToanPho = '',
    this.isKeToanPho = false,
    this.nguoiKeToanPho = '',
    this.ngayKeToanPho,
    this.ndKeToanPho = '',
    this.listKeToan = '',
    this.isKeToan = false,
    this.nguoiKeToan = '',
    this.ngayKeToan,
    this.ndKeToan = '',
    this.listKsnb = '',
    this.isKsnb = false,
    this.nguoiKsnb = '',
    this.ngayKsnb,
    this.ndksnb = '',
    this.listTgd = '',
    this.isTgd = false,
    this.isKhongTgd = false,
    this.nguoiTgd = '',
    this.ngayTgd,
    this.ndtgd = '',
    this.isTatToan = false,
    this.nguoiTatToan = '',
    this.ngayiTatToan,
    this.soPhieuAuto = '',
    this.tenCty2 = '',
    this.tenNhanvien = '',
    this.tinhTrang = 0,
    this.tenBoPhan = '',
    this.tinhTrangChu = '',
  });

  bool get isHuyValue => isHuy ?? false;

  @override
  String toString() {
    return 'GiayTamUng(logoCongTy: $logoCongTy, idTamUng: $idTamUng, idKeHoachCongViec: $idKeHoachCongViec, idDeXuatMh: $idDeXuatMh, maCongTy: $maCongTy, loaiPhieu: $loaiPhieu, ngayTamUng: $ngayTamUng, nguoiTamUng: $nguoiTamUng, tienTamUng: $tienTamUng, ngoaiTe: $ngoaiTe, lyDoTamUng: $lyDoTamUng, thoiHanThanhToan: $thoiHanThanhToan, duyet: $duyet, barcode: $barcode, nguoiTao: $nguoiTao, ngayTao: $ngayTao, nguoiSua: $nguoiSua, ngaySua: $ngaySua, isHuy: $isHuy, nguoiHuy: $nguoiHuy, ngayHuy: $ngayHuy, isTrinhKy: $isTrinhKy, ngayTrinhKy: $ngayTrinhKy, nguoiTrinhKy: $nguoiTrinhKy, listTruongBp: $listTruongBp, isTruongBp: $isTruongBp, nguoiTruongBp: $nguoiTruongBp, ngayTruongBp: $ngayTruongBp, ndTruongBp: $ndTruongBp, listDaiDienCTy: $listDaiDienCTy, isDaiDienCTy: $isDaiDienCTy, nguoiDaiDienCTy: $nguoiDaiDienCTy, ngayDaiDienCTy: $ngayDaiDienCTy, ndDaiDienCTy: $ndDaiDienCTy, listKeToanPho: $listKeToanPho, isKeToanPho: $isKeToanPho, nguoiKeToanPho: $nguoiKeToanPho, ngayKeToanPho: $ngayKeToanPho, ndKeToanPho: $ndKeToanPho, listKeToan: $listKeToan, isKeToan: $isKeToan, nguoiKeToan: $nguoiKeToan, ngayKeToan: $ngayKeToan, ndKeToan: $ndKeToan, listKsnb: $listKsnb, isKsnb: $isKsnb, nguoiKsnb: $nguoiKsnb, ngayKsnb: $ngayKsnb, ndksnb: $ndksnb, listTgd: $listTgd, isTgd: $isTgd, isKhongTgd: $isKhongTgd, nguoiTgd: $nguoiTgd, ngayTgd: $ngayTgd, ndtgd: $ndtgd, isTatToan: $isTatToan, nguoiTatToan: $nguoiTatToan, ngayiTatToan: $ngayiTatToan, soPhieuAuto: $soPhieuAuto, tenCty2: $tenCty2, tenNhanvien: $tenNhanvien, tinhTrang: $tinhTrang)';
  }

  factory GiayTamUng.fromMap(Map<String, dynamic> data) {
    try {
      final newItem = GiayTamUng();

      newItem.logoCongTy = (data['logoCongTy'] ?? '') ?? '';
      newItem.idTamUng = data['idTamUng'] ?? 0;
      newItem.idKeHoachCongViec = data['idKeHoachCongViec'] ?? 0;
      newItem.idDeXuatMh = data['idDeXuatMH'] ?? 0;
      newItem.maCongTy = data['maCongTy'] ?? '';
      newItem.loaiPhieu = data['loaiPhieu'] ?? '';
      newItem.ngayTamUng = data["ngayTamUng"] != null
          ? DateTime.parse(data["ngayTamUng"])
          : null;
      newItem.nguoiTamUng = data['nguoiTamUng'] ?? '';
      newItem.tienTamUng = data['tienTamUng'] != null
          ? double.parse(data['tienTamUng'].toString())
          : 0.0;
      newItem.ngoaiTe = data['ngoaiTe'] ?? '';
      newItem.lyDoTamUng = data['lyDoTamUng'] ?? '';
      newItem.thoiHanThanhToan = data['thoiHanThanhToan'] ?? '';
      newItem.duyet = (data['duyet'] != null)
          ? double.parse(data['duyet'].toString())
          : 0.0;
      newItem.barcode = data['barcode'] ?? '';
      newItem.nguoiTao = data['nguoiTao'] ?? '';
      newItem.ngayTao =
          data["ngayTao"] != null ? DateTime.parse(data["ngayTao"]) : null;
      newItem.nguoiSua = data['nguoiSua'] ?? '';
      newItem.ngaySua =
          data["ngaySua"] != null ? DateTime.parse(data["ngaySua"]) : null;
      newItem.isHuy = data['isHuy'] ?? false;
      newItem.nguoiHuy = data['nguoiHuy'] ?? '';
      newItem.ngayHuy =
          data["ngayHuy"] != null ? DateTime.parse(data["ngayHuy"]) : null;
      newItem.isTrinhKy = data['isTrinhKy'] ?? false;
      newItem.ngayTrinhKy = data["ngayTrinhKy"] != null
          ? DateTime.parse(data["ngayTrinhKy"])
          : null;
      newItem.nguoiTrinhKy = data['nguoiTrinhKy'] ?? '';
      newItem.listTruongBp = data['listTruongBP'] ?? '';
      newItem.isTruongBp = data['isTruongBP'] ?? false;
      newItem.nguoiTruongBp = data['nguoiTruongBP'] ?? '';
      newItem.ngayTruongBp = data["ngayTruongBp"] != null
          ? DateTime.parse(data["ngayTruongBp"])
          : null;
      newItem.ndTruongBp = data['ndTruongBP'] ?? '';
      newItem.listDaiDienCTy = data['listDaiDienCTy'] ?? '';
      newItem.isDaiDienCTy = data['isDaiDienCTy'] ?? false;
      newItem.nguoiDaiDienCTy = data['nguoiDaiDienCTy'] ?? '';
      newItem.ngayDaiDienCTy = data["ngayDaiDienCTy"] != null
          ? DateTime.parse(data["ngayDaiDienCTy"])
          : null;
      newItem.ndDaiDienCTy = data['ndDaiDienCTy'] ?? '';
      newItem.listKeToanPho = data['listKeToanPho'] ?? '';
      newItem.isKeToanPho = data['isKeToanPho'] ?? false;
      newItem.nguoiKeToanPho = data['nguoiKeToanPho'] ?? '';
      newItem.ngayKeToanPho = data["ngayKeToanPho"] != null
          ? DateTime.parse(data["ngayKeToanPho"])
          : null;
      newItem.ndKeToanPho = data['ndKeToanPho'] ?? '';
      newItem.listKeToan = data['listKeToan'] ?? '';
      newItem.isKeToan = data['isKeToan'] ?? false;
      newItem.nguoiKeToan = data['nguoiKeToan'] ?? '';
      newItem.ngayKeToan = data["ngayKeToan"] != null
          ? DateTime.parse(data["ngayKeToan"])
          : null;
      newItem.ndKeToan = data['ndKeToan'] ?? '';

      newItem.listKsnb = data['listKSNB'] ?? '';
      newItem.isKsnb = data['isKSNB'] ?? false;
      newItem.nguoiKsnb = data['nguoiKSNB'] ?? '';
      newItem.ngayKsnb =
          data["ngayKsnb"] != null ? DateTime.parse(data["ngayKsnb"]) : null;
      newItem.ndksnb = data['ndksnb'] ?? '';
      newItem.listTgd = data['listTGD'] ?? '';
      newItem.isTgd = data['isTGD'] ?? false;
      newItem.isKhongTgd = data['isKhongTGD'] ?? false;
      newItem.nguoiTgd = data['nguoiTGD'] ?? '';
      newItem.ngayTgd =
          data["ngayTgd"] != null ? DateTime.parse(data["ngayTgd"]) : null;
      newItem.ndtgd = data['ndtgd'] ?? '';
      newItem.isTatToan = data['isTatToan'] ?? false;
      newItem.nguoiTatToan = data['nguoiTatToan'] ?? '';
      newItem.ngayiTatToan = data["ngayiTatToan"] != null
          ? DateTime.parse(data["ngayiTatToan"])
          : null;
      newItem.soPhieuAuto = data['soPhieuAuto'] ?? '';
      newItem.tenCty2 = data['ten_cty2'] ?? '';
      newItem.tenNhanvien = data['ten_nhanvien'] ?? '';
      newItem.tinhTrang = data['tinhTrang'] ?? 0;
      newItem.tenBoPhan = data['tenBoPhan'] ?? '';
      newItem.tinhTrangChu = data['tinhTrangChu'] ?? '';
      return newItem;
      // ignore: unused_catch_stack
    } on Exception catch (_, ex) {
      late GiayTamUng tempRow = GiayTamUng();
      tempRow.idTamUng = -1;
      tempRow.hasConvertError = true;
      return tempRow;
    }
  }
  Map<String, dynamic> toMap() => {
        'logoCongTy': logoCongTy,
        'idTamUng': idTamUng,
        'idKeHoachCongViec': idKeHoachCongViec,
        'idDeXuatMH': idDeXuatMh,
        'maCongTy': maCongTy,
        'loaiPhieu': loaiPhieu,
        'ngayTamUng': ngayTamUng?.toIso8601String(),
        'nguoiTamUng': nguoiTamUng,
        'tienTamUng': tienTamUng,
        'ngoaiTe': ngoaiTe,
        'lyDoTamUng': lyDoTamUng,
        'thoiHanThanhToan': thoiHanThanhToan,
        'duyet': duyet,
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
        'listKeToanPho': listKeToanPho,
        'isKeToanPho': isKeToanPho,
        'nguoiKeToanPho': nguoiKeToanPho,
        'ngayKeToanPho': ngayKeToanPho?.toIso8601String(),
        'ndKeToanPho': ndKeToanPho,
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
        'nguoiTatToan': nguoiTatToan,
        'ngayiTatToan': ngayiTatToan,
        'soPhieuAuto': soPhieuAuto,
        'ten_cty2': tenCty2,
        'ten_nhanvien': tenNhanvien,
        'tinhTrang': tinhTrang,
        'tenBoPhan': tenBoPhan,
        'tinhTrangChu': tinhTrangChu,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GiayTamUng].
  factory GiayTamUng.fromJson(String data) {
    return GiayTamUng.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GiayTamUng] to a JSON string.
  String toJson() {
    return json.encode(toMap());
  }

  GiayTamUng copyWith({
    String? logoCongTy,
    int? idTamUng,
    int? idKeHoachCongViec,
    int? idDeXuatMh,
    String? maCongTy,
    String? loaiPhieu,
    DateTime? ngayTamUng,
    String? nguoiTamUng,
    double? tienTamUng,
    String? ngoaiTe,
    String? lyDoTamUng,
    String? thoiHanThanhToan,
    double? duyet,
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
    String? listKeToanPho,
    bool? isKeToanPho,
    String? nguoiKeToanPho,
    DateTime? ngayKeToanPho,
    String? ndKeToanPho,
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
    String? nguoiTatToan,
    DateTime? ngayiTatToan,
    String? soPhieuAuto,
    String? tenCty2,
    String? tenNhanvien,
    int? tinhTrang,
    String? tenBoPhan,
  }) {
    return GiayTamUng(
      logoCongTy: logoCongTy ?? this.logoCongTy,
      idTamUng: idTamUng ?? this.idTamUng,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      idDeXuatMh: idDeXuatMh ?? this.idDeXuatMh,
      maCongTy: maCongTy ?? this.maCongTy,
      loaiPhieu: loaiPhieu ?? this.loaiPhieu,
      ngayTamUng: ngayTamUng ?? this.ngayTamUng,
      nguoiTamUng: nguoiTamUng ?? this.nguoiTamUng,
      tienTamUng: tienTamUng ?? this.tienTamUng,
      ngoaiTe: ngoaiTe ?? this.ngoaiTe,
      lyDoTamUng: lyDoTamUng ?? this.lyDoTamUng,
      thoiHanThanhToan: thoiHanThanhToan ?? this.thoiHanThanhToan,
      duyet: duyet ?? this.duyet,
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
      listKeToanPho: listKeToanPho ?? this.listKeToanPho,
      isKeToanPho: isKeToanPho ?? this.isKeToanPho,
      nguoiKeToanPho: nguoiKeToanPho ?? this.nguoiKeToanPho,
      ngayKeToanPho: ngayKeToanPho ?? this.ngayKeToanPho,
      ndKeToanPho: ndKeToanPho ?? this.ndKeToanPho,
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
      nguoiTatToan: nguoiTatToan ?? this.nguoiTatToan,
      ngayiTatToan: ngayiTatToan ?? this.ngayiTatToan,
      soPhieuAuto: soPhieuAuto ?? this.soPhieuAuto,
      tenCty2: tenCty2 ?? this.tenCty2,
      tenNhanvien: tenNhanvien ?? this.tenNhanvien,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      tenBoPhan: tenBoPhan ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GiayTamUng) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      logoCongTy.hashCode ^
      idTamUng.hashCode ^
      idKeHoachCongViec.hashCode ^
      idDeXuatMh.hashCode ^
      maCongTy.hashCode ^
      loaiPhieu.hashCode ^
      ngayTamUng.hashCode ^
      nguoiTamUng.hashCode ^
      tienTamUng.hashCode ^
      ngoaiTe.hashCode ^
      lyDoTamUng.hashCode ^
      thoiHanThanhToan.hashCode ^
      duyet.hashCode ^
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
      listKeToanPho.hashCode ^
      isKeToanPho.hashCode ^
      nguoiKeToanPho.hashCode ^
      ngayKeToanPho.hashCode ^
      ndKeToanPho.hashCode ^
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
      nguoiTatToan.hashCode ^
      ngayiTatToan.hashCode ^
      soPhieuAuto.hashCode ^
      tenCty2.hashCode ^
      tenNhanvien.hashCode ^
      tinhTrang.hashCode;

  @override
  int getId() {
    return idTamUng;
  }

  @override
  String getType() {
    return loaiPhieu;
  }
}
