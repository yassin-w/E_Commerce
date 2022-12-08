// ignore_for_file: prefer_const_constructors, file_names, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../model/product/user/user.dart';
import '../../dio_client.dart';
import '../constant/endpoints.dart';
import 'Authservice.dart';

class AuthApi extends DioClient {
  final DioClient dioClient = DioClient();

  Future<User> login(String username, String password) async {
    try {
      print("f5f5f5f5f5f5f5f55f5f");
      final Response response = await dioClient.post(
        '${Endpoints.authurl}/signin',
        data: {
          'username': username,
          'password': password,
        },
      );
      print("dsadashjdasdhgjasghdaghjsdghjadghjashgjdhjagsg");
      print('response.data["accessToken"]');
      await AuthService(FlutterSecureStorage())
          .setToken(response.data["accessToken"]);
      await AuthService(FlutterSecureStorage())
          .setrefreshToken(response.data["refreshToken"]);
      return User.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<void> signup(
    String username,
    String password,
    String email,
  ) async {
    try {
      print("sign up ");
      final Response response = await Dio().post(
        'http://192.168.0.130:8081/api/auth/signup',
        data: {'username': username, 'password': password, 'email': email},
      );
      if (response.data['message'] == 'User registered successfully!') {
        print(
            "User registered successfully! /*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/");
        await login(username, password);
      }
    } on DioError catch (e) {
      rethrow;
    }
  }
}
