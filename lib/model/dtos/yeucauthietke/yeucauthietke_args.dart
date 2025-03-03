import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class YeuCauThietKeArgs extends IDocumentArgs<YeuCauThietKeArgs> {
  int? tinhTrang;
  bool? isApproved;
  int? option;
  String? noiDungDuyet;
  String? maCongTy;
  String? userName;
  int? idAutoQC;
  String? listDaiDienCTy;
  String? listTgd;
  String? listTruongBP;
  int? documentId;
  DateTime? ngayMongMuon;

  YeuCauThietKeArgs({
    this.tinhTrang,
    this.isApproved = false,
    this.option = -1,
    this.noiDungDuyet = '',
    this.maCongTy = '',
    this.userName = '',
    this.idAutoQC,
    this.listDaiDienCTy = '',
    this.listTgd = '',
    this.listTruongBP = '',
    this.documentId = 0,
    this.ngayMongMuon,
  });

  @override
  String toString() {
    return 'YeuCauThietKeArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName, idAutoQC: $idAutoQC, listDaiDienCTy: $listDaiDienCTy, listTgd: $listTgd, documentId: $documentId)';
  }

  factory YeuCauThietKeArgs.fromMap(Map<String, dynamic> data) {
    return YeuCauThietKeArgs(
      tinhTrang: data['tinhTrang'] as int?,
      isApproved: data['isApproved'] as bool?,
      option: data['option'] as int?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
      idAutoQC: data['idAutoQC'] as int?,
      listDaiDienCTy: data['listDaiDienCTy'] as String?,
      listTgd: data['listTGD'] as String?,
      documentId: data['documentId'] as int?,
      listTruongBP: data['listTruongBP'] as String?,
      ngayMongMuon: data['ngayMongMuon'] as DateTime?,
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
        'idAutoQC': idAutoQC,
        'listDaiDienCTy': listDaiDienCTy,
        'listTGD': listTgd,
        'documentId': documentId,
        'listTruongBP': listTruongBP,
        'ngayMongMuon': ngayMongMuon,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [YeuCauThietKeArgs].
  factory YeuCauThietKeArgs.fromJson(String data) {
    return YeuCauThietKeArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [YeuCauThietKeArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  YeuCauThietKeArgs copyWith({
    int? tinhTrang,
    bool? isApproved,
    int? option,
    String? noiDungDuyet,
    String? maCongTy,
    String? userName,
    int? idAutoQC,
    String? listDaiDienCTy,
    String? listTgd,
    int? documentId,
    DateTime? ngayMongMuon,
    String? listTruongBP,
  }) {
    return YeuCauThietKeArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      isApproved: isApproved ?? this.isApproved,
      option: option ?? this.option,
      noiDungDuyet: noiDungDuyet ?? this.noiDungDuyet,
      maCongTy: maCongTy ?? this.maCongTy,
      userName: userName ?? this.userName,
      idAutoQC: idAutoQC ?? this.idAutoQC,
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      listTgd: listTgd ?? this.listTgd,
      documentId: documentId ?? this.documentId,
      listTruongBP: listTruongBP ?? this.listTruongBP,
      ngayMongMuon: this.ngayMongMuon,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! YeuCauThietKeArgs) return false;
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
      idAutoQC.hashCode ^
      listDaiDienCTy.hashCode ^
      listTgd.hashCode ^
      documentId.hashCode ^
      listTruongBP.hashCode;
}
