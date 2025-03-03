// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';
import 'package:bividpharma/model/dtos/danhmuc/company.dart';
import 'package:bividpharma/model/dtos/danhmuc/currency.dart';
import 'package:bividpharma/model/dtos/danhmuc/document_option.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_dxmh.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_khcv.dart';
import 'package:bividpharma/model/dtos/danhmuc/short_nhan_vien.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class DanhMucService {
  static Future<List<ShortNhanVien>> nhanvien_getShortList(
      {String filter = ''}) async {
    try {
      var jsonBody = json.encode(filter);
      var url = Uri.parse('${ApiCoreService.danhmucNhanVienURL}/short/getlist');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: jsonBody);
      if (response.statusCode == 200) {
        final list = _parseShortNhanVien(response.body);
        return list;
      } else {
        return <ShortNhanVien>[];
      }
    } catch (ex) {
      return <ShortNhanVien>[];
    }
  }

  static Future<ShortNhanVien?> nhanvien_getOne({String userName = ''}) async {
    try {
      var jsonBody = json.encode(userName);
      var url = Uri.parse('${ApiCoreService.danhmucNhanVienURL}/short/getone');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: jsonBody);
      if (response.statusCode == 200) {
        final json = (response.body);
        final rs = ShortNhanVien.fromJson(json);
        return rs;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<List<Company>> company_getList({String filter = ''}) async {
    try {
      var jsonBody = json.encode(filter);
      var url = Uri.parse('${ApiCoreService.danhmucCompanyURL}/list');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: jsonBody);
      if (response.statusCode == 200) {
        final list = _parseCompany(response.body);

        return list;
      } else {
        return <Company>[];
      }
    } catch (ex) {
      return <Company>[];
    }
  }

  static Future<List<Currency>> currency_getList({String filter = ''}) async {
    try {
      var jsonBody = json.encode(filter);
      var url = Uri.parse('${ApiCoreService.danhmucShortURL}/currency');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: jsonBody);
      if (response.statusCode == 200) {
        final list = _parseCurrency(response.body);
        return list;
      } else {
        return <Currency>[];
      }
    } catch (ex) {
      return <Currency>[];
    }
  }

  static Future<List<ShortKhcv>> khcv_getShortList(
      {String maCongTy = ''}) async {
    try {
      var jsonBody = json.encode(maCongTy);
      var url = Uri.parse('${ApiCoreService.danhmucShortURL}/khcv/byuser');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: jsonBody);
      if (response.statusCode == 200) {
        final list = _parseShortKHCV(response.body);
        return list;
      } else {
        return <ShortKhcv>[];
      }
    } catch (ex) {
      return <ShortKhcv>[];
    }
  }

  static Future<List<ShortDxmh>> dxmh_getShortList(
      {String maCongTy = ''}) async {
    try {
      var jsonBody = json.encode(maCongTy);
      var url = Uri.parse('${ApiCoreService.danhmucURL}/dxmh/byuser');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: jsonBody);
      if (response.statusCode == 200) {
        final list = _parseShortDXMH(response.body);
        return list;
      } else {
        return <ShortDxmh>[];
      }
    } catch (ex) {
      return <ShortDxmh>[];
    }
  }

  static Future<DocumentOption?> document_getOptions(
      {String maCongTy = '', String voucherCode = '', int state = 0}) async {
    try {
      var paramUrl = Uri(queryParameters: {
        'maCongTy': maCongTy,
        'voucherCode': voucherCode,
        'state': '0'
      }).query;
      var url =
          Uri.parse('${ApiCoreService.danhmucURL}/document/options?$paramUrl');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });
      if (response.statusCode == 200) {
        final rs = DocumentOption.fromJson(response.body);
        return rs;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static List<ShortDxmh> _parseShortDXMH(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ShortDxmh>((json) => ShortDxmh.fromMap(json)).toList();
  }

  static List<ShortKhcv> _parseShortKHCV(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ShortKhcv>((json) => ShortKhcv.fromMap(json)).toList();
  }

  static List<Currency> _parseCurrency(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Currency>((json) => Currency.fromMap(json)).toList();
  }

  static List<Company> _parseCompany(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Company>((json) => Company.fromMap(json)).toList();
  }

  static List<ShortNhanVien> _parseShortNhanVien(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ShortNhanVien>((json) => ShortNhanVien.fromMap(json))
        .toList();
  }
}
