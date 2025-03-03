// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';

import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/common/document_filter_args.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/khcv_report_args.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/phieu_ke_hoach_cong_viec.dart';
import 'package:bividpharma/pages/kehoachcongviec/dtos/sign_step_parameter_args.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class KeHoachCongViecService {
  static Future<bool> keHoachCongViec_Approve(SignStepParameterArgs arg) async {
    Map data = arg.toMap();

    try {
      var url = Uri.parse('${ApiCoreService.keHoachCongViecVer2URL}/duyet');
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

  static Future<List<KeHoachCongViec>> keHoachCongViec_LoadPagedData(int pageNo,
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
      var url = Uri.parse('${ApiCoreService.keHoachCongViecVer2URL}/search');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseKeHoachCongViec(response.body);
        List<KeHoachCongViec> listResult = [];
        for (var element in list) {
          if (element.idKeHoachCongViec == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <KeHoachCongViec>[];
      }
    } catch (ex) {
      rethrow;
    }
  }

  static Future<KhcvReportArgs> keHoachCongViec_LoadReport(int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse(
          '${ApiCoreService.keHoachCongViecVer2URL}/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        KhcvReportArgs rs = KhcvReportArgs.fromJson(response.body);
        return rs;
      }
      return KhcvReportArgs();
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return KhcvReportArgs();
  }

  static Future<KeHoachCongViec?> keHoachCongViec_LoadOne(int reportId) async {
    try {
      Map<String, String> data = {"reportId": reportId.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url =
          Uri.parse('${ApiCoreService.keHoachCongViecVer2URL}?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        KeHoachCongViec rs = KeHoachCongViec.fromJson(response.body);
        return rs;
      }
      return null;
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return null;
  }

  static Future<int> keHoachCongViec_Create(KeHoachCongViec item) async {
    item.versionNo = 2;
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.keHoachCongViecVer2URL);
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

  static Future<int> keHoachCongViec_Update(KeHoachCongViec item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.keHoachCongViecVer2URL);
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

  static Future<bool> keHoachCongViec_Delete(KeHoachCongViec item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse(ApiCoreService.keHoachCongViecVer2URL);
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

  static Future<bool> keHoachCongViec_TrinhKy(KeHoachCongViec item) async {
    Map data = item.toMap();
    try {
      var url = Uri.parse('${ApiCoreService.keHoachCongViecVer2URL}/trinhky');
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

  static Future<List<KeHoachCongViec>> keHoachCongViec_GetMyData(
      DocumentSearchParam item) async {
    try {
      Map<String, dynamic> data = {
        "pageNo": item.pageNo,
        "pageItems": item.pageSize,
        "searchText": item.searchText
      };
      var body = json.encode(data);
      var url = Uri.parse('${ApiCoreService.keHoachCongViecVer2URL}/mydata');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseKeHoachCongViec(response.body);
        List<KeHoachCongViec> listResult = [];
        for (var element in list) {
          if (element.idKeHoachCongViec == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        return listResult;
      } else {
        return <KeHoachCongViec>[];
      }
    } catch (ex) {
      return <KeHoachCongViec>[];
    }
  }

  static Future<List<AttachDocument>> keHoachCongViec_LoadAttachedFiles(
      int reportId) async {
    final list = await ApiCoreService.loadAttachedFiles(
        DepartmentEnum.KeHoachCongViec.name, reportId);
    return list;
  }

  static Future<String> keHoachCongViec_LoadAttachedFile(
      int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContextVer2(
        DepartmentEnum.KeHoachCongViec.name, reportId, fileId);
    return rsUrl;
  }

  static List<KeHoachCongViec> parseKeHoachCongViec(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<KeHoachCongViec>((json) => KeHoachCongViec.fromMap(json))
        .toList();
  }
}
