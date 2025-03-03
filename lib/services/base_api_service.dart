import 'dart:convert';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/common/interface.dart';
import 'package:bividpharma/services/core_api_service.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

abstract class BaseDocumentService<T extends IDocument, A extends IDocumentArgs,
    R extends IDocumentReportArgs> {
  final String commandUrl;

  BaseDocumentService(this.commandUrl);
  /* ******************************* *****************************
  * T: Name
  * A: <Name>Args
  ************************************************************** */
  Future<bool> approve(A args) async {
    Map data = args.toMap();
    final postUrl = '$commandUrl/approve';
    final bResult = await ApiCoreService.doPost(postUrl, data);
    return bResult;
  }

  Future<T?> loadOne(int reportId) async {
    final getUrl = commandUrl;
    Map<String, String> mapParam = {"reportId": reportId.toString()};
    String? jsonData = await ApiCoreService.getString(getUrl, mapParam);
    if (jsonData == null) return null;
    try {
      //DeNghiMuaVpp rs = DeNghiMuaVpp.fromJson(jsonData);
      T rs = documentFromJson(jsonData);
      return rs;
    } catch (ex) {
      debugPrint("$ex");
    }
    return null;
  }

  Future<List<T>> loadPaged(int pageNo, int pageItems, bool finished,
      int filterType, String searchText) async {
    try {
      Map<String, dynamic> data = {
        "pageNo": pageNo,
        "pageItems": pageItems,
        "finished": finished,
        "filterType": filterType,
        "searchText": searchText
      };
      var body = json.encode(data);
      var url = Uri.parse(commandUrl);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId,
          },
          body: body);

      if (response.statusCode == 200) {
        final list = _parseItem(response.body);
        List<T> listResult = [];
        /***************************************************************
        for (var element in list) {
          if (element.idDeNghi == -1) continue;
          element.logoCongTy =
              "${ApiCoreService.M_HOST_URL}/images/${element.logoCongTy}";
          listResult.add(element);
        }
        ***************************************                      **/
        listResult.addAll(list);
        onLoadPagedCompleted(listResult);
        return listResult;
      } else {
        return <T>[];
      }
    } catch (ex) {
      onLoadPagedCompleted(<T>[]);
      rethrow;
    }
  }

  Future<R> loadReport(int reportId, String companyCode) async {
    try {
      Map<String, String> data = {
        "companyCode": companyCode,
        "reportId": reportId.toString()
      };
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('$commandUrl/report?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });
      if (response.statusCode == 200) {
        R rs = reportItemFromJson(response.body);
        return rs;
      }
      return createEmptyReportItem();
    } on Exception catch (ex) {
      debugPrint(ex.toString());
    }
    return createEmptyReportItem();
  }

  Future<List<AttachDocument>> loadAttachedDocs(int reportId) async {
    final getUrl = '$commandUrl/files';
    final Map<String, String> mapData = {"reportId": reportId.toString()};
    final docs = await ApiCoreService.getAttachDocuments(getUrl, mapData);
    return docs;
  }

  Future<String> loadAttachedFile(int reportId, int fileId) async {
    final rsUrl = await ApiCoreService.loadAttachedFileContext(
        reportId, fileId, '$commandUrl/file');
    return rsUrl;
  }

  List<T> _parseItem(String bodyData) {
    final parsed = jsonDecode(bodyData).cast<Map<String, dynamic>>();
    return parsed.map<T>((json) => documentFromMap(json)).toList();
  }

  @protected
  void onLoadPagedCompleted(List<T> list);

  @protected
  FromJsonCallback<T> get documentFromJson;
  @protected
  FromMapCallback<T> get documentFromMap;

  @protected
  CreateObjectCallback<R> get createEmptyReportItem;
  @protected
  FromJsonCallback<R> get reportItemFromJson;
}
