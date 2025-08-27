import 'package:crowdpick_app/onBoarding/VerificationScreens/emailVerificationScreen.dart';
import 'package:crowdpick_app/onBoarding/loginScreen.dart';
import 'package:crowdpick_app/onBoarding/singUpScreen.dart';
import 'package:crowdpick_app/onBoarding/splash.dart';
import 'package:crowdpick_app/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onBoarding/organizer_authScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // MaterialApp → GetMaterialApp
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
        ),
      ),
      initialRoute: '/splashScreen',
      getPages: [
        GetPage(name: '/splashScreen', page: () => SplashScreen()),
        GetPage(name: '/homeScreen', page: () => homeScreen()),
        GetPage(name: '/loginScreen', page: () => loginScreen()),
        GetPage(name: '/singUpScreen', page: () => singUpScreen()),
        GetPage(name: '/organizerAuthScreen', page: () => OrganizerAuthScreen()),
        GetPage(name: '/forgotPassword', page: () => emailVerificationScreen()),
      ],
    );
  }
}
