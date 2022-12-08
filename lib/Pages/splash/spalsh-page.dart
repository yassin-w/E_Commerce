// ignore_for_file: prefer_const_constructors, file_names

import 'package:e_commerce/Pages/authintication/login.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginPage(),
      duration: 2000,
      imageSize: 130,
      imageSrc: "assets/logo/logo.png",
      text: "WELCOME",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
