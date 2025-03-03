import 'dart:io';

import 'package:bividpharma/services/core_api_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final httpObj = super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    httpObj.connectionTimeout = Duration(seconds: ApiCoreService.httpTimeOut);
    return httpObj;
  }
}
