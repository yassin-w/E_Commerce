// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api/auth/Authservice.dart';
import 'api/constant/endpoints.dart';

class DioClient {
  // dio instance
  String? accessToken;
  static BaseOptions options = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: Endpoints.connectionTimeout,
      receiveTimeout: Endpoints.receiveTimeout,
      responseType: ResponseType.json);
  // injecting dio instance

  Dio dio = Dio(options);

  DioClient() {
    dio.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      accessToken = await AuthService(FlutterSecureStorage()).getToken();
      options.headers['Authorization'] = 'Bearer $accessToken';
      print(options.headers);
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401)) {
        if (await AuthService(FlutterSecureStorage()).getrefreshToken() != "") {
          await refreshToken();
          final opts = Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers);
          final cloneReq = await dio.request(error.requestOptions.path,
              options: opts,
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters);

          return handler.resolve(cloneReq);
        }
      }
      // todo: will finish this
      return handler.next(error);
    }));
  }

  Future<void> refreshToken() async {
    final refreshToken =
        await AuthService(FlutterSecureStorage()).getrefreshToken();
    print("refresh token called");
    final response = await Dio().post(
        'http://192.168.0.130:8081/api/auth/refreshtoken',
        data: {'refreshToken': refreshToken});
    print("response in refresh token is ----->");
    if (response.statusCode == 200) {
      print(response.data);
      await AuthService(FlutterSecureStorage())
          .setToken(response.data["accessToken"]);
      await AuthService(FlutterSecureStorage())
          .setrefreshToken(response.data["refreshToken"]);
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<Response<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
