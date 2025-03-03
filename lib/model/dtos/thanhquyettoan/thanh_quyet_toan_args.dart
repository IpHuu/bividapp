import 'dart:convert';

import 'package:collection/collection.dart';

class ThanhQuyetToanArgs {
  String? maCongTy;
  String? userName;
  int? tinhTrang;
  bool? isApproved;
  int? option;
  int? idThanhQuyetToan;
  String? noiDungDuyet;
  String? listKeToanPho;
  String? listKeToanTruong;
  String? listKsnb;
  String? listDaiDienCTy;
  String? listTgd;

  ThanhQuyetToanArgs({
    this.maCongTy,
    this.userName,
    this.tinhTrang,
    this.isApproved,
    this.option,
    this.idThanhQuyetToan,
    this.noiDungDuyet,
    this.listKeToanPho,
    this.listKeToanTruong,
    this.listKsnb,
    this.listDaiDienCTy,
    this.listTgd,
  });

  @override
  String toString() {
    return 'ThanhQuyetToanArgs(maCongTy: $maCongTy, userName: $userName, tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, idThanhQuyetToan: $idThanhQuyetToan, noiDungDuyet: $noiDungDuyet, listKeToanPho: $listKeToanPho, listKeToanTruong: $listKeToanTruong, listKsnb: $listKsnb, listDaiDienCTy: $listDaiDienCTy)';
  }

  factory ThanhQuyetToanArgs.fromMap(Map<String, dynamic> data) {
    return ThanhQuyetToanArgs(
      maCongTy: data['maCongTy'] ?? '',
      userName: data['userName'] ?? '',
      tinhTrang: data['tinhTrang'] ?? 0,
      isApproved: data['isApproved'] ?? false,
      option: data['option'] ?? 0,
      idThanhQuyetToan: data['idThanhQuyetToan'] ?? 0,
      noiDungDuyet: data['noiDungDuyet'] ?? '',
      listKeToanPho: data['listKeToanPho'] ?? '',
      listKeToanTruong: data['listKeToanTruong'] ?? '',
      listKsnb: data['listKSNB'] ?? '',
      listDaiDienCTy: data['listDaiDienCTy'] ?? '',
      listTgd: data['listTgd'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'maCongTy': maCongTy,
        'userName': userName,
        'tinhTrang': tinhTrang,
        'isApproved': isApproved,
        'option': option,
        'idThanhQuyetToan': idThanhQuyetToan,
        'noiDungDuyet': noiDungDuyet,
        'listKeToanPho': listKeToanPho,
        'listKeToanTruong': listKeToanTruong,
        'listKSNB': listKsnb,
        'listDaiDienCTy': listDaiDienCTy,
        'listTgd': listTgd,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ThanhQuyetToanArgs].
  factory ThanhQuyetToanArgs.fromJson(String data) {
    return ThanhQuyetToanArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ThanhQuyetToanArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  ThanhQuyetToanArgs copyWith({
    String? maCongTy,
    String? userName,
    int? tinhTrang,
    bool? isApproved,
    int? option,
    int? idThanhQuyetToan,
    String? noiDungDuyet,
    String? listKeToanPho,
    String? listKeToanTruong,
    String? listKsnb,
    String? listDaiDienCTy,
    String? listTgd,
  }) {
    return ThanhQuyetToanArgs(
      maCongTy: maCongTy ?? this.maCongTy,
      userName: userName ?? this.userName,
      tinhTrang: tinhTrang ?? this.tinhTrang,
      isApproved: isApproved ?? this.isApproved,
      option: option ?? this.option,
      idThanhQuyetToan: idThanhQuyetToan ?? this.idThanhQuyetToan,
      noiDungDuyet: noiDungDuyet ?? this.noiDungDuyet,
      listKeToanPho: listKeToanPho ?? this.listKeToanPho,
      listKeToanTruong: listKeToanTruong ?? this.listKeToanTruong,
      listKsnb: listKsnb ?? this.listKsnb,
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      listTgd: listTgd ?? this.listTgd,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ThanhQuyetToanArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      maCongTy.hashCode ^
      userName.hashCode ^
      tinhTrang.hashCode ^
      isApproved.hashCode ^
      option.hashCode ^
      idThanhQuyetToan.hashCode ^
      noiDungDuyet.hashCode ^
      listKeToanPho.hashCode ^
      listKeToanTruong.hashCode ^
      listKsnb.hashCode ^
      listDaiDienCTy.hashCode;
}
