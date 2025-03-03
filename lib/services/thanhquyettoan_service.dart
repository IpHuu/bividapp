// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/phieu_thanh_quyet_toan.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/thanh_quyet_toan_args.dart';
import 'package:bividpharma/model/dtos/thanhquyettoan/thanh_quyet_toan_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;

class PhieuThanhQuyetToanService {
  static Future<bool> phieuThanhQuyetToan_Approve(
      {bool? isApproved,
      int? tinhTrang,
      int? idThanhQuyetToan,
      String? listTgd,
      String? listKeToanPho,
      String? listKeToanTruong,
      String? listKsnb,
      String? listDaiDienCTy,
      String? noiDungDuyet}) async {
    final ThanhQuyetToanArgs arg = ThanhQuyetToanArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;

    arg.idThanhQuyetToan = idThanhQuyetToan;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listKeToanPho = listKeToanPho ?? '';
    arg.listKeToanTruong = listKeToanTruong ?? '';
    arg.listKsnb = listKsnb ?? '';
    arg.listDaiDienCTy = listDaiDienCTy ?? '';
    arg.listTgd = listTgd ?? '';

    arg.maCongTy = "";
    arg.userName = "";

    Map data = arg.toMap();

    try {
      var url = Uri.parse('${ApiCoreService.phieuThanhQuyetToanURL}/approve');
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

  static Future<List<PhieuThanhQuyetToan>> phieuThanhQuyetToan_LoadPagedData(
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
      var url = Uri.parse(ApiCoreService.phieuThanhQuyetToanURL);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parsePhieuThanhQuyetToan(response.body);
        List<PhieuThanhQuyetToan> listResult = [];
        for (var element in list) {
          if (element.idThanhQuyetToan == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <PhieuThanhQuyetToan>[];
      }
    } catch (ex) {
      rethrow;
    }
  }

  static Future<ThanhQuyetToanReportArgs> phieuThanhQuyetToan_LoadReport(
      int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse(
          '${ApiCoreService.phieuThanhQuyetToanURL}/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        ThanhQuyetToanReportArgs rs =
            ThanhQuyetToanReportArgs.fromJson(response.body);
        return rs;
      }
      return const ThanhQuyetToanReportArgs();
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return const ThanhQuyetToanReportArgs();
  }

  static Future<PhieuThanhQuyetToan?> phieuThanhQuyetToan_LoadOne(
      int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.phieuThanhQuyetToanURL}?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        PhieuThanhQuyetToan rs = PhieuThanhQuyetToan.fromJson(response.body);
        return rs;
      }
      return null;
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return null;
  }

  static Future<int> phieuTQT_Create(PhieuThanhQuyetToan item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.phieuTQTCrudURL);
      var body = jsonEncode(data);
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            "Authorization": ApiCoreService.loginTokenId
          },
          body: body);
      if (response.statusCode == 200) {
        var numOk = int.parse(response.body);
        return numOk;
      }
      return -1;
    } catch (ex) {
      return -1;
    }
  }

  static Future<int> phieuTQT_Update(PhieuThanhQuyetToan item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.phieuTQTCrudURL);
      var body = jsonEncode(data);
      var response = await http.put(url,
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            "Authorization": ApiCoreService.loginTokenId
          },
          body: body);
      if (response.statusCode == 200) {
        var numOk = int.parse(response.body);
        return numOk;
      }
      return -1;
    } catch (ex) {
      return -1;
    }
  }

  static Future<bool> phieuTQT_Delete(PhieuThanhQuyetToan item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.phieuTQTCrudURL);
      var body = jsonEncode(data);
      var response = await http.delete(url,
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

  static Future<bool> phieuTQT_TrinhKy(PhieuThanhQuyetToan item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse('${ApiCoreService.phieuTQTCrudURL}/trinhky');
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

  static Future<List<PhieuThanhQuyetToan>> phieuTQT_GetMyData(
      DocumentSearchParam item) async {
    try {
      Map<String, dynamic> data = {
        "pageNo": item.pageNo,
        "pageItems": item.pageSize,
        "searchText": item.searchText
      };
      var body = json.encode(data);
      var url = Uri.parse('${ApiCoreService.phieuTQTCrudURL}/mydata');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parsePhieuThanhQuyetToan(response.body);
        List<PhieuThanhQuyetToan> listResult = [];
        for (var element in list) {
          if (element.idThanhQuyetToan == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <PhieuThanhQuyetToan>[];
      }
    } catch (ex) {
      return <PhieuThanhQuyetToan>[];
    }
  }

/* **************************************************************************** */
  static Future<List<AttachDocument>> phieuThanhQuyetToan_LoadAttachedFiles(
      int reportId) async {
    // final urlPath = '${ApiCoreService.phieuThanhQuyetToanURL}/files';
    final list = await ApiCoreService.loadAttachedFiles(
        DepartmentEnum.PhieuQuyetToan.name, reportId);
    return list;
  }

  static Future<String> phieuThanhQuyetToan_LoadAttachedFile(
      int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContext(
        reportId, fileId, '${ApiCoreService.phieuThanhQuyetToanURL}/file');
    return rsUrl;
  }

  static List<PhieuThanhQuyetToan> parsePhieuThanhQuyetToan(
      String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<PhieuThanhQuyetToan>((json) => PhieuThanhQuyetToan.fromMap(json))
        .toList();
  }
}
