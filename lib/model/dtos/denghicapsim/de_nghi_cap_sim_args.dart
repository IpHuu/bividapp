import 'dart:convert';

import 'package:collection/collection.dart';

class DeNghiCapSimArgs {
  int? tinhTrang;
  bool? isApproved;
  int? option;
  String? noiDungDuyet;
  String? maCongTy;
  String? userName;
  int? idDeNghi;
  String? listDaiDienCTy;
  String? listTgd;
  int? documentId;

  DeNghiCapSimArgs({
    this.tinhTrang,
    this.isApproved,
    this.option,
    this.noiDungDuyet = '',
    this.maCongTy = '',
    this.userName = '',
    this.idDeNghi,
    this.listDaiDienCTy = '',
    this.listTgd = '',
    this.documentId,
  });

  @override
  String toString() {
    return 'DeNghiCapSimArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName, idDeNghi: $idDeNghi, listDaiDienCTy: $listDaiDienCTy, listTgd: $listTgd, documentId: $documentId)';
  }

  factory DeNghiCapSimArgs.fromMap(Map<String, dynamic> data) {
    return DeNghiCapSimArgs(
      tinhTrang: data['tinhTrang'] ?? 0,
      isApproved: data['isApproved'] ?? false,
      option: data['option'] ?? 0,
      noiDungDuyet: data['noiDungDuyet'] ?? '',
      maCongTy: data['maCongTy'] ?? '',
      userName: data['userName'] ?? '',
      idDeNghi: data['idDeNghi'] ?? 0,
      listDaiDienCTy: data['listDaiDienCTy'] ?? '',
      listTgd: data['listTGD'] ?? '',
      documentId: data['documentId'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
        'tinhTrang': tinhTrang,
        'isApproved': isApproved,
        'option': option,
        'noiDungDuyet': noiDungDuyet,
        'maCongTy': maCongTy,
        'userName': userName,
        'idDeNghi': idDeNghi,
        'listDaiDienCTy': listDaiDienCTy,
        'listTGD': listTgd,
        'documentId': documentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeNghiCapSimArgs].
  factory DeNghiCapSimArgs.fromJson(String data) {
    return DeNghiCapSimArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiCapSimArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiCapSimArgs copyWith({
    int? tinhTrang,
    bool? isApproved,
    int? option,
    String? noiDungDuyet,
    String? maCongTy,
    String? userName,
    int? idDeNghi,
    String? listDaiDienCTy,
    String? listTgd,
    int? documentId,
  }) {
    return DeNghiCapSimArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      isApproved: isApproved ?? this.isApproved,
      option: option ?? this.option,
      noiDungDuyet: noiDungDuyet ?? this.noiDungDuyet,
      maCongTy: maCongTy ?? this.maCongTy,
      userName: userName ?? this.userName,
      idDeNghi: idDeNghi ?? this.idDeNghi,
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      listTgd: listTgd ?? this.listTgd,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeNghiCapSimArgs) return false;
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
      idDeNghi.hashCode ^
      listDaiDienCTy.hashCode ^
      listTgd.hashCode ^
      documentId.hashCode;
}
