import 'package:bividpharma/model/dtos/auth/m_token.dart';
import 'package:bividpharma/model/dtos/base/auth_response.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:dio/dio.dart';

enum ApiType {
  getToken,
  refreshToken,
  myProfile,
  sessionList,
  orderList,
  customer,
  products,
}

class ApiPath {
  // static String auth = "/auth";
  static String auth = "/api/login";
  static String orders = "/api/mobile/order";
  static String customers = "/api/mobile/customer";
  static String products = "/api/mobile/product";
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
        String accessToken = SharedPreferencesManager.instance.accessToken;
        if (accessToken.isNotEmpty) {
          authorizedHeader["Authorization"] = "Bearer $accessToken";
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
      case ApiType.orderList:
        return ApiPath.orders;
      case ApiType.customer:
        return ApiPath.customers;
      case ApiType.products:
        return ApiPath.products;
      default:
        return '';
    }
  }
}
