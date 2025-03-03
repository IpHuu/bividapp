// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/denghicapvpp/de_nghi_cap_vpp.dart';
import 'package:bividpharma/model/dtos/denghicapvpp/de_nghi_cap_vpp_args.dart';
import 'package:bividpharma/model/dtos/denghicapvpp/de_nghi_cap_vpp_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:bividpharma/services/base_api_service.dart';
import 'dart:async';

class DeNghiCapVppService extends BaseDocumentService<DeNghiCapVpp,
    DeNghiCapVppArgs, DeNghiCapVppReportArgs> {
  DeNghiCapVppService() : super(ApiCoreService.deNghiCapVppURL);

  static DeNghiCapVppService? _instance;
  static DeNghiCapVppService get instance {
    _instance ??= DeNghiCapVppService();
    return _instance!;
  }

  Future<bool> doApprove(
      {bool? isApproved,
      int? tinhTrang,
      int? idDeNghi,
      String? listTGD,
      String? noiDungDuyet}) async {
    final DeNghiCapVppArgs arg = DeNghiCapVppArgs();

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
  void onLoadPagedCompleted(List<DeNghiCapVpp> list) {
    for (var element in list) {
      if (element.idDeNghi == -1) continue;
      element.logoCongTy =
          "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
    }
  }

  @override
  FromJsonCallback<DeNghiCapVpp> get documentFromJson =>
      (data) => DeNghiCapVpp.fromJson(data);

  @override
  FromMapCallback<DeNghiCapVpp> get documentFromMap =>
      (mapData) => DeNghiCapVpp.fromMap(mapData);

  @override
  FromJsonCallback<DeNghiCapVppReportArgs> get reportItemFromJson =>
      (data) => DeNghiCapVppReportArgs.fromJson(data);

  @override
  CreateObjectCallback<DeNghiCapVppReportArgs> get createEmptyReportItem =>
      () => DeNghiCapVppReportArgs();
}
