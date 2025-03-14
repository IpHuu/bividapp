import 'dart:convert';

import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/base_response.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/model/dtos/base/m_pagination.dart';
import 'package:bividpharma/model/dtos/donbanhang/m_order.dart';
import 'package:bividpharma/model/dtos/donbanhang/m_orderlist.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:dartz/dartz.dart';

import '../api/api_path.dart';

class OrdersProvider {
  OrdersProvider._();

  static Future<MBaseResponse<List<MOrder>>> fetchOrderList(
      {String search = "", int offset = 0, int limit = 10}) async {
    Map<String, dynamic> params = {
      "keyword": search,
      "offset": offset,
      "limit": limit,
    };
    final response = await DioClient.share().request<List<MOrder>>(
      apiType: ApiType.orderList,
      query: params,
      fromJsonT: (json) => (json as List<dynamic>)
          .map((item) => MOrder.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  static Future<Either<ApiError, MBaseResponse<List<MOrder>>>> fetchOrderList2(
      {String search = "", int offset = 0, int limit = 10}) async {
    Map<String, dynamic> params = {
      "keyword": search,
      "offset": offset,
      "limit": limit,
    };
    return await DioClient.share().request2<List<MOrder>>(
      apiType: ApiType.orderList,
      query: params,
      fromJsonT: (p0) => (p0 as List)
          .map((e) => MOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
