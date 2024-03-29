// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/Pages/splash/spalsh-page.dart';
import 'package:e_commerce/provider/auth-provider.dart';
import 'package:e_commerce/provider/product-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
              create: (context) => ProductProvider()),
          ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        ));
  }
}
