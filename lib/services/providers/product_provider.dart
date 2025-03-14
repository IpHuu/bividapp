import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/model/dtos/products/m_product.dart';
import 'package:bividpharma/services/api/api_path.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:dartz/dartz.dart';

class ProductsRepository {
  ProductsRepository._();

  // static Future<List<MProduct>> fetchProductList(
  //     {int offset = 0, int limit = 10}) async {
  //   Map<String, dynamic> params = {
  //     "offset": offset,
  //     "limit": limit,
  //   };
  //   final response =
  //       await DioClient.share().request<MBaseResponse<List<MProduct>>>(
  //     apiType: ApiType.products,
  //     query: params,
  //     fromJsonT: (json) {
  //       var orders = (json as List).map((item) {
  //         return MProduct.fromJson(item as Map<String, dynamic>);
  //       }).toList();
  //       return MBaseResponse<List<MProduct>>(data: orders);
  //     },
  //   );
  //   return response.data?.data ?? [];
  // }

  static Future<Either<ApiError, MBaseResponse<List<MProduct>>>>
      fetchProductList(
          {String search = "", int offset = 0, int limit = 10}) async {
    Map<String, dynamic> params = {
      "keyword": search,
      "offset": offset,
      "limit": limit,
    };
    return await DioClient.share().request2<List<MProduct>>(
      apiType: ApiType.products,
      query: params,
      fromJsonT: (p0) => (p0 as List)
          .map((e) => MProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
