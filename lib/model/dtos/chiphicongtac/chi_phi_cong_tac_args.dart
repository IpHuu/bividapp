import 'dart:convert';

import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:collection/collection.dart';

class ChiPhiCongTacArgs extends IDocumentArgs<ChiPhiCongTacArgs> {
  int? tinhTrang;
  bool? isApproved;
  int? option;
  String? noiDungDuyet;
  String? maCongTy;
  String? userName;
  int? idGiayXinPhep;
  String? listDaiDienCTy;
  String? listTgd;
  int? documentId;

  ChiPhiCongTacArgs({
    this.tinhTrang,
    this.isApproved,
    this.option,
    this.noiDungDuyet = '',
    this.maCongTy = '',
    this.userName = '',
    this.idGiayXinPhep,
    this.listDaiDienCTy = '',
    this.listTgd = '',
    this.documentId,
  });

  @override
  String toString() {
    return 'ChiPhiCongTacArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName, idGiayXinPhep: $idGiayXinPhep, listDaiDienCTy: $listDaiDienCTy, listTgd: $listTgd, documentId: $documentId)';
  }

  factory ChiPhiCongTacArgs.fromMap(Map<String, dynamic> data) {
    return ChiPhiCongTacArgs(
      tinhTrang: data['tinhTrang'] as int?,
      isApproved: data['isApproved'] as bool?,
      option: data['option'] as int?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
      idGiayXinPhep: data['idGiayXinPhep'] as int?,
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
        'idGiayXinPhep': idGiayXinPhep,
        'listDaiDienCTy': listDaiDienCTy,
        'listTGD': listTgd,
        'documentId': documentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChiPhiCongTacArgs].
  factory ChiPhiCongTacArgs.fromJson(String data) {
    return ChiPhiCongTacArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChiPhiCongTacArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  ChiPhiCongTacArgs copyWith({
    int? tinhTrang,
    bool? isApproved,
    int? option,
    String? noiDungDuyet,
    String? maCongTy,
    String? userName,
    int? idGiayXinPhep,
    String? listDaiDienCTy,
    String? listTgd,
    int? documentId,
  }) {
    return ChiPhiCongTacArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      isApproved: isApproved ?? this.isApproved,
      option: option ?? this.option,
      noiDungDuyet: noiDungDuyet ?? this.noiDungDuyet,
      maCongTy: maCongTy ?? this.maCongTy,
      userName: userName ?? this.userName,
      idGiayXinPhep: idGiayXinPhep ?? this.idGiayXinPhep,
      listDaiDienCTy: listDaiDienCTy ?? this.listDaiDienCTy,
      listTgd: listTgd ?? this.listTgd,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ChiPhiCongTacArgs) return false;
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
      idGiayXinPhep.hashCode ^
      listDaiDienCTy.hashCode ^
      listTgd.hashCode ^
      documentId.hashCode;
}
