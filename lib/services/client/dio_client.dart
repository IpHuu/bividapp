import 'package:dio/dio.dart';

import '../../model/dtos/base/error_response.dart';
import '../api/api_path.dart';
import 'dio_exception.dart';

class DioClient<T> {
  static final DioClient _instance = DioClient.share();
  static DioClient get instance => _instance;
  late Dio _dio;
  String baseUrl = 'http://192.168.1.121:80';
  String version = 'v0';
  int receiveTimeout = 5000;
  int connectionTimeout = 3000;
  DioClient.share() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectionTimeout),
    ));
  }

  Future<T?> requestData(
      {required ApiType apiType,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      required T Function(Map<String, dynamic>) parser}) async {
    try {
      final response = await _dio.request(
        apiType.url,
        options: Options(
          method: apiType.method,
          headers: headers ?? apiType.headers,
        ),
        queryParameters: query,
        data: data,
      );
      print("Response Data: ${response.data}");
      return parser(response.data);
    } on DioException catch (error) {
      final errorMessage = DioClientException.fromDioError(error).toString();
      final errorCode = DioClientException.fromDioError(error).getErrorCode();
      if (errorCode == 401) {
        //ToDo: logout
      }
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
    return null;
  }
}
