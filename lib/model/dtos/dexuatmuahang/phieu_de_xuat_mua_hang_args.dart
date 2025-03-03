import 'dart:convert';

import 'package:collection/collection.dart';

class PhieuDeXuatMuaHangArgs {
  int? tinhTrang;
  bool? isApproved;
  int? option;
  String? noiDungDuyet;
  String? maCongTy;
  String? userName;
  int? idDeXuatMh;
  String? listKeToan;
  String? listKsnb;
  String? listDaiDienCTy;
  int? documentId;

  PhieuDeXuatMuaHangArgs({
    this.tinhTrang,
    this.isApproved,
    this.option,
    this.noiDungDuyet,
    this.maCongTy,
    this.userName,
    this.idDeXuatMh,
    this.listKeToan,
    this.listKsnb,
    this.listDaiDienCTy,
    this.documentId,
  });

  @override
  String toString() {
    return 'PhieuDeXuatMuaHangArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName, idDeXuatMh: $idDeXuatMh, listKeToan: $listKeToan, listKsnb: $listKsnb, listDaiDienCTy: $listDaiDienCTy, documentId: $documentId)';
  }

  factory PhieuDeXuatMuaHangArgs.fromMap(Map<String, dynamic> data) {
    return PhieuDeXuatMuaHangArgs(
      tinhTrang: data['tinhTrang'] as int?,
      isApproved: data['isApproved'] as bool?,
      option: data['option'] as int?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
      idDeXuatMh: data['idDeXuatMH'] as int?,
      listKeToan: data['listKeToan'] as String?,
      listKsnb: data['listKSNB'] as String?,
      listDaiDienCTy: data['listDaiDienCTy'] as String?,
      documentId: data['documentId'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'tinhTrang': tinhTrang,
        'isApproved': isApproved,
        'option': option,
        'noiDungDuyet': noiDungDuyet,
        'maCongTy': maCongTy,
        'userName': userName,
        'idDeXuatMH': idDeXuatMh,
        'listKeToan': listKeToan,
        'listKSNB': listKsnb,
        'listDaiDienCTy': listDaiDienCTy,
        'documentId': documentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PhieuDeXuatMuaHangArgs].
  factory PhieuDeXuatMuaHangArgs.fromJson(String data) {
    return PhieuDeXuatMuaHangArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PhieuDeXuatMuaHangArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  PhieuDeXuatMuaHangArgs copyWith({
    int? tinhTrang,
    bool? isApproved,
    int? option,
    String? noiDungDuyet,
    String? maCongTy,
    String? userName,
    int? idDeXuatMh,
    String? listKeToan,
    String? listKsnb,
    String? listDaiDienCTy,
    int? documentId,
  }) {
    return PhieuDeXuatMuaHangArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      isApproved: isApproved ?? this.isApproved,
      option: option ?? this.option,
      noiDungDuyet: noiDungDuyet ?? this.noiDungDuyet,
      maCongTy: maCongTy ?? this.maCongTy,
      userName: userName ?? this.userName,
      idDeXuatMh: idDeXuatMh ?? this.idDeXuatMh,
      listKeToan: listKeToan ?? this.listKeToan,
      listKsnb: listKsnb ?? this.listKsnb,
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PhieuDeXuatMuaHangArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      tinhTrang.hashCode ^
      isApproved.hashCode ^
      option.hashCode ^
      noiDungDuyet.hashCode ^
      maCongTy.hashCode ^
      userName.hashCode ^
      idDeXuatMh.hashCode ^
      listKeToan.hashCode ^
      listKsnb.hashCode ^
      listDaiDienCTy.hashCode ^
      documentId.hashCode;
}
