import 'package:flutter/material.dart';

class costomFormField extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  const costomFormField({ super.key,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        cursorColor: Color(0xFF95E143),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFB0B0B0), fontSize: 14,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0xFF95E143)),
          ),
        ),
      ),
    );
  }
}


///Icon Button
Widget socialIconButton({
  required String iconPath,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(8),
    child: Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
      ),
    ),
  );
}



//
class onBoardingFooterText extends StatelessWidget {

  final String title;
  final String buttonName;
  final VoidCallback OnTap;

  const onBoardingFooterText({super.key, required this.title, required this.buttonName, required this.OnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            '$title ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 11
            )
        ),
        InkWell(
            onTap: OnTap,
            child: Text(
              buttonName,
              style: TextStyle(
                color: Color(0xFF95E143),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            )
        )
      ],
    );
  }
}
