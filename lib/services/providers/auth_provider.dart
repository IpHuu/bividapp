import 'package:bividpharma/model/dtos/auth/m_login.dart';
import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/auth_response.dart';
import 'package:bividpharma/services/client/dio_client.dart';
import 'package:dartz/dartz.dart';

import '../api/api_path.dart';

class AuthProvider {
  AuthProvider._();

  static Future<Either<ApiError, AuthResponse>> login(
      String username, String password) async {
    MLogin params = MLogin(userName: username, password: password);
    final response = await DioClient.share().requestData<AuthResponse>(
      apiType: ApiType.getToken,
      data: params.toJson(),
      parser: (json) => AuthResponse.fromJson(json as Map<String, dynamic>),
    );
    return response;
  }
}
