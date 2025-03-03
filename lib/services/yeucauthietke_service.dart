// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/yeucauthietke/yeu_cau_thiet_ke.dart';
import 'package:bividpharma/model/dtos/yeucauthietke/yeucauthietke_args.dart';
import 'package:bividpharma/model/dtos/yeucauthietke/yeucauthietke_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/base_api_service.dart';
import 'dart:async';

class YeuCauThietKeService extends BaseDocumentService<YeuCauThietKe,
    YeuCauThietKeArgs, YeuCauThietKeReportArgs> {
  YeuCauThietKeService() : super(ApiCoreService.yeuCauThietKeURL);

  static YeuCauThietKeService? _instance;
  static YeuCauThietKeService get instance {
    _instance ??= YeuCauThietKeService();
    return _instance!;
  }

  Future<bool> doApprove(
      {bool? isApproved,
      int? tinhTrang,
      int? idAutoQC,
      String? listTGD,
      String? noiDungDuyet}) async {
    final YeuCauThietKeArgs arg = YeuCauThietKeArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;
    arg.idAutoQC = idAutoQC;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listTgd = listTGD ?? '';
    arg.maCongTy = '';
    arg.userName = '';
    arg.documentId = idAutoQC;

    final bResult = await approve(arg);
    return bResult;
  }

  @override
  void onLoadPagedCompleted(List<YeuCauThietKe> list) {
    for (var element in list) {
      if (element.idAutoQc == -1) continue;
      element.logoCongTy =
          "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
    }
  }

  @override
  FromJsonCallback<YeuCauThietKe> get documentFromJson =>
      (data) => YeuCauThietKe.fromJson(data);

  @override
  FromMapCallback<YeuCauThietKe> get documentFromMap =>
      (mapData) => YeuCauThietKe.fromMap(mapData);

  @override
  FromJsonCallback<YeuCauThietKeReportArgs> get reportItemFromJson =>
      (data) => YeuCauThietKeReportArgs.fromJson(data);

  @override
  CreateObjectCallback<YeuCauThietKeReportArgs> get createEmptyReportItem =>
      () => YeuCauThietKeReportArgs();
}
