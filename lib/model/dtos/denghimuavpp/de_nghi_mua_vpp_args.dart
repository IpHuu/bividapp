import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class DeNghiMuaVppArgs extends IDocumentArgs<DeNghiMuaVppArgs> {
  int? tinhTrang;
  bool? isApproved;
  int? option;
  String noiDungDuyet;
  String maCongTy;
  String userName;
  int? idDeNghi;
  String listDaiDienCTy;
  String listTgd;
  int? documentId;

  DeNghiMuaVppArgs({
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
    return 'DeNghiMuaVppArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName, idDeNghi: $idDeNghi, listDaiDienCTy: $listDaiDienCTy, listTgd: $listTgd, documentId: $documentId)';
  }

  factory DeNghiMuaVppArgs.fromMap(Map<String, dynamic> data) {
    return DeNghiMuaVppArgs(
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

  @override
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
  /// Parses the string and returns the resulting Json object as [DeNghiMuaVppArgs].
  factory DeNghiMuaVppArgs.fromJson(String data) {
    return DeNghiMuaVppArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiMuaVppArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiMuaVppArgs copyWith({
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
    return DeNghiMuaVppArgs(
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
    if (other is! DeNghiMuaVppArgs) return false;
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
