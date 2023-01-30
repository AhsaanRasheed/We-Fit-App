import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wefit/auth/login/login_vu.dart';
import 'package:wefit/home/home_vu.dart';
import 'package:wefit/utils/preferences.dart';
import 'package:wefit/utils/we_router.dart';

import '../../utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = UserPreferences.getToken();
    Timer(const Duration(seconds: 2), () {
      WeRouter.pushReplacement(context,
          token == 'FIREBASE_USER' ? const HomeScreen() : const LoginScreen());
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Image.asset('assets/logo.png', height: 160, width: 160)),
    );
  }
}
