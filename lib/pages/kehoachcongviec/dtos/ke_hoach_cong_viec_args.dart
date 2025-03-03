import 'dart:convert';

import 'package:collection/collection.dart';

class KeHoachCongViecArgs {
  int? tinhTrang;
  bool? isApproved;
  int? option;
  int? idKeHoachCongViec;
  String? listTgd;
  String? noiDungDuyet;
  String? maCongTy;
  String? userName;

  KeHoachCongViecArgs({
    this.tinhTrang,
    this.isApproved,
    this.option,
    this.idKeHoachCongViec,
    this.listTgd,
    this.noiDungDuyet,
    this.maCongTy,
    this.userName,
  });

  @override
  String toString() {
    return 'KeHoachCongViecArgs(tinhTrang: $tinhTrang, isApproved: $isApproved, option: $option, idKeHoachCongViec: $idKeHoachCongViec, listTgd: $listTgd, noiDungDuyet: $noiDungDuyet, maCongTy: $maCongTy, userName: $userName)';
  }

  factory KeHoachCongViecArgs.fromMap(Map<String, dynamic> data) {
    return KeHoachCongViecArgs(
      tinhTrang: data['tinhTrang'] as int?,
      isApproved: data['isApproved'] as bool?,
      option: data['option'] as int?,
      idKeHoachCongViec: data['idKeHoachCongViec'] as int?,
      listTgd: data['listTGD'] as String?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'tinhTrang': tinhTrang,
        'isApproved': isApproved,
        'option': option,
        'idKeHoachCongViec': idKeHoachCongViec,
        'listTGD': listTgd,
        'noiDungDuyet': noiDungDuyet,
        'maCongTy': maCongTy,
        'userName': userName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [KeHoachCongViecArgs].
  factory KeHoachCongViecArgs.fromJson(String data) {
    return KeHoachCongViecArgs.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [KeHoachCongViecArgs] to a JSON string.
  String toJson() => json.encode(toMap());

  KeHoachCongViecArgs copyWith({
    int? tinhTrang,
    bool? isApproved,
    int? option,
    int? idKeHoachCongViec,
    String? listTgd,
    String? noiDungDuyet,
    String? maCongTy,
    String? userName,
  }) {
    return KeHoachCongViecArgs(
      tinhTrang: tinhTrang ?? this.tinhTrang,
      isApproved: isApproved ?? this.isApproved,
      option: option ?? this.option,
      idKeHoachCongViec: idKeHoachCongViec ?? this.idKeHoachCongViec,
      listTgd: listTgd ?? this.listTgd,
      noiDungDuyet: noiDungDuyet ?? this.noiDungDuyet,
      maCongTy: maCongTy ?? this.maCongTy,
      userName: userName ?? this.userName,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! KeHoachCongViecArgs) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      tinhTrang.hashCode ^
      isApproved.hashCode ^
      option.hashCode ^
      idKeHoachCongViec.hashCode ^
      listTgd.hashCode ^
      noiDungDuyet.hashCode ^
      maCongTy.hashCode ^
      userName.hashCode;
}
