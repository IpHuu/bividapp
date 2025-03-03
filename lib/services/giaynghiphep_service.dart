// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/model/dtos/giayxinphep/giay_xin_phep_report_args.dart';
import 'package:bividpharma/model/dtos/giayxinphep/giayxinphep_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/giayxinphep/giayxinphep.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GiayNghiPhepService {
  static Future<bool> giaynghiphep_approve(
      {bool? isApproved,
      int? tinhTrang,
      int? giayNghiPhepId,
      String? listTGD,
      String? noiDungDuyet}) async {
    final GiayXinPhepArgs arg = GiayXinPhepArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;
    arg.giayXinPhepId = giayNghiPhepId;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listTgd = listTGD ?? "";
    arg.maCongTy = "";
    arg.userName = "";
    Map data = arg.toMap();

    try {
      var url = Uri.parse('${ApiCoreService.giayNghiPhepURL}/approve');
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

  static Future<GiayXinPhep?> giayNghiPhep_LoadOne(int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('${ApiCoreService.giayNghiPhepURL}?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        GiayXinPhep rs = GiayXinPhep.fromJson(response.body);
        return rs;
      }
      return null;
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return null;
  }

  static Future<List<AttachDocument>> giaynghiphep_LoadAttachedFiles(
      int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse(
          '${ApiCoreService.M_HOST_URL}/Signed/giaynghiphep/files?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        final list = ApiCoreService.parseAttachDocument(response.body);
        return list;
      } else {
        return <AttachDocument>[];
      }
    } catch (ex) {
      return <AttachDocument>[];
    }
  }

  static Future<List<GiayXinPhep>> giaynghiphep_LoadPagedData(int pageNo,
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
      //String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse(ApiCoreService.giayNghiPhepURL);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseGiayNghiPhep(response.body);
        List<GiayXinPhep> listResult = [];
        for (var element in list) {
          if (element.idGiayXinPhep == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <GiayXinPhep>[];
      }
    } catch (ex) {
      return <GiayXinPhep>[];
    }
  }

  static Future<GiayXinPhepReportArgs> giaynghiphep_LoadReport(
      int reportId, String companyCode) async {
    try {
      Map<String, String> data = {
        "companyCode": companyCode,
        "reportId": reportId.toString()
      };
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.giayNghiPhepURL}/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        GiayXinPhepReportArgs rs =
            GiayXinPhepReportArgs.fromJson(response.body);
        return rs;
      }
      return GiayXinPhepReportArgs();
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return GiayXinPhepReportArgs();
  }

  static Future<int> giaynghiphep_Create(GiayXinPhep item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.giayNghiPhepCrudURL);
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

  static Future<int> giaynghiphep_Update(GiayXinPhep item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.giayNghiPhepCrudURL);
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

  static Future<bool> giaynghiphep_Delete(GiayXinPhep item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.giayNghiPhepCrudURL);
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

  static Future<bool> giaynghiphep_TrinhKy(GiayXinPhep item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse('${ApiCoreService.giayNghiPhepCrudURL}/trinhky');
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

  static Future<List<GiayXinPhep>> giaynghiphep_GetMyData(
      DocumentSearchParam item) async {
    try {
      Map<String, dynamic> data = {
        "pageNo": item.pageNo,
        "pageItems": item.pageSize,
        "searchText": item.searchText
      };
      var body = json.encode(data);
      var url = Uri.parse('${ApiCoreService.giayNghiPhepCrudURL}/mydata');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseGiayNghiPhep(response.body);
        List<GiayXinPhep> listResult = [];
        for (var element in list) {
          if (element.idGiayXinPhep == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <GiayXinPhep>[];
      }
    } catch (ex) {
      return <GiayXinPhep>[];
    }
  }

  static Future<String> giaynghiphep_LoadAttachedFile(
      int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContext(
        reportId, fileId, '${ApiCoreService.giayNghiPhepURL}/file');
    return rsUrl;
  }

  static List<GiayXinPhep> parseGiayNghiPhep(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<GiayXinPhep>((json) => GiayXinPhep.fromMap(json))
        .toList();
  }
}
