import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/model/enums/type_thau.dart';
import 'package:bividpharma/services/api/api_path.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:dartz/dartz.dart';

class ThauProvider {
  ThauProvider._();
  static Future<Either<ApiError, MBaseResponse<String>>> baoCaoThau({
    TypeThau type = TypeThau.chinhanh,
    String macty = "",
    String mavt = "",
    String from = "",
    String to = "",
    int offset = 1,
    int limit = 100,
  }) async {
    final user = SharedPreferencesManager.instance.getSettingApp();
    Map<String, dynamic> params = {
      "loaithau": type.value,
      "pNgay_ct_rp1": from,
      "pNgay_ct_rp2": to,
      "pMa_cty": macty,
      "pList_cty": macty,
      // "mavt": mavt.isEmpty ? null : mavt,
      // "pluser": user.cachedUserCode, //
      "pluser": "binh.ngoduc",
    };
    return await DioClient.share().request2<String>(
      apiType: ApiType.baoCaoThau,
      query: params,
      fromJsonT: (p0) => p0.toString(),
    );
  }
}
