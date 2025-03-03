import 'dart:convert';

class GiayXinPhepArgs {
  int? option;
  int? giayXinPhepId;
  String? listTgd;
  String? noiDungDuyet;
  String? maCongTy;
  String? userName;
  bool? isApproved;
  int? tinhTrang;

  GiayXinPhepArgs({
    this.option,
    this.tinhTrang,
    this.giayXinPhepId,
    this.listTgd,
    this.noiDungDuyet,
    this.maCongTy,
    this.userName,
    this.isApproved,
  });

  factory GiayXinPhepArgs.fromMap(Map<String, dynamic> data) {
    return GiayXinPhepArgs(
      option: data['option'] as int?,
      tinhTrang: data['tinhTrang'] as int?,
      giayXinPhepId: data['giayXinPhepId'] as int?,
      listTgd: data['listTGD'] as String?,
      noiDungDuyet: data['noiDungDuyet'] as String?,
      maCongTy: data['maCongTy'] as String?,
      userName: data['userName'] as String?,
      isApproved: data['isApproved'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'option': option,
        'tinhTrang': tinhTrang,
        'giayXinPhepId': giayXinPhepId,
        'listTGD': listTgd,
        'noiDungDuyet': noiDungDuyet,
        'maCongTy': maCongTy,
        'userName': userName,
        'isApproved': isApproved,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DocumentApprovedArgs].
  factory GiayXinPhepArgs.fromJson(String data) {
    return GiayXinPhepArgs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DocumentApprovedArgs] to a JSON string.
  String toJson() => json.encode(toMap());
}
