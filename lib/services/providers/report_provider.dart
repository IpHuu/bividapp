import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
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
}
