// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/lenhcongtac/lenh_cong_tac.dart';
import 'package:bividpharma/model/dtos/lenhcongtac/lenh_cong_tac_args.dart';
import 'package:bividpharma/model/dtos/lenhcongtac/lenh_cong_tac_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/base_api_service.dart';
import 'dart:async';

class LenhCongTacService extends BaseDocumentService<LenhCongTac,
    LenhCongTacArgs, LenhCongTacReportArgs> {
  LenhCongTacService() : super(ApiCoreService.lenhCongTacURL);

  static LenhCongTacService? _instance;
  static LenhCongTacService get instance {
    _instance ??= LenhCongTacService();
    return _instance!;
  }

  Future<bool> doApprove(
      {bool? isApproved,
      int? tinhTrang,
      int? idGiayXinPhep,
      String? listTGD,
      String? noiDungDuyet}) async {
    final LenhCongTacArgs arg = LenhCongTacArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;
    arg.idGiayXinPhep = idGiayXinPhep;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listTgd = listTGD ?? '';
    arg.maCongTy = '';
    arg.userName = '';
    arg.documentId = idGiayXinPhep;

    final bResult = await approve(arg);
    return bResult;
  }

  @override
  void onLoadPagedCompleted(List<LenhCongTac> list) {
    for (var element in list) {
      if (element.idGiayXinPhep == -1) continue;
      element.logoCongTy =
          "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
    }
  }

  @override
  FromJsonCallback<LenhCongTac> get documentFromJson =>
      (data) => LenhCongTac.fromJson(data);

  @override
  FromMapCallback<LenhCongTac> get documentFromMap =>
      (mapData) => LenhCongTac.fromMap(mapData);

  @override
  FromJsonCallback<LenhCongTacReportArgs> get reportItemFromJson =>
      (data) => LenhCongTacReportArgs.fromJson(data);

  @override
  CreateObjectCallback<LenhCongTacReportArgs> get createEmptyReportItem =>
      () => LenhCongTacReportArgs();
}
