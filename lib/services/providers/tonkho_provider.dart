import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/services/api/api_path.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:dartz/dartz.dart';

class TonkhoProvider {
  TonkhoProvider._();

  static Future<Either<ApiError, MBaseResponse<List<List<List<String>>>>>>
      baoCaoTonKho({
    String macty = "",
    String mavt = "",
    String from = "",
    String to = "",
    int offset = 1,
    int limit = 100,
  }) async {
    final user = SharedPreferencesManager.instance.getSettingApp();
    Map<String, dynamic> params = {
      "loai": "TonKho",
      "from": from,
      "to": to,
      "ma_cty": macty,
      // "mavt": mavt.isEmpty ? null : mavt,
      "ma_user": user.cachedUserCode,
      "pageIndex": offset,
      "pageSize": limit,
    };
    return await DioClient.share().request2<List<List<List<String>>>>(
      apiType: ApiType.baoCaoTonKho,
      query: params,
      fromJsonT: (p0) => (p0 as List)
          .map((e) => (e as List)
              .map((innerList) =>
                  (innerList as List).map((item) => item.toString()).toList())
              .toList())
          .toList(),
    );
  }
}
