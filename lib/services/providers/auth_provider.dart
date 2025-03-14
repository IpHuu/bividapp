import 'package:bividpharma/model/dtos/auth/m_login.dart';
import 'package:bividpharma/model/dtos/auth/m_token.dart';
import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/login_response.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:dartz/dartz.dart';

import '../../model/dtos/base/auth_response.dart';
import '../api/api_path.dart';

class AuthProvider {
  AuthProvider._();

  static Future<Either<ApiError, LoginResponse>> login(
      String username, String password) async {
    MLogin params = MLogin(email: username, password: password);
    final response = await DioClient.share().requestData<LoginResponse>(
      apiType: ApiType.getToken,
      query: params.toJson(),
      parser: (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
    return response;
  }
}
