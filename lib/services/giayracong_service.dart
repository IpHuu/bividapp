// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';
import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong.dart';
import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong_args.dart';
import 'package:bividpharma/model/dtos/giayracong/giay_ra_cong_report_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GiayRaCongService {
  static Future<bool> giayRaCong_approve(
      {bool? isApproved,
      int? tinhTrang,
      int? giayRaCongId,
      String? listTGD,
      String? noiDungDuyet}) async {
    final GiayRaCongArgs arg = GiayRaCongArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;
    arg.giayXinPhepId = giayRaCongId;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listTgd = listTGD ?? '';
    arg.maCongTy = '';
    arg.userName = '';
    arg.documentId = giayRaCongId;

    Map data = arg.toMap();

    try {
      var url = Uri.parse('${ApiCoreService.giayRaCongURL}/approve');
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

  static Future<GiayRaCong?> giayRaCong_LoadOne(int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('${ApiCoreService.giayRaCongURL}?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        GiayRaCong rs = GiayRaCong.fromJson(response.body);
        return rs;
      }
      return null;
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return null;
  }

  static Future<List<AttachDocument>> giayRaCong_LoadAttachedFiles(
      int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse(
          '${ApiCoreService.M_HOST_URL}/Signed/giayracong/files?$paramString');
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

  static Future<List<GiayRaCong>> giayRaCong_LoadPagedData(int pageNo,
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
      var url = Uri.parse(ApiCoreService.giayRaCongURL);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseGiayRaCong(response.body);
        List<GiayRaCong> listResult = [];
        for (var element in list) {
          if (element.idGiayXinPhep == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <GiayRaCong>[];
      }
    } catch (ex) {
      rethrow;
    }
  }

  static Future<GiayRaCongReportArgs> giayRaCong_LoadReport(
      int reportId, String companyCode) async {
    try {
      Map<String, String> data = {
        "companyCode": companyCode,
        "reportId": reportId.toString()
      };
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.giayRaCongURL}/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        GiayRaCongReportArgs rs = GiayRaCongReportArgs.fromJson(response.body);
        return rs;
      }
      return GiayRaCongReportArgs();
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return GiayRaCongReportArgs();
  }

  static Future<String> giayRaCong_LoadAttachedFile(
      int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContext(
        reportId, fileId, '${ApiCoreService.giayRaCongURL}/file');
    return rsUrl;
  }

  static List<GiayRaCong> parseGiayRaCong(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<GiayRaCong>((json) => GiayRaCong.fromMap(json)).toList();
  }
}
