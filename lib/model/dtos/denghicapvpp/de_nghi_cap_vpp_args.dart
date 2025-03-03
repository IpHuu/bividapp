import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class DeNghiCapVppArgs extends IDocumentArgs<DeNghiCapVppArgs> {
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

  DeNghiCapVppArgs({
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
    return 'DeNghiCapVppArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName, idDeNghi: $idDeNghi, listDaiDienCTy: $listDaiDienCTy, listTgd: $listTgd, documentId: $documentId)';
  }

  factory DeNghiCapVppArgs.fromMap(Map<String, dynamic> data) {
    return DeNghiCapVppArgs(
      tinhTrang: data['tinhTrang'] as int?,
      isApproved: data['isApproved'] as bool?,
      option: data['option'] as int?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
      idDeNghi: data['idDeNghi'] as int?,
      listDaiDienCTy: data['listDaiDienCTy'] as String?,
      listTgd: data['listTGD'] as String?,
      documentId: data['documentId'] as int?,
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
  /// Parses the string and returns the resulting Json object as [DeNghiCapVppArgs].
  factory DeNghiCapVppArgs.fromJson(String data) {
    return DeNghiCapVppArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeNghiCapVppArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  DeNghiCapVppArgs copyWith({
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
    return DeNghiCapVppArgs(
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
    if (other is! DeNghiCapVppArgs) return false;
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
