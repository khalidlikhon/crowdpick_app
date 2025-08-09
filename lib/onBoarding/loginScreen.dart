import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';

import '../component/_customWidgets/textFormField.dart';
import '../component/authGuide.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  bool keepLoggedin = false;
  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
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
            LoginGuide,
            SizedBox(height: 50),
        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email or Phone Number', style: TextStyle(color: Color(0xFFB0B0B0))),
                  SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Enter email or phone number',
                    onChanged: (String value) {  },
                  ),
                  SizedBox(height: 11),
        
                  Text('Password', style: TextStyle(color: Color(0xFFB0B0B0))),
                  SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Enter your password',
                    obscureText: true, onChanged: (String value) {  },
                  ),
                  SizedBox(height: 13),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: keepLoggedin,
                            onChanged: (value) {
                              setState(() {
                                keepLoggedin = value!;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Color(0xFF95E143),
                          ),
                          Text('Keep me logged in', style: TextStyle(color: Color(0xFFB0B0B0),)),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgotPassword');
                        },
                        child: Text('Forgot Password?', style: TextStyle(color: Color(0xFF95E143))),
                      ),
                    ],
                  ),
                  SizedBox(height: 13),
        
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
                        });
                        Navigator.pushNamed(context, '/homeScreen');
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: onClick ? Colors.black : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
        
                  Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xFF212121), thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('or', style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(child: Divider(color: Color(0xFF212121), thickness: 1)),
                    ],
                  ),
                  SizedBox(height: 20),
        
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
                  SizedBox(height: 20),
                ],
              ),
            ),
        
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                onBoardingFooterText(
                  title: "Don't you have an account? ",
                  buttonName: 'Sign UP',
                  OnTap: () {
                    Navigator.pushNamed(context, '/singUpScreen');
                  },
                ),
                SizedBox(height: 4),
        
                onBoardingFooterText(
                  title: 'Need access to your organizer tools? ',
                  buttonName: 'Access as Organizer',
                  OnTap: () {
                    Navigator.pushNamed(context, '/organizerAuthScreen');
                  },
                ),
              ],
            ),

            SizedBox(height: 15)
        
          ],
        ),
      ),
    );
  }
}



