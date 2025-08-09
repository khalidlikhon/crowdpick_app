import 'package:crowdpick_app/component/_customWidgets/textFormField.dart';
import 'package:crowdpick_app/onBoarding/VerificationScreens/otpVerificationScreen.dart';
import 'package:flutter/material.dart';
import '../../component/authGuide.dart';

class emailVerificationScreen extends StatelessWidget {

  bool onClick = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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

            // TODO just Change this - base Screen
            emailVerificationGuide,
            SizedBox(height: 30),
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //TODO: email or phone number field
                  Text('Email or Phone Number', style: TextStyle(
                    color: Color(0xFFB0B0B0),
                  )),
                  SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Enter your registered email or phone',
                    onChanged: (String value) {  },),

                  SizedBox(height: 22),

                  //TODO: ElevatedButton
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: onClick ? Color(0xFF95E143) : Color(0xFF212121),
                        foregroundColor: Colors.black, // for ripple/text
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => otpVerificationScreen(),
                          ),
                        );
                        onClick = !onClick;
                      },
                      child: Icon(
                        Icons.navigate_next_outlined,
                        color: onClick ? Colors.black : Colors.white,
                        size: 18,
                      )

                    ),
                  ),
                ],
              ),
            )


          ]
      ),
    );
  }
}
