// ignore_for_file: file_names, avoid_print, prefer_const_constructors

import 'package:e_commerce/data/network/api/auth/authintication-api.dart';
import 'package:flutter/material.dart';

import '../Pages/products/dialogs/signup_dialog.dart';

class AuthProvider extends ChangeNotifier {
  AuthApi authApi = AuthApi();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    setLoading(true);
    final response = await authApi.login(username, password);
    print("==================*/*/*/*/*/*/*/*/*/*/*/*/*/*/===================");
    print(response.toString());
    setLoading(false);
  }

  Future<void> signup(String email, String password, String username,
      BuildContext context) async {
    setLoading(true);
    final response = await authApi.signup(username, password, email);
    print("==================*/*/*/*/*/*/*/*/*/*/*/*/*/*/===================");
    setLoading(false);
  }
}
