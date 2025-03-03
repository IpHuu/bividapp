import 'package:bividpharma/model/dtos/auth/m_token.dart';
import 'package:bividpharma/model/dtos/base/auth_response.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:dio/dio.dart';

enum ApiType { getToken, refreshToken, myProfile, sessionList }

class ApiPath {
  static String auth = "/auth";
}

extension ApiMethod on ApiType {
  String get method {
    switch (this) {
      case ApiType.getToken:
      case ApiType.refreshToken:
        return "POST";
      case ApiType.myProfile:
        return "POST";
      default:
        return "GET";
    }
  }
}

extension ApiHeader on ApiType {
  static Map<String, dynamic> header = {
    "Content-Type": "application/json",
    'Access-Control-Allow-Origin': '*'
  };

  Map<String, dynamic> get headers {
    switch (this) {
      default:
        Map<String, dynamic> authorizedHeader = header;

        Result? auth = SharedPreferencesManager.instance.userInfo;
        if (auth != null && auth.tokenId.isNotEmpty) {
          String token = auth.tokenId;
          authorizedHeader["Authorization"] = "Bearer $token";
        }
        return authorizedHeader;
    }
  }
}

extension ApiEncoder on ApiType {
  ResponseType get encoding {
    switch (this) {
      default:
        return ResponseType.json;
    }
  }
}

extension ApiUrl on ApiType {
  String get url {
    switch (this) {
      case ApiType.getToken:
        return ApiPath.auth;

      default:
        return '';
    }
  }
}
