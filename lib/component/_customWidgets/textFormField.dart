import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller; // new
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const CustomFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212121),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller, // <-- assign controller here
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        cursorColor: const Color(0xFF95E143),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
          prefixIcon: prefixIcon != null
              ? Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Icon(prefixIcon, color: const Color(0xFFB0B0B0), size: 20),
          )
              : null,
          suffixIcon: suffixIcon != null
              ? Padding(padding: const EdgeInsets.only(right: 13), child: suffixIcon)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
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
      child: Center(child: Image.asset(iconPath, width: 24, height: 24)),
    ),
  );
}

//
class onBoardingFooterText extends StatelessWidget {
  final String title;
  final String buttonName;
  final VoidCallback OnTap;

  const onBoardingFooterText({
    super.key,
    required this.title,
    required this.buttonName,
    required this.OnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title ', style: TextStyle(color: Colors.white, fontSize: 11)),
        InkWell(
          onTap: OnTap,
          child: Text(
            buttonName,
            style: TextStyle(
              color: Color(0xFF95E143),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
