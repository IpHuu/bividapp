// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';
import 'package:bividpharma/model/dtos/denghicapsim/de_nghi_cap_sim.dart';
import 'package:bividpharma/model/dtos/denghicapsim/de_nghi_cap_sim_args.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/denghicapsim/de_nghi_cap_sim_report_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class DeNghiCapSimService {
  static Future<bool> deNghiCapSim_approve(
      {bool? isApproved,
      int? tinhTrang,
      int? idDeNghi,
      String? listTGD,
      String? noiDungDuyet}) async {
    final DeNghiCapSimArgs arg = DeNghiCapSimArgs();

    arg.option = 0;
    arg.isApproved = isApproved;
    arg.tinhTrang = tinhTrang;
    arg.idDeNghi = idDeNghi;
    arg.noiDungDuyet = noiDungDuyet ?? '';

    arg.listTgd = listTGD ?? '';
    arg.maCongTy = '';
    arg.userName = '';
    arg.documentId = idDeNghi;

    Map data = arg.toMap();

    try {
      var url = Uri.parse('${ApiCoreService.deNghiCapSimURL}/approve');
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

  static Future<DeNghiCapSim?> deNghiCapSim_LoadOne(int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('${ApiCoreService.deNghiCapSimURL}?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        DeNghiCapSim rs = DeNghiCapSim.fromJson(response.body);
        return rs;
      }
      return null;
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return null;
  }

  static Future<List<AttachDocument>> deNghiCapSim_LoadAttachedFiles(
      int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.deNghiCapSimURL}/files?$paramString');
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

  static Future<List<DeNghiCapSim>> deNghiCapSim_LoadPagedData(int pageNo,
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
      var url = Uri.parse(ApiCoreService.deNghiCapSimURL);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseDeNghiCapSim(response.body);
        List<DeNghiCapSim> listResult = [];
        for (var element in list) {
          if (element.idDeNghi == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <DeNghiCapSim>[];
      }
    } catch (ex) {
      rethrow;
    }
  }

  static Future<DeNghiCapSimReportArgs> deNghiCapSim_LoadReport(
      int reportId, String companyCode) async {
    try {
      Map<String, String> data = {
        "companyCode": companyCode,
        "reportId": reportId.toString()
      };
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.deNghiCapSimURL}/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        DeNghiCapSimReportArgs rs =
            DeNghiCapSimReportArgs.fromJson(response.body);
        return rs;
      }
      return DeNghiCapSimReportArgs();
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return DeNghiCapSimReportArgs();
  }

  static Future<String> deNghiCapSim_LoadAttachedFile(
      int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContext(
        reportId, fileId, '${ApiCoreService.deNghiCapSimURL}/file');
    return rsUrl;
  }

  static List<DeNghiCapSim> parseDeNghiCapSim(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<DeNghiCapSim>((json) => DeNghiCapSim.fromMap(json))
        .toList();
  }
}
