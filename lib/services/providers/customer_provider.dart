import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/model/dtos/customer/m_customer.dart';
import 'package:bividpharma/model/dtos/donbanhang/m_order.dart';
import 'package:bividpharma/services/api/api_path.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:dartz/dartz.dart';

class CustomerProvider {
  CustomerProvider._();

  static Future<Either<ApiError, MBaseResponse<List<MCustomer>>>>
      fetchCustomerList(
          {String search = "", int offset = 0, int limit = 10}) async {
    Map<String, dynamic> params = {
      "keyword": search,
      "offset": offset,
      "limit": limit,
    };
    return await DioClient.share().request2<List<MCustomer>>(
      apiType: ApiType.customer,
      query: params,
      fromJsonT: (p0) => (p0 as List)
          .map((e) => MCustomer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
