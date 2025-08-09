import 'package:crowdpick_app/onBoarding/VerificationScreens/emailVerificationScreen.dart';
import 'package:crowdpick_app/onBoarding/loginScreen.dart';
import 'package:crowdpick_app/onBoarding/singUpScreen.dart';
import 'package:crowdpick_app/onBoarding/splash.dart';
import 'package:crowdpick_app/screens/homeScreen.dart';
import 'package:flutter/material.dart';

import 'onBoarding/organizerAuth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
        ),
      ),

      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context)=> splashScreen(),
        '/homeScreen': (context)=> homeScreen(),
        '/loginScreen': (context)=> loginScreen(),
        '/singUpScreen': (context)=> singUpScreen(),
        '/organizerAuthScreen': (context)=> organizerAuthScreen(),
        '/forgotPassword': (context)=> emailVerificationScreen(),


      },
    );
  }
}
