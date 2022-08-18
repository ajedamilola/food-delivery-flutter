import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/congrats.dart';
import 'package:food_delivery_app/pages/email_verification.dart';
import 'package:food_delivery_app/pages/feature_slides.dart';
import 'package:food_delivery_app/pages/home.dart';
import 'package:food_delivery_app/pages/login.dart';
import 'package:food_delivery_app/pages/signup.dart';
import 'package:food_delivery_app/splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Color.fromARGB(255, 47, 138, 103)),
    routes: {
      "/": (_) => SplashScreen(),
      "/features": (_) => FeaturesSlide(),
      "/auth": (_) => Login(),
      "/auth/new": (_) => SignUp(),
      "/auth/verify": (_) => EmailVerification(),
      "/auth/congrats": (_) => CongratsPage(),
      "/main": (_) => Home()
    },
  ));
}
