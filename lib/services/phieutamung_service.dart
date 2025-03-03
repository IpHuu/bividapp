// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/giaytamung/giay_tam_ung_report_args.dart';
import 'package:bividpharma/model/dtos/giaytamung/giaytamung_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/giaytamung/giay_tam_ung.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GiayTamUngService {
  static Future<bool> giayTamUng_Approve(
      {bool? isApproved,
      int? tinhTrang,
      int? idTamUng,
      String? listKSNB,
      double? tienTamUng,
      String? noiDungDuyet}) async {
    final GiayTamUngArgs arg = GiayTamUngArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;

    arg.idTamUng = idTamUng;
    arg.tienTamUng = tienTamUng ?? 0;
    arg.noiDungDuyet = noiDungDuyet;
    arg.listKSNB = listKSNB ?? "";
    arg.maCongTy = "";
    arg.userName = "";

    Map data = arg.toMap();

    try {
      var url = Uri.parse('${ApiCoreService.giayTamUngURL}/approve');
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

  static Future<List<GiayTamUng>> giayTamUng_LoadPagedData(int pageNo,
      int pageItems, bool finished, int filterType, String searchText) async {
    try {
      Map<String, dynamic> data = {
        "pageNo": pageNo,
        "pageItems": pageItems,
        "finished": finished,
        "filterType": filterType,
        "searchText": searchText
      };
      var body = json.encode(data);
      var url = Uri.parse(ApiCoreService.giayTamUngURL);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseGiayTamUng(response.body);
        List<GiayTamUng> listResult = [];
        for (var element in list) {
          if (element.idTamUng == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <GiayTamUng>[];
      }
    } catch (ex) {
      rethrow;
    }
  }

  static Future<GiayTamUngReportArgs> giayTamUng_LoadReport(
      int reportId, String companyCode) async {
    try {
      Map<String, String> data = {
        "reportId": reportId.toString(),
        "companyCode": companyCode
      };
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.giayTamUngURL}/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        GiayTamUngReportArgs rs = GiayTamUngReportArgs.fromJson(response.body);
        return rs;
      }
      return GiayTamUngReportArgs();
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return GiayTamUngReportArgs();
  }

  static Future<GiayTamUng?> giayTamUng_LoadOne(int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('${ApiCoreService.giayTamUngURL}?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        GiayTamUng rs = GiayTamUng.fromJson(response.body);
        return rs;
      }
      return null;
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return null;
  }

  static Future<int> giaytamung_Create(GiayTamUng item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.giayTamUngCrudURL);
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

  static Future<int> giaytamung_Update(GiayTamUng item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.giayTamUngCrudURL);
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

  static Future<bool> giaytamung_Delete(GiayTamUng item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.giayTamUngCrudURL);
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

  static Future<bool> giaytamung_TrinhKy(GiayTamUng item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse('${ApiCoreService.giayTamUngCrudURL}/trinhky');
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

  static Future<List<GiayTamUng>> giaytamung_GetMyData(
      DocumentSearchParam item) async {
    try {
      Map<String, dynamic> data = {
        "pageNo": item.pageNo,
        "pageItems": item.pageSize,
        "searchText": item.searchText
      };
      var body = json.encode(data);
      var url = Uri.parse('${ApiCoreService.giayTamUngCrudURL}/mydata');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseGiayTamUng(response.body);
        List<GiayTamUng> listResult = [];
        for (var element in list) {
          if (element.idTamUng == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <GiayTamUng>[];
      }
    } catch (ex) {
      return <GiayTamUng>[];
    }
  }

/* ***************************************************** */
  static Future<List<AttachDocument>> giayTamUng_LoadAttachedFiles(
      int reportId) async {
    // final urlPath = '${ApiCoreService.giayTamUngURL}/files';
    final list = await ApiCoreService.loadAttachedFiles(
        DepartmentEnum.PhieuTamUng.name, reportId);
    return list;
  }

  static Future<String> giayTamUng_LoadAttachedFile(
      int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContext(
        reportId, fileId, '${ApiCoreService.giayTamUngURL}/file');
    return rsUrl;
  }

  static List<GiayTamUng> parseGiayTamUng(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<GiayTamUng>((json) => GiayTamUng.fromMap(json)).toList();
  }
}
