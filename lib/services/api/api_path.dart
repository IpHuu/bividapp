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
  createOrder,
  orderDetail,
  company,
  danhMucVatTu,
  danhMucKhachHang,
  baoCaoTonKho,
  baoCaoThau,
}

class ApiPath {
  static String auth = "/auth";
  // static String auth = "/api/login";
  static String orders = "/api/mobile/order";
  static String customers = "/api/mobile/customer";
  static String products = "/api/mobile/product";
  static String createOrder = "/api/mobile/create/order";
  static String orderDetail = "/api/mobile/order-detail";
  static String company = "/danhmuc/cong-ty";
  static String danhMucVatTu = "/danhmuc/danh-muc-vat-tu";
  static String danhMucKhachHang = "/danhmuc/danh-muc-khach-hang";
  static String baoCaoTonKho = "/baocao/bao-cao-tong-quan-ton-kho";
  static String baoCaoThau = "/baocao/bao-cao-tong-quan-thau";
}

extension ApiMethod on ApiType {
  String get method {
    switch (this) {
      case ApiType.getToken:
      case ApiType.refreshToken:
      case ApiType.createOrder:
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
      case ApiType.createOrder:
        return ApiPath.createOrder;
      case ApiType.orderDetail:
        return ApiPath.orderDetail;
      case ApiType.company:
        return ApiPath.company;
      case ApiType.danhMucVatTu:
        return ApiPath.danhMucVatTu;
      case ApiType.danhMucKhachHang:
        return ApiPath.danhMucKhachHang;
      case ApiType.baoCaoTonKho:
        return ApiPath.baoCaoTonKho;
      case ApiType.baoCaoThau:
        return ApiPath.baoCaoThau;
      default:
        return '';
    }
  }
}
