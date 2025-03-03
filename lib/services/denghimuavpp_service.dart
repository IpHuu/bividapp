// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/denghimuavpp/de_nghi_mua_vpp.dart';
import 'package:bividpharma/model/dtos/denghimuavpp/de_nghi_mua_vpp_args.dart';
import 'package:bividpharma/model/dtos/denghimuavpp/de_nghi_mua_vpp_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/base_api_service.dart';
import 'dart:async';

class DeNghiMuaVppService extends BaseDocumentService<DeNghiMuaVpp,
    DeNghiMuaVppArgs, DeNghiMuaVppReportArgs> {
  DeNghiMuaVppService() : super(ApiCoreService.deNghiMuaVppURL);

  static DeNghiMuaVppService? _instance;
  static DeNghiMuaVppService get instance {
    _instance ??= DeNghiMuaVppService();
    return _instance!;
  }

  Future<bool> doApprove(
      {bool? isApproved,
      int? tinhTrang,
      int? idDeNghi,
      String? listTGD,
      String? noiDungDuyet}) async {
    final DeNghiMuaVppArgs arg = DeNghiMuaVppArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;
    arg.idDeNghi = idDeNghi;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listTgd = listTGD ?? '';
    arg.maCongTy = '';
    arg.userName = '';
    arg.documentId = idDeNghi;

    final bResult = await approve(arg);
    return bResult;
  }

  @override
  void onLoadPagedCompleted(List<DeNghiMuaVpp> list) {
    for (var element in list) {
      if (element.idDeNghi == -1) continue;
      element.logoCongTy =
          "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
    }
  }

  @override
  FromJsonCallback<DeNghiMuaVpp> get documentFromJson =>
      (data) => DeNghiMuaVpp.fromJson(data);

  @override
  FromMapCallback<DeNghiMuaVpp> get documentFromMap =>
      (mapData) => DeNghiMuaVpp.fromMap(mapData);

  @override
  FromJsonCallback<DeNghiMuaVppReportArgs> get reportItemFromJson =>
      (data) => DeNghiMuaVppReportArgs.fromJson(data);

  @override
  CreateObjectCallback<DeNghiMuaVppReportArgs> get createEmptyReportItem =>
      () => DeNghiMuaVppReportArgs();
}
