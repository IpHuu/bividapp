import 'dart:convert';

import 'package:collection/collection.dart';

/*
* Ref: vwOnlineDuyet
********************************************/
class OnlineDuyetStep {
  String? mainId;
  String? loaiTrinhky;
  int? id;
  String? maDoituong;
  String? tkId;
  int? stt;
  int? stt1;
  String? tieuDeChuKy;
  String? tieuDeChuKyReport;
  String? loaiNhanvienLoadcombobox;
  String? maUserMacdinh;
  bool? batBuocChon;
  bool? khoa;
  bool? khongDongY;
  bool? themNguoikiemtra;
  bool? ngungThongBao;
  String? tenNoidung1;
  String? tenNoidung2;
  String? tenNoidung3;
  String? tenNoidung4;
  String? tenNoidung5;
  String? tenNoidung6;
  String? tenNoidung7;
  String? noiDung1;
  String? noiDung2;
  String? noiDung3;
  String? noiDung4;
  String? noiDung5;
  String? noiDung6;
  String? noiDung7;
  bool? bbNoidung1;
  bool? bbNoidung2;
  bool? bbNoidung3;
  bool? bbNoidung4;
  bool? bbNoidung5;
  bool? bbNoidung6;
  bool? bbNoidung7;
  String? maUser;
  DateTime? ngayDuyet;
  String? nguoiDuyet;
  bool? duyet;
  bool? canDuyet;
  String? noiDungtrave;
  String? nguoiTra;
  DateTime? ngayTra;
  DateTime? thoiGianNgung;
  String? tenNguoiTra;

  OnlineDuyetStep({
    this.mainId,
    this.loaiTrinhky,
    this.id,
    this.maDoituong,
    this.tkId,
    this.stt,
    this.stt1,
    this.tieuDeChuKy,
    this.tieuDeChuKyReport,
    this.loaiNhanvienLoadcombobox,
    this.maUserMacdinh,
    this.batBuocChon,
    this.khoa,
    this.khongDongY,
    this.themNguoikiemtra,
    this.ngungThongBao,
    this.tenNoidung1,
    this.tenNoidung2,
    this.tenNoidung3,
    this.tenNoidung4,
    this.tenNoidung5,
    this.tenNoidung6,
    this.tenNoidung7,
    this.noiDung1,
    this.noiDung2,
    this.noiDung3,
    this.noiDung4,
    this.noiDung5,
    this.noiDung6,
    this.noiDung7,
    this.bbNoidung1,
    this.bbNoidung2,
    this.bbNoidung3,
    this.bbNoidung4,
    this.bbNoidung5,
    this.bbNoidung6,
    this.bbNoidung7,
    this.maUser,
    this.ngayDuyet,
    this.nguoiDuyet,
    this.duyet,
    this.canDuyet,
    this.noiDungtrave,
    this.nguoiTra,
    this.ngayTra,
    this.thoiGianNgung,
    this.tenNguoiTra,
  });

  @override
  String toString() {
    return 'OnlineDuyetStep(mainId: $mainId, loaiTrinhky: $loaiTrinhky, id: $id, maDoituong: $maDoituong, tkId: $tkId, stt: $stt, stt1: $stt1, tieuDeChuKy: $tieuDeChuKy, tieuDeChuKyReport: $tieuDeChuKyReport, loaiNhanvienLoadcombobox: $loaiNhanvienLoadcombobox, maUserMacdinh: $maUserMacdinh, batBuocChon: $batBuocChon, khoa: $khoa, khongDongY: $khongDongY, themNguoikiemtra: $themNguoikiemtra, ngungThongBao: $ngungThongBao, tenNoidung1: $tenNoidung1, tenNoidung2: $tenNoidung2, tenNoidung3: $tenNoidung3, tenNoidung4: $tenNoidung4, tenNoidung5: $tenNoidung5, tenNoidung6: $tenNoidung6, tenNoidung7: $tenNoidung7, noiDung1: $noiDung1, noiDung2: $noiDung2, noiDung3: $noiDung3, noiDung4: $noiDung4, noiDung5: $noiDung5, noiDung6: $noiDung6, noiDung7: $noiDung7, bbNoidung1: $bbNoidung1, bbNoidung2: $bbNoidung2, bbNoidung3: $bbNoidung3, bbNoidung4: $bbNoidung4, bbNoidung5: $bbNoidung5, bbNoidung6: $bbNoidung6, bbNoidung7: $bbNoidung7, maUser: $maUser, ngayDuyet: $ngayDuyet, nguoiDuyet: $nguoiDuyet, duyet: $duyet, canDuyet: $canDuyet, noiDungtrave: $noiDungtrave, nguoiTra: $nguoiTra, ngayTra: $ngayTra, thoiGianNgung: $thoiGianNgung, tenNguoiTra: $tenNguoiTra)';
  }

  factory OnlineDuyetStep.fromMap(Map<String, dynamic> data) {
    return OnlineDuyetStep(
      mainId: data['main_id'] as String?,
      loaiTrinhky: data['loai_trinhky'] as String?,
      id: data['id'] as int?,
      maDoituong: data['ma_doituong'] as String?,
      tkId: data['tk_id'] as String?,
      stt: data['stt'] as int?,
      stt1: data['stt1'] as int?,
      tieuDeChuKy: data['tieu_de_chu_ky'] as String?,
      tieuDeChuKyReport: data['tieu_de_chu_ky_report'] as String?,
      loaiNhanvienLoadcombobox: data['loai_nhanvien_loadcombobox'] as String?,
      maUserMacdinh: data['ma_user_macdinh'] as String?,
      batBuocChon: data['bat_buoc_chon'] as bool?,
      khoa: data['khoa'] as bool?,
      khongDongY: data['khong_dong_y'] as bool?,
      themNguoikiemtra: data['them_nguoikiemtra'] as bool?,
      ngungThongBao: data['ngung_thong_bao'] as bool?,
      tenNoidung1: data['ten_noidung1'] as String?,
      tenNoidung2: data['ten_noidung2'] as String?,
      tenNoidung3: data['ten_noidung3'] as String?,
      tenNoidung4: data['ten_noidung4'] as String?,
      tenNoidung5: data['ten_noidung5'] as String?,
      tenNoidung6: data['ten_noidung6'] as String?,
      tenNoidung7: data['ten_noidung7'] as String?,
      noiDung1: data['noi_dung1'] as String?,
      noiDung2: data['noi_dung2'] as String?,
      noiDung3: data['noi_dung3'] as String?,
      noiDung4: data['noi_dung4'] as String?,
      noiDung5: data['noi_dung5'] as String?,
      noiDung6: data['noi_dung6'] as String?,
      noiDung7: data['noi_dung7'] as String?,
      bbNoidung1: data['bb_noidung1'] as bool?,
      bbNoidung2: data['bb_noidung2'] as bool?,
      bbNoidung3: data['bb_noidung3'] as bool?,
      bbNoidung4: data['bb_noidung4'] as bool?,
      bbNoidung5: data['bb_noidung5'] as bool?,
      bbNoidung6: data['bb_noidung6'] as bool?,
      bbNoidung7: data['bb_noidung7'] as bool?,
      maUser: data['ma_user'] as String?,
      ngayDuyet: data['ngay_duyet'] == null
          ? null
          : DateTime.parse(data['ngay_duyet'] as String),
      nguoiDuyet: data['nguoi_duyet'] as String?,
      duyet: data['duyet'] as bool?,
      canDuyet: data['can_duyet'] as bool?,
      noiDungtrave: data['noi_dungtrave'] as String?,
      nguoiTra: data['nguoi_tra'] as String?,
      ngayTra: data['ngay_tra'] == null
          ? null
          : DateTime.parse(data['ngay_tra'] as String),
      thoiGianNgung: data['thoi_gian_ngung'] == null
          ? null
          : DateTime.parse(data['thoi_gian_ngung'] as String),
      tenNguoiTra: data['ten_nguoi_tra'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'main_id': mainId,
        'loai_trinhky': loaiTrinhky,
        'id': id,
        'ma_doituong': maDoituong,
        'tk_id': tkId,
        'stt': stt,
        'stt1': stt1,
        'tieu_de_chu_ky': tieuDeChuKy,
        'tieu_de_chu_ky_report': tieuDeChuKyReport,
        'loai_nhanvien_loadcombobox': loaiNhanvienLoadcombobox,
        'ma_user_macdinh': maUserMacdinh,
        'bat_buoc_chon': batBuocChon,
        'khoa': khoa,
        'khong_dong_y': khongDongY,
        'them_nguoikiemtra': themNguoikiemtra,
        'ngung_thong_bao': ngungThongBao,
        'ten_noidung1': tenNoidung1,
        'ten_noidung2': tenNoidung2,
        'ten_noidung3': tenNoidung3,
        'ten_noidung4': tenNoidung4,
        'ten_noidung5': tenNoidung5,
        'ten_noidung6': tenNoidung6,
        'ten_noidung7': tenNoidung7,
        'noi_dung1': noiDung1,
        'noi_dung2': noiDung2,
        'noi_dung3': noiDung3,
        'noi_dung4': noiDung4,
        'noi_dung5': noiDung5,
        'noi_dung6': noiDung6,
        'noi_dung7': noiDung7,
        'bb_noidung1': bbNoidung1,
        'bb_noidung2': bbNoidung2,
        'bb_noidung3': bbNoidung3,
        'bb_noidung4': bbNoidung4,
        'bb_noidung5': bbNoidung5,
        'bb_noidung6': bbNoidung6,
        'bb_noidung7': bbNoidung7,
        'ma_user': maUser,
        'ngay_duyet': ngayDuyet?.toIso8601String(),
        'nguoi_duyet': nguoiDuyet,
        'duyet': duyet,
        'can_duyet': canDuyet,
        'noi_dungtrave': noiDungtrave,
        'nguoi_tra': nguoiTra,
        'ngay_tra': ngayTra?.toIso8601String(),
        'thoi_gian_ngung': thoiGianNgung?.toIso8601String(),
        'ten_nguoi_tra': tenNguoiTra,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OnlineDuyetStep].
  factory OnlineDuyetStep.fromJson(String data) {
    return OnlineDuyetStep.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OnlineDuyetStep] to a JSON string.
  String toJson() => json.encode(toMap());

  OnlineDuyetStep copyWith({
    String? mainId,
    String? loaiTrinhky,
    int? id,
    String? maDoituong,
    String? tkId,
    int? stt,
    int? stt1,
    String? tieuDeChuKy,
    String? tieuDeChuKyReport,
    String? loaiNhanvienLoadcombobox,
    String? maUserMacdinh,
    bool? batBuocChon,
    bool? khoa,
    bool? khongDongY,
    bool? themNguoikiemtra,
    bool? ngungThongBao,
    String? tenNoidung1,
    String? tenNoidung2,
    String? tenNoidung3,
    String? tenNoidung4,
    String? tenNoidung5,
    String? tenNoidung6,
    String? tenNoidung7,
    String? noiDung1,
    String? noiDung2,
    String? noiDung3,
    String? noiDung4,
    String? noiDung5,
    String? noiDung6,
    String? noiDung7,
    bool? bbNoidung1,
    bool? bbNoidung2,
    bool? bbNoidung3,
    bool? bbNoidung4,
    bool? bbNoidung5,
    bool? bbNoidung6,
    bool? bbNoidung7,
    String? maUser,
    DateTime? ngayDuyet,
    String? nguoiDuyet,
    bool? duyet,
    bool? canDuyet,
    String? noiDungtrave,
    String? nguoiTra,
    DateTime? ngayTra,
    DateTime? thoiGianNgung,
    String? tenNguoiTra,
  }) {
    return OnlineDuyetStep(
      mainId: mainId ?? this.mainId,
      loaiTrinhky: loaiTrinhky ?? this.loaiTrinhky,
      id: id ?? this.id,
      maDoituong: maDoituong ?? this.maDoituong,
      tkId: tkId ?? this.tkId,
      stt: stt ?? this.stt,
      stt1: stt1 ?? this.stt1,
      tieuDeChuKy: tieuDeChuKy ?? this.tieuDeChuKy,
      tieuDeChuKyReport: tieuDeChuKyReport ?? this.tieuDeChuKyReport,
      loaiNhanvienLoadcombobox:
          loaiNhanvienLoadcombobox ?? this.loaiNhanvienLoadcombobox,
      maUserMacdinh: maUserMacdinh ?? this.maUserMacdinh,
      batBuocChon: batBuocChon ?? this.batBuocChon,
      khoa: khoa ?? this.khoa,
      khongDongY: khongDongY ?? this.khongDongY,
      themNguoikiemtra: themNguoikiemtra ?? this.themNguoikiemtra,
      ngungThongBao: ngungThongBao ?? this.ngungThongBao,
      tenNoidung1: tenNoidung1 ?? this.tenNoidung1,
      tenNoidung2: tenNoidung2 ?? this.tenNoidung2,
      tenNoidung3: tenNoidung3 ?? this.tenNoidung3,
      tenNoidung4: tenNoidung4 ?? this.tenNoidung4,
      tenNoidung5: tenNoidung5 ?? this.tenNoidung5,
      tenNoidung6: tenNoidung6 ?? this.tenNoidung6,
      tenNoidung7: tenNoidung7 ?? this.tenNoidung7,
      noiDung1: noiDung1 ?? this.noiDung1,
      noiDung2: noiDung2 ?? this.noiDung2,
      noiDung3: noiDung3 ?? this.noiDung3,
      noiDung4: noiDung4 ?? this.noiDung4,
      noiDung5: noiDung5 ?? this.noiDung5,
      noiDung6: noiDung6 ?? this.noiDung6,
      noiDung7: noiDung7 ?? this.noiDung7,
      bbNoidung1: bbNoidung1 ?? this.bbNoidung1,
      bbNoidung2: bbNoidung2 ?? this.bbNoidung2,
      bbNoidung3: bbNoidung3 ?? this.bbNoidung3,
      bbNoidung4: bbNoidung4 ?? this.bbNoidung4,
      bbNoidung5: bbNoidung5 ?? this.bbNoidung5,
      bbNoidung6: bbNoidung6 ?? this.bbNoidung6,
      bbNoidung7: bbNoidung7 ?? this.bbNoidung7,
      maUser: maUser ?? this.maUser,
      ngayDuyet: ngayDuyet ?? this.ngayDuyet,
      nguoiDuyet: nguoiDuyet ?? this.nguoiDuyet,
      duyet: duyet ?? this.duyet,
      canDuyet: canDuyet ?? this.canDuyet,
      noiDungtrave: noiDungtrave ?? this.noiDungtrave,
      nguoiTra: nguoiTra ?? this.nguoiTra,
      ngayTra: ngayTra ?? this.ngayTra,
      thoiGianNgung: thoiGianNgung ?? this.thoiGianNgung,
      tenNguoiTra: tenNguoiTra ?? this.tenNguoiTra,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! OnlineDuyetStep) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      mainId.hashCode ^
      loaiTrinhky.hashCode ^
      id.hashCode ^
      maDoituong.hashCode ^
      tkId.hashCode ^
      stt.hashCode ^
      stt1.hashCode ^
      tieuDeChuKy.hashCode ^
      tieuDeChuKyReport.hashCode ^
      loaiNhanvienLoadcombobox.hashCode ^
      maUserMacdinh.hashCode ^
      batBuocChon.hashCode ^
      khoa.hashCode ^
      khongDongY.hashCode ^
      themNguoikiemtra.hashCode ^
      ngungThongBao.hashCode ^
      tenNoidung1.hashCode ^
      tenNoidung2.hashCode ^
      tenNoidung3.hashCode ^
      tenNoidung4.hashCode ^
      tenNoidung5.hashCode ^
      tenNoidung6.hashCode ^
      tenNoidung7.hashCode ^
      noiDung1.hashCode ^
      noiDung2.hashCode ^
      noiDung3.hashCode ^
      noiDung4.hashCode ^
      noiDung5.hashCode ^
      noiDung6.hashCode ^
      noiDung7.hashCode ^
      bbNoidung1.hashCode ^
      bbNoidung2.hashCode ^
      bbNoidung3.hashCode ^
      bbNoidung4.hashCode ^
      bbNoidung5.hashCode ^
      bbNoidung6.hashCode ^
      bbNoidung7.hashCode ^
      maUser.hashCode ^
      ngayDuyet.hashCode ^
      nguoiDuyet.hashCode ^
      duyet.hashCode ^
      canDuyet.hashCode ^
      noiDungtrave.hashCode ^
      nguoiTra.hashCode ^
      ngayTra.hashCode ^
      thoiGianNgung.hashCode ^
      tenNguoiTra.hashCode;
}
