import 'package:crowdpick_app/component/_customWidgets/textFormField.dart';
import 'package:flutter/material.dart';
import '../../component/authGuide.dart';


class setNewPasswordScreen extends StatelessWidget {
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
            restPasswordGuide,
            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //TODO: email or phone number field
                  Text('Set a Password', style: TextStyle(
                    color: Color(0xFFB0B0B0),
                  )),
                  SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Create a secure password',
                    onChanged: (String value) {  },),

                  SizedBox(height: 18),

                  Text('Confirm Password', style: TextStyle(
                    color: Color(0xFFB0B0B0),
                  )),
                  SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Re-enter your password',
                    obscureText: true,
                    onChanged: (String value) {  },),

                  SizedBox(height: 28),

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
                        onClick = !onClick;
                        Navigator.pushNamedAndRemoveUntil(context, '/loginScreen', (route)=>false) ;
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: onClick ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
