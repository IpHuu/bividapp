import 'package:bividpharma/model/dtos/auth/m_login.dart';
import 'package:bividpharma/model/dtos/auth/m_token.dart';
import 'package:bividpharma/services/client/dio_client.dart';

import '../../model/dtos/base/auth_response.dart';
import '../api/api_path.dart';

class AuthProvider {
  AuthProvider._();

  static Future<AuthResponse?> login(String username, String password) async {
    MLogin params = MLogin(userName: username, password: password);
    final response = await DioClient<AuthResponse>.share().requestData(
      apiType: ApiType.getToken,
      data: params.toJson(),
      parser: AuthResponse.fromJson,
    );
    return response;
  }
}
