import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/model/enums/type_banhang.dart';
import 'package:bividpharma/model/enums/type_phantich.dart';
import 'package:bividpharma/services/api/api_path.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:dartz/dartz.dart';

class ReportProvider {
  ReportProvider._();

  static Future<Either<ApiError, MBaseResponse<String>>> baoCaoTongHop(
      {String? nam, required String tuNam, required String denNam}) async {
    Map<String, dynamic> params = {
      "nam": nam,
      "tuNam": tuNam,
      "denNam": denNam,
    };
    return await DioClient.share().request2<String>(
      apiType: ApiType.baoCaoTongHop,
      query: params,
      fromJsonT: (p0) => p0.toString(),
    );
  }

  static Future<Either<ApiError, MBaseResponse<String>>> baoCaoLoiNhuan(
      {String? nam, required String tuNam, required String denNam}) async {
    Map<String, dynamic> params = {
      "maMau": 2,
      "pMa_cty": "002",
      "pList_cty": "002",
      "pKy_phantich": "2",
      "ptungay": "2020-06-01",
      "pdenngay": "2020-12-31"
    };
    return await DioClient.share().request2<String>(
      apiType: ApiType.baoCaoLoiNhuan,
      query: params,
      fromJsonT: (p0) => p0.toString(),
    );
  }

  static Future<Either<ApiError, MBaseResponse<String>>> baoCaoBanHang(
      {TypeBanHang type = TypeBanHang.chart,
      TypePhanTich typePhanTich = TypePhanTich.thang,
      String? maNV,
      String? maKH,
      required String maCty,
      required String tuNam,
      required String denNam}) async {
    Map<String, dynamic> params = {
      "loai": type.value.toString(),
      "pMa_cty": maCty,
      "pList_cty": maCty,
      "pKy_phantich": typePhanTich.value.toString(),
      "ptr": "true",
      "pluser": "binh.ngoduc",
      "ptungay": tuNam,
      "pdenngay": denNam
    };

    if (maNV != null) {
      params["pMa_nv5"] = maNV;
    }

    if (maKH != null) {
      params["pma_kh"] = maKH;
    }
    return await DioClient.share().request2<String>(
      apiType: ApiType.baoCaoBanHang,
      query: params,
      fromJsonT: (p0) => p0.toString(),
    );
  }
}
