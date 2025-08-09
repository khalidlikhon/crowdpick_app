
import 'package:flutter/material.dart';

final LoginGuide = Container(
  padding: EdgeInsets.symmetric(horizontal: 30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Log In', style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      )),
      SizedBox(height: 8),
      Text(
        'To log in, please enter your phone number or email address and confirm your password.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFB0B0B0),
        ),
      ),
    ],
  ),
);

final RegistrationGuide = Container(
  padding: EdgeInsets.symmetric(horizontal: 30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Sign Up', style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      )),
      SizedBox(height: 8),
      Text(
        'To sign up, quickly and securely using your social account below.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFB0B0B0),
        ),
      ),
    ],
  ),
);

final alternetGuide = Container(
  padding: EdgeInsets.symmetric(horizontal: 30),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Divider(
              color: Color(0xFF212121), // dark gray line
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              ' Prefer to sign up with your email or phone? ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Color(0xFF212121),
              thickness: 1,
            ),
          ),
        ],
      ),
      SizedBox(height: 1),
      Text(
        'Fill in your details below to create a new account.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFB0B0B0),
        ),
      ),

    ],
  ),
);

final OrganizerAuthenticationGuide = Container(
  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome to the',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
          )),
          Text('Organizer Panel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
          )),
        ],
      ),
      SizedBox(height: 8),
      Text(
        'Manage your events, access tools, and grow your audience with your verified organizer account.',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12,

          color: Color(0xFFB0B0B0),
        ),
      ),
    ],
  ),
);



final emailVerificationGuide = Container(
  padding: EdgeInsets.symmetric(horizontal: 30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Forgot Password', style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )),
      SizedBox(height: 8),
      Text(
        'Enter your registered phone number or email address to reset your password securely.',
        //textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFB0B0B0),
        ),
      ),
    ],
  ),
);

final OTPverificationGuide = Container(
  padding: EdgeInsets.symmetric(horizontal: 30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Verify OTP', style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )),
      SizedBox(height: 8),
      Text(
        'A 6-digit verification code has been sent to your phone or email. Enter the code below to continue.',
        style: TextStyle(
          color: Color(0xFFB0B0B0),
        ),
      ),
    ],
  ),
);

final restPasswordGuide = Container(
  padding: EdgeInsets.symmetric(horizontal: 30),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Reset Password', style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )),
      SizedBox(height: 8),
      Text(
        'Enter your new password below. Make sure it’s strong and secure.',
        style: TextStyle(
          color: Color(0xFFB0B0B0),
        ),
      ),
    ],
  ),
);
