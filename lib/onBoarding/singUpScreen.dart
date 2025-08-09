import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';

import '../component/_customWidgets/textFormField.dart';
import '../component/authGuide.dart';

class singUpScreen extends StatefulWidget {
  @override
  State<singUpScreen> createState() => _singUpScreenState();
}

class _singUpScreenState extends State<singUpScreen> {
  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Crowd',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'pick',
                    style: TextStyle(
                      color: Color(0xFF95E143),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            RegistrationGuide,
            SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: socialIconButton(
                      iconPath: '/icons/googleIcon.png',
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: socialIconButton(
                      iconPath: '/icons/facebookIcon.png',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 18),
            alternetGuide,
            SizedBox(height: 28),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full Name', style: TextStyle(color: Color(0xFFB0B0B0))),
                  SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Your full name',
                    onChanged: (String value) {  },
                  ),
                  SizedBox(height: 11),

                  // Side-by-side email + phone
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email Address', style: TextStyle(color: Color(0xFFB0B0B0))),
                            SizedBox(height: 6),
                            costomFormField(
                              hintText: 'Your email',
                              onChanged: (String value) {  },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone number', style: TextStyle(color: Color(0xFFB0B0B0))),
                            SizedBox(height: 6),
                            costomFormField(
                              hintText: 'Your Number',
                              onChanged: (String value) {  },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11),

                  Text('Password', style: TextStyle(color: Color(0xFFB0B0B0))),
                  SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Set a strong password',
                    obscureText: true, onChanged: (String value) {  },
                  ),
                  SizedBox(height: 22),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: onClick ? Color(0xFF95E143) : Color(0xFF212121),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          onClick = true;
                          Navigator.pushNamedAndRemoveUntil(context, '/loginScreen', (route)=>false);
                        });
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: onClick ? Colors.black : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  onBoardingFooterText(
                    title: 'have an account? ',
                    buttonName: 'Login',
                    OnTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
