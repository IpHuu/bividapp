// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';

import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/dexuatmuahang/dxmh_report_args.dart';
import 'package:bividpharma/model/dtos/dexuatmuahang/phieu_de_xuat_mua_hang.dart';
import 'package:bividpharma/model/dtos/dexuatmuahang/phieu_de_xuat_mua_hang_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class PhieuDeXuatMuaHangService {
  static Future<bool> phieuDeXuatMuaHang_Approve(
      {bool? isApproved,
      int? tinhTrang,
      int? idDeXuatMh,
      String? listKeToan,
      String? listKsnb,
      String? listDaiDienCTy,
      String? noiDungDuyet}) async {
    final PhieuDeXuatMuaHangArgs arg = PhieuDeXuatMuaHangArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;

    arg.idDeXuatMh = idDeXuatMh;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listKeToan = listKeToan ?? '';
    arg.listKsnb = listKsnb ?? '';
    arg.listDaiDienCTy = listDaiDienCTy ?? '';

    arg.maCongTy = "";
    arg.userName = "";

    arg.documentId = idDeXuatMh;

    Map data = arg.toMap();

    try {
      var url = Uri.parse('${ApiCoreService.giayDeXuatMuaHangURL}/approve');
      var body = jsonEncode(data);
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            "Authorization": ApiCoreService.loginTokenId
          },
          body: body);
      if (response.statusCode == 200) {
        var numOk = int.parse(response.body);
        if (numOk > 0) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    } catch (ex) {
      return false;
    }
  }

  static Future<List<PhieuDeXuatMuaHang>> phieuDeXuatMuaHang_LoadPagedData(
      int pageNo,
      int pageItems,
      bool finished,
      int filterType,
      String searchText) async {
    try {
      Map<String, dynamic> data = {
        "pageNo": pageNo,
        "pageItems": pageItems,
        "finished": finished,
        "filterType": filterType,
        "searchText": searchText
      };
      var body = json.encode(data);
      var url = Uri.parse(ApiCoreService.giayDeXuatMuaHangURL);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parsePhieuDeXuatMuaHang(response.body);
        List<PhieuDeXuatMuaHang> listResult = [];
        for (var element in list) {
          if (element.idDeXuatMh == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <PhieuDeXuatMuaHang>[];
      }
    } catch (ex) {
      rethrow;
    }
  }

  static Future<DxmhReportArgs> phieuDeXuatMuaHang_LoadReport(
      int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse(
          '${ApiCoreService.giayDeXuatMuaHangURL}/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        DxmhReportArgs rs = DxmhReportArgs.fromJson(response.body);
        return rs;
      }
      return DxmhReportArgs();
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return DxmhReportArgs();
  }

  static Future<PhieuDeXuatMuaHang?> phieuDeXuatMuaHang_LoadOne(
      int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.giayDeXuatMuaHangURL}?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        PhieuDeXuatMuaHang rs = PhieuDeXuatMuaHang.fromJson(response.body);
        return rs;
      }
      return null;
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return null;
  }

  static Future<List<AttachDocument>> phieuDeXuatMuaHang_LoadAttachedFiles(
      int reportId) async {
    final list = await ApiCoreService.loadAttachedFiles(
        DepartmentEnum.PhieuDeXuatMuaHang.name, reportId);
    return list;
  }

  static Future<String> phieuDeXuatMuaHang_LoadAttachedFile(
      int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContext(
        reportId, fileId, '${ApiCoreService.giayDeXuatMuaHangURL}/file');
    return rsUrl;
  }

  static List<PhieuDeXuatMuaHang> parsePhieuDeXuatMuaHang(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<PhieuDeXuatMuaHang>((json) => PhieuDeXuatMuaHang.fromMap(json))
        .toList();
  }
}
