import 'package:crowdpick_app/onBoarding/VerificationScreens/setNewPassword.dart';
import 'package:flutter/material.dart';
import '../../component/authGuide.dart';


class otpVerificationScreen extends StatelessWidget {

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
            OTPverificationGuide,
            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //TODO: OTP field
                  appOtpField(),
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
                            builder: (context) => setNewPasswordScreen(),
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


class appOtpField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          width: 45,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFF95E143), width: 1.2),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 5) {
                FocusScope.of(context).nextFocus(); // move to next box
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus(); // move to previous box
              }
            },
          ),
        );
      }),
    );
  }
}
