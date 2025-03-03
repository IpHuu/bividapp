import 'dart:convert';

import 'package:collection/collection.dart';

class GiayRaCongArgs {
  int? tinhTrang;
  bool? isApproved;
  int? option;
  String? noiDungDuyet;
  String? maCongTy;
  String? userName;
  int? giayXinPhepId;
  String? listTgd;
  int? documentId;

  GiayRaCongArgs({
    this.tinhTrang,
    this.isApproved,
    this.option,
    this.noiDungDuyet,
    this.maCongTy,
    this.userName,
    this.giayXinPhepId,
    this.listTgd,
    this.documentId,
  });

  @override
  String toString() {
    return 'GiayRaCongArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName, giayXinPhepId: $giayXinPhepId, listTgd: $listTgd, documentId: $documentId)';
  }

  factory GiayRaCongArgs.fromMap(Map<String, dynamic> data) {
    return GiayRaCongArgs(
      tinhTrang: data['tinhTrang'] as int?,
      isApproved: data['isApproved'] as bool?,
      option: data['option'] as int?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
      giayXinPhepId: data['giayXinPhepId'] as int?,
      listTgd: data['listTGD'] as String?,
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
        'giayXinPhepId': giayXinPhepId,
        'listTGD': listTgd,
        'documentId': documentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GiayRaCongArgs].
  factory GiayRaCongArgs.fromJson(String data) {
    return GiayRaCongArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GiayRaCongArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  GiayRaCongArgs copyWith({
    int? tinhTrang,
    bool? isApproved,
    int? option,
    String? noiDungDuyet,
    String? maCongTy,
    String? userName,
    int? giayXinPhepId,
    String? listTgd,
    int? documentId,
  }) {
    return GiayRaCongArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      isApproved: isApproved ?? this.isApproved,
      option: option ?? this.option,
      noiDungDuyet: noiDungDuyet ?? this.noiDungDuyet,
      maCongTy: maCongTy ?? this.maCongTy,
      userName: userName ?? this.userName,
      giayXinPhepId: giayXinPhepId ?? this.giayXinPhepId,
      listTgd: listTgd ?? this.listTgd,
      documentId: documentId ?? this.documentId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GiayRaCongArgs) return false;
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
      giayXinPhepId.hashCode ^
      listTgd.hashCode ^
      documentId.hashCode;
}
