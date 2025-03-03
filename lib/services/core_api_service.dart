// ignore_for_file: constant_identifier_names

import 'dart:convert' as convert;
import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';
import 'package:bividpharma/common/common_data_type.dart';
import 'package:bividpharma/common/my_device_info.dart';
import 'package:bividpharma/model/dtos/attach_file.dart';
import 'package:bividpharma/model/dtos/common/document_chart_data.dart';
import 'package:bividpharma/model/dtos/common/login_param.dart';
import 'package:bividpharma/model/dtos/common/user_notify.dart';
import 'package:bividpharma/model/dtos/user_info.dart';
import 'package:bividpharma/model/dtos/usertoken.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:path/path.dart' as path;

import 'package:path_provider/path_provider.dart' as pathpro;
import 'package:permission_handler/permission_handler.dart';

class ApiCoreService {
  /// ********************************************************************** */
  // Public
  // static const M_HOST_URL = "https://portal.bividvietnam.com:63231";

  /// ********************************************************************** */
  // Local
  static const M_HOST_URL = "http://192.168.1.121:80";
  //static const M_HOST_URL = "https://portal.bividvietnam.com:63231";

  //
  static int httpTimeOut = 60 * 1; // 1 minutes
  static String _loginTokenId = '';
  static String get loginTokenId => "Bearer $_loginTokenId";
  static String get loginJwtToken => _loginTokenId;
  static set loginTokenId(String value) => _loginTokenId = value;

  static String get policyURL => "$M_HOST_URL/bivid_privacy_policy_vi.html";
  static String get termsURL => "$M_HOST_URL/bivid_terms_use_vi.html";
  static String get introMediaURL => "$M_HOST_URL/media/intro_video.mp4";
  static String get appVersionURL => '$M_HOST_URL/app';

  static String get giayNghiPhepURL => "$M_HOST_URL/signed/giaynghiphep";
  static String get giayNghiPhepCrudURL => "$M_HOST_URL/giayxinphep";

  static String get giayTamUngURL => "$M_HOST_URL/signed/giaytamung";
  static String get giayTamUngCrudURL => "$M_HOST_URL/phieutamung";

  static String get giayDeXuatMuaHangURL => "$M_HOST_URL/signed/dexuatmuahang";
  static String get giayRaCongURL => "$M_HOST_URL/signed/giayracong";

  static String get deNghiCapSimURL => "$M_HOST_URL/signed/denghicapsim";
  static String get deNghiMuaVppURL => "$M_HOST_URL/signed/denghimuavpp";
  static String get lenhCongTacURL => "$M_HOST_URL/signed/lenhcongtac";
  static String get keHoachCongTacURL => "$M_HOST_URL/signed/kehoachcongtac";
  static String get deNghiCapVppURL => "$M_HOST_URL/signed/denghicapvpp";
  static String get chiPhiCongTacURL => "$M_HOST_URL/signed/chiphicongtac";

  static String get phieuThanhQuyetToanURL =>
      "$M_HOST_URL/signed/phieuthanhquyettoan";
  static String get phieuTQTCrudURL => "$M_HOST_URL/phieutqt";

  // static String get keHoachCongViecURL => "$M_HOST_URL/signed/kehoachcongviec";
  static String get keHoachCongViecVer2URL => "$M_HOST_URL/KHCV";

  static String get yeuCauThietKeURL => "$M_HOST_URL/signed/yeucauthietke";

  static String get danhmucNhanVienURL => '$M_HOST_URL/danhmuc/nhanvien';
  static String get danhmucCompanyURL => '$M_HOST_URL/danhmuc/company';
  static String get danhmucShortURL => '$M_HOST_URL/danhmuc/short';

  static String get danhmucURL => '$M_HOST_URL/danhmuc';
  static String get systemURL => '$M_HOST_URL/system';
  static String get riengTuURL => '$M_HOST_URL/riengtu';

  static Future<List<AttachDocument>> getAttachDocuments(
      String getUrl, Map<String, String> mapData) async {
    try {
      String paramString = Uri(queryParameters: mapData).query;
      var url = Uri.parse('$getUrl?$paramString');
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

  static Future<String?> getString(
      String getUrl, Map<String, String> mapParam) async {
    try {
      String paramString = Uri(queryParameters: mapParam).query;
      var url = Uri.parse('$getUrl?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId
      });

      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (ex) {
      debugPrint("$ex");
    }
    return null;
  }

  static Future<bool> doPost(String postUrl, Map mapData) async {
    try {
      var url = Uri.parse(postUrl);
      var body = jsonEncode(mapData);
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

  static Future<String> loadPolicyHtml() {
    return _loadHtml(policyURL);
  }

  static Future<String> loadTermHtml() {
    return _loadHtml(termsURL);
  }

  static Future<String> loadHtml(String url) {
    return _loadHtml(url);
  }

  static Future<String> _loadHtml(String dataUrl) async {
    try {
      var url = Uri.parse(dataUrl);
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'text/html; charset=UTF-8',
        "Authorization": loginTokenId
      });

      if (response.statusCode == 200) {
        final textData = utf8.decode(response.bodyBytes);
        return textData;
      } else {
        return "Không có dữ liệu.";
      }
    } catch (ex) {
      return "Lỗi tải HTML.";
    }
  }

  static Future<UserToken?> doLogin(LoginParam arg) async {
    // var url = Uri.parse('$M_HOST_URL/system/login');
    var url = Uri.parse('$M_HOST_URL/auth');
    try {
      Map data = arg.toMap();
      var body = jsonEncode(data);

      var response = await http
          .post(url,
              headers: {"Content-Type": "application/json; charset=UTF-8"},
              body: body)
          .timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        var userToken = UserToken.fromMap(jsonResponse);

        if (userToken.userid != "") {
          return userToken;
        } else {
          return null;
        }
      }
      return null;
    } catch (ex) {
      return null;
    }
  }

  static void sendErrorLog(Map<String, dynamic> data) async {
    try {
      var url = Uri.parse('$M_HOST_URL/system/log');
      var body = jsonEncode(data);

      await http.post(url,
          headers: {"Content-Type": "application/json; charset=UTF-8"},
          body: body);
    } catch (ex) {
      //
    }
  }

  static Future<UserInfo?> loadUserInfo(String userName) async {
    try {
      Map<String, String> data = {"userName": userName};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('$M_HOST_URL/System/userinfo?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        "Authorization": loginTokenId
      });

      if (response.statusCode == 200) {
        final userInfo = UserInfo.fromJson(response.body);
        return userInfo;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str.toLowerCase() == 'true';
    }
    return str != '0' && str.toLowerCase() != 'false' && str != '';
  }

  static Future<String> downloadFile(String url, String fileName) async {
    HttpClient httpClient = HttpClient();

    String filePath = '';
    String myUrl = '';
    await _prepareSaveDir();
    String dir = _localPath;

    try {
      myUrl = url;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        File file = File(filePath);
        await file.writeAsBytes(bytes);
      } else {
        filePath = 'Error code: ${response.statusCode}';
      }
    } catch (ex) {
      filePath = 'Can not fetch url';
    }
    return filePath;
  }

  static Future<bool> checkPermission() async {
    if (Platform.isIOS) return true;
    if (Platform.isAndroid && MyDeviceInfo.instance.androidSdkInt <= 28) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  static Future<void> downloadFile2(String url, String filename,
      Function funcProgress, Function funcDone) async {
    var httpClient = http.Client();
    var request = http.Request('GET', Uri.parse(url));
    var response = httpClient.send(request);
    String dir = (await pathpro.getApplicationDocumentsDirectory()).path;

    List<List<int>> chunks = [];
    int downloaded = 0;
    debugPrint('Folder: $dir');

    response.asStream().listen((http.StreamedResponse r) {
      r.stream.listen((List<int> chunk) {
        debugPrint(
            'Đang tải: ${(downloaded / r.contentLength! * 100).round()}%');
        funcProgress((downloaded / r.contentLength! * 100).round());
        chunks.add(chunk);
        downloaded += chunk.length;
      }, onDone: () async {
        // Display percentage of completion
        debugPrint(
            'Đã tải xong: ${(downloaded / r.contentLength! * 100).round()}%');
        // Save the file
        File file = File('$dir/$filename');
        final Uint8List bytes = Uint8List(r.contentLength!);
        int offset = 0;
        for (List<int> chunk in chunks) {
          bytes.setRange(offset, offset + chunk.length, chunk);
          offset += chunk.length;
        }
        await file.writeAsBytes(bytes);
        funcDone(file.path);

        return;
      });
    });
  }

  static Future<List<DocumentChartData>> loadDocumentChart(
      int reportId, String documentCode) async {
    try {
      Map<String, String> data = {
        "reportId": reportId.toString(),
        'documentCode': documentCode
      };
      String paramString = Uri(queryParameters: data).query;
      String urlPath = '$systemURL/document/chart';
      var body = json.encode(data);
      paramString = '';
      var url = Uri.parse(urlPath + paramString);
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': ApiCoreService.loginTokenId
          },
          body: body);

      if (response.statusCode == 200) {
        final list = parseDocumentChart(response.body);
        return list;
      } else {
        return <DocumentChartData>[];
      }
    } catch (ex) {
      return <DocumentChartData>[];
    }
  }

  static Future<String> appVersion(String platform) async {
    try {
      Map<String, String> data = {"platform": platform.toString()};
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('$M_HOST_URL/System/appver?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      });

      if (response.statusCode == 200) {
        final rsText = response.body.toString();
        return rsText;
      }
      return "";
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return "";
  }

  static String _localPath = '';
  static Future<String?> _findLocalPath() async {
    late String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        final folder = await pathpro.getApplicationDocumentsDirectory();
        externalStorageDirPath = folder.path;
        //await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await pathpro.getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await pathpro.getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  static Future<void> _prepareSaveDir() async {
    if (!(await checkPermission())) {
      return;
    }
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  static Future<String> loadAttachedFileContext(
      int reportId, int fileId, String urlPath) async {
    try {
      Map<String, String> data = {
        "reportId": reportId.toString(),
        "fileId": fileId.toString()
      };
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('$urlPath?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId,
      });

      if (response.statusCode == 200) {
        final url = response.body.toString();
        return url;
      }
      return "";
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return "";
  }

  static Future<String> loadAttachedFileContextVer2(
      String departName, int reportId, int fileId) async {
    final urlPath = systemURL;
    try {
      Map<String, String> data = {
        "departName": departName,
        "reportId": reportId.toString(),
        "fileId": fileId.toString()
      };
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('$urlPath/document/file?$paramString');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Authorization': ApiCoreService.loginTokenId,
      });

      if (response.statusCode == 200) {
        final url = response.body.toString();
        return url;
      }
      return "";
    } catch (ex) {
      // ignore: avoid_print
      print("$ex");
    }
    return "";
  }

  static Future<List<AttachDocument>> loadAttachedFiles(
      String department, int reportId) async {
    try {
      Map<String, String> data = {
        "reportId": reportId.toString(),
        "departName": department
      };
      String paramString = Uri(queryParameters: data).query;
      var url = Uri.parse('$systemURL/document/list?$paramString');
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

  static Future<bool> beginUploadAttachedFile(
      String department, String code, String localFile) async {
    File file = File(localFile);
    String fileName = path.basename(file.path);
    String urlPath = '$systemURL/document/beginupload';
    var queryData = {
      'department': department,
      'code': code,
      'fileName': fileName
    };
    try {
      Dio dio = Dio();
      dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${ApiCoreService.loginJwtToken}';
      if (!kIsWeb) {
        (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      var response = await dio.post(urlPath, queryParameters: queryData);
      return (response.statusCode == 200);
    } catch (ex) {
      return false;
    }
  }

  static Future<List<UserNotify>> loadUserNotify(
      String userId, String code) async {
    String urlPath = '$systemURL/notify/list';
    var params = {'Id': userId, 'notifyCode': code};

    try {
      Response response;
      var dio = Dio();
      if (!kIsWeb) {
        (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }

      dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${ApiCoreService.loginJwtToken}';
      response = await dio.get(urlPath, queryParameters: params);
      if (response.statusCode == 200) {
        var notifies =
            (response.data as List).map((x) => UserNotify.fromMap(x)).toList();

        return notifies;
      }
      return [];
    } catch (ex) {
      //
      return [];
    }
  }

  static Future<bool> removeAttachedFile(
      int docId, String department, String code) async {
    //
    String urlPath = '$systemURL/document';

    FormData formData = FormData.fromMap({
      "Id": docId,
      "Code": code,
      "Department": department,
    });

    try {
      Dio dio = Dio();
      dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${ApiCoreService.loginJwtToken}';
      if (!kIsWeb) {
        (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      var response = await dio.delete(
        urlPath,
        data: formData,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (ex) {
      return false;
    }
  }

  static Future<AttachDocument?> uploadAttachedFile(
      String department,
      String code,
      String menuId,
      String localFile,
      DynamicVoidCallback? callBack) async {
    //
    File file = File(localFile);
    String fileName = path.basename(file.path);
    String urlPath = '$systemURL/document/upload';

    FormData formData = FormData.fromMap({
      "Department": department,
      "Code": code,
      "MenuId": menuId,
      "FormFile": await MultipartFile.fromFile(
        localFile,
        filename: fileName,
      ),
    });
    try {
      Dio dio = Dio();
      dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${ApiCoreService.loginJwtToken}';
      if (!kIsWeb) {
        (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      var response = await dio.post(
        urlPath,
        data: formData,
        onSendProgress: (received, total) {
          if (total != -1) {
            double pc = (received / total * 100);
            callBack?.call(pc);
            debugPrint('${(received / total * 100).toStringAsFixed(0)}%');
          }
        },
      );
      AttachDocument doc = AttachDocument.fromMap(response.data);
      return doc;
    } catch (ex) {
      return null;
    }
  }

  static List<UserNotify> parseUserNotify(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserNotify>((json) => UserNotify.fromMap(json)).toList();
  }

  static List<AttachDocument> parseAttachDocument(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<AttachDocument>((json) => AttachDocument.fromMap(json))
        .toList();
  }

  static List<DocumentChartData> parseDocumentChart(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<DocumentChartData>((json) => DocumentChartData.fromMap(json))
        .toList();
  }
}
