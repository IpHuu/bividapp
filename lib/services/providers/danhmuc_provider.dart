import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/model/dtos/company/m_company.dart';
import 'package:bividpharma/model/dtos/khachhang/m_khachhang.dart';
import 'package:bividpharma/model/dtos/vattu/m_vattu.dart';
import 'package:dartz/dartz.dart';

import '../api/api_path.dart';
import '../client/dio_client.dart';

class DanhMucRepository {
  DanhMucRepository._();

  static Future<Either<ApiError, MBaseResponse<List<MCompany>>>>
      fetchCompanyList(
          {String search = "", int offset = 1, int limit = 10}) async {
    Map<String, dynamic> params = {
      "pageIndex": offset,
      "pageSize": limit,
    };
    return await DioClient.share().request2<List<MCompany>>(
      apiType: ApiType.company,
      query: params,
      fromJsonT: (p0) => (p0 as List)
          .map((e) => MCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  static Future<Either<ApiError, MBaseResponse<List<MVatTu>>>>
      fetchDanhMucVatTu(
          {String? search,
          String? maCty,
          int offset = 1,
          int limit = 10}) async {
    Map<String, dynamic> params = {
      "ma_cty": maCty,
      "ten": search,
      "pageIndex": offset,
      "pageSize": limit,
    };
    return await DioClient.share().request2<List<MVatTu>>(
      apiType: ApiType.danhMucVatTu,
      query: params,
      fromJsonT: (p0) => (p0 as List)
          .map((e) => MVatTu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  static Future<Either<ApiError, MBaseResponse<List<MKhachHang>>>>
      fetchDanhMucKhachHang(
          {String search = "", int offset = 0, int limit = 10}) async {
    return await DioClient.share().request2<List<MKhachHang>>(
      apiType: ApiType.danhMucKhachHang,
      query: null,
      fromJsonT: (p0) => (p0 as List)
          .map((e) => MKhachHang.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
