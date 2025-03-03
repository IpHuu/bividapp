import 'dart:convert';

class GiayTamUngArgs {
  int? option;
  int? idTamUng;
  String? listKSNB;
  String? noiDungDuyet;
  double? tienTamUng;

  String? maCongTy;
  String? userName;

  bool? isApproved;
  int? tinhTrang;

  GiayTamUngArgs({
    this.option,
    this.tinhTrang,
    this.idTamUng,
    this.listKSNB,
    this.noiDungDuyet,
    this.tienTamUng,
    this.maCongTy,
    this.userName,
    this.isApproved,
  });

  factory GiayTamUngArgs.fromMap(Map<String, dynamic> data) {
    return GiayTamUngArgs(
      option: data['option'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      idTamUng: data['idTamUng'] as int?,
      listKSNB: data['listKSNB'] as String?,
      tienTamUng: data['tienTamUng'] as double?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
      isApproved: data['isApproved'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'option': option,
        'tinhTrang': tinhTrang,
        'idTamUng': idTamUng,
        'listKSNB': listKSNB,
        'tienTamUng': tienTamUng,
        'noiDungDuyet': noiDungDuyet,
        'maCongTy': maCongTy,
        'userName': userName,
        'isApproved': isApproved,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DocumentApprovedArgs].
  factory GiayTamUngArgs.fromJson(String data) {
    return GiayTamUngArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DocumentApprovedArgs] to a JSON string.
  String toJson() => json.encode(toMap());
}
