// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/chiphicongtac/chi_phi_cong_tac.dart';
import 'package:bividpharma/model/dtos/chiphicongtac/chi_phi_cong_tac_args.dart';
import 'package:bividpharma/model/dtos/chiphicongtac/chi_phi_cong_tac_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/base_api_service.dart';
import 'dart:async';

class ChiPhiCongTacService extends BaseDocumentService<ChiPhiCongTac,
    ChiPhiCongTacArgs, ChiPhiCongTacReportArgs> {
  ChiPhiCongTacService() : super(ApiCoreService.chiPhiCongTacURL);

  static ChiPhiCongTacService? _instance;
  static ChiPhiCongTacService get instance {
    _instance ??= ChiPhiCongTacService();
    return _instance!;
  }

  Future<bool> doApprove(
      {bool? isApproved,
      int? tinhTrang,
      int? idGiayXinPhep,
      String? listTGD,
      String? noiDungDuyet}) async {
    final ChiPhiCongTacArgs arg = ChiPhiCongTacArgs();

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
  void onLoadPagedCompleted(List<ChiPhiCongTac> list) {
    for (var element in list) {
      if (element.idGiayXinPhep == -1) continue;
      element.logoCongTy =
          "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
    }
  }

  @override
  FromJsonCallback<ChiPhiCongTac> get documentFromJson =>
      (data) => ChiPhiCongTac.fromJson(data);

  @override
  FromMapCallback<ChiPhiCongTac> get documentFromMap =>
      (mapData) => ChiPhiCongTac.fromMap(mapData);

  @override
  FromJsonCallback<ChiPhiCongTacReportArgs> get reportItemFromJson =>
      (data) => ChiPhiCongTacReportArgs.fromJson(data);

  @override
  CreateObjectCallback<ChiPhiCongTacReportArgs> get createEmptyReportItem =>
      () => ChiPhiCongTacReportArgs();
}
