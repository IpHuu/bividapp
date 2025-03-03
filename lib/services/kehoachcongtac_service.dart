// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac.dart';
import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac_args.dart';
import 'package:bividpharma/model/dtos/kehoachcongtac/ke_hoach_cong_tac_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/base_api_service.dart';
import 'dart:async';

class KeHoachCongTacService extends BaseDocumentService<KeHoachCongTac,
    KeHoachCongTacArgs, KeHoachCongTacReportArgs> {
  KeHoachCongTacService() : super(ApiCoreService.keHoachCongTacURL);

  static KeHoachCongTacService? _instance;
  static KeHoachCongTacService get instance {
    _instance ??= KeHoachCongTacService();
    return _instance!;
  }

  Future<bool> doApprove(
      {bool? isApproved,
      int? tinhTrang,
      int? idGiayXinPhep,
      String? listTGD,
      String? noiDungDuyet}) async {
    final KeHoachCongTacArgs arg = KeHoachCongTacArgs();

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
  void onLoadPagedCompleted(List<KeHoachCongTac> list) {
    for (var element in list) {
      if (element.idGiayXinPhep == -1) continue;
      element.logoCongTy =
          "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
    }
  }

  @override
  FromJsonCallback<KeHoachCongTac> get documentFromJson =>
      (data) => KeHoachCongTac.fromJson(data);

  @override
  FromMapCallback<KeHoachCongTac> get documentFromMap =>
      (mapData) => KeHoachCongTac.fromMap(mapData);

  @override
  FromJsonCallback<KeHoachCongTacReportArgs> get reportItemFromJson =>
      (data) => KeHoachCongTacReportArgs.fromJson(data);

  @override
  CreateObjectCallback<KeHoachCongTacReportArgs> get createEmptyReportItem =>
      () => KeHoachCongTacReportArgs();
}
