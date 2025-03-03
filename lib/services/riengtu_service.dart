import 'dart:convert';

import 'package:bividpharma/model/dtos/riengtu/bang_cham_cong.dart';
import 'package:bividpharma/model/dtos/riengtu/tra_cuu_nhan_vien.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'package:http/http.dart' as http;

class RiengTuService {
  static Future<List<BangChamCong>> getBangChamCong(
      {int tranYear = 0, tranMonth = 0}) async {
    try {
      // var jsonBody = json.encode(filter);
      Map<String, dynamic> data = {
        "tranYear": tranYear.toString(),
        "tranMonth": tranMonth.toString()
      };
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('${ApiCoreService.riengTuURL}/bangcong?$paramString');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'text/html; charset=utf-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: null);

      if (response.statusCode == 200) {
        final rs = parseBangChamCongList(response.body);

        return rs;
      } else {
        return <BangChamCong>[];
      }
    } catch (ex) {
      return <BangChamCong>[];
    }
  }

  static Future<List<TraCuuNhanVien>> searchNhanVien(filter) async {
    try {
      var jsonBody = json.encode(filter);
      var url = Uri.parse('${ApiCoreService.riengTuURL}/tracuunv');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: jsonBody);

      if (response.statusCode == 200) {
        final rs = parseTraCuuNhanVien(response.body);
        for (var element in rs) {
          element.logoUrl =
              "${ApiCoreService.M_HOST_URL}/images/${element.logo}";
        }
        return rs;
      } else {
        return <TraCuuNhanVien>[];
      }
    } catch (ex) {
      return <TraCuuNhanVien>[];
    }
  }

  static List<TraCuuNhanVien> parseTraCuuNhanVien(String jsonText) {
    final parsed = jsonDecode(jsonText).cast<Map<String, dynamic>>();
    return parsed
        .map<TraCuuNhanVien>((json) => TraCuuNhanVien.fromMap(json))
        .toList();
  }

  ///
  static List<BangChamCong> parseBangChamCongList(String jsonText) {
    final parsed = jsonDecode(jsonText).cast<Map<String, dynamic>>();
    return parsed
        .map<BangChamCong>((json) => BangChamCong.fromMap(json))
        .toList();
  }
}
