import 'package:bividpharma/model/dtos/base/api_error.dart';
import 'package:bividpharma/model/dtos/base/m_base_response.dart';
import 'package:bividpharma/ui/my_navigation.dart';
import 'package:bividpharma/ui/screen_routes.dart';
import 'package:bividpharma/utils/local_share_preference.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/api_path.dart';
import 'dio_exception.dart';

class DioClient {
  static final DioClient _instance = DioClient.share();
  static DioClient get instance => _instance;
  late Dio _dio;
  String baseUrl = 'http://192.168.1.121:80';
  // String baseUrl = 'http://192.168.1.128:8000';
  String version = 'v0';
  int receiveTimeout = 5000;
  int connectionTimeout = 3000;

  DioClient.share() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectionTimeout),
    ));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (response, handler) => handler.next(response),
      onError: (DioException e, handler) {
        print(e.response?.data['error']);
        if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
          SharedPreferencesManager.instance.clearUserInfo();
          SharedPreferencesManager.instance.saveIsLogin = false;
          MyNavigation.intentWithDataReplaced(ScreenRouteName.loginPage);

          Future.microtask(() {
            MyNavigation.resetToLogin();
          });
        } else {
          handler.next(e);
        }
      },
    ));
  }

  Future<Either<ApiError, T>> requestData<T>(
      {required ApiType apiType,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      required T Function(Object?) parser}) async {
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
      debugPrint("Response Data: ${response.data}");
      final result = parser(response.data);
      return Right(result);
    } on DioException catch (error) {
      final errorMessage = DioClientException.fromDioError(error).toString();
      final errorCode = DioClientException.fromDioError(error).getErrorCode();
      return Left(ApiError(code: errorCode, message: errorMessage));
    } catch (e) {
      return Left(ApiError(code: -1, message: e.toString()));
    }
  }

  Future<MBaseResponse<T>> request<T>(
      {required ApiType apiType,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      required T Function(Object?) fromJsonT}) async {
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
      return MBaseResponse<T>.fromJson(response.data, fromJsonT);
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
  }

  Future<Either<ApiError, MBaseResponse<T>>> request2<T>({
    required ApiType apiType,
    String? url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    required T Function(Object?) fromJsonT,
  }) async {
    try {
      final response = await _dio.request(
        url ?? apiType.url,
        options: Options(
          method: apiType.method,
          headers: headers ?? apiType.headers,
        ),
        queryParameters: query,
        data: data,
      );

      print("Response Data: ${response.data}");

      // Parse response JSON vào MBaseResponse<T>
      final result = MBaseResponse<T>.fromJson(response.data, fromJsonT);

      if (result.error != null) {
        return Left(ApiError(
          code: result.error!.code,
          message: result.error?.message ?? "",
        ));
      }

      return Right(result);
    } on DioException catch (error) {
      final errorMessage = DioClientException.fromDioError(error).toString();
      final errorCode = DioClientException.fromDioError(error).getErrorCode();

      return Left(ApiError(code: errorCode, message: errorMessage));
    } catch (e) {
      return Left(ApiError(code: -1, message: e.toString()));
    }
  }
}
