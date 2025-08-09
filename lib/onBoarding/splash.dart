import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  double animationScale = 0.0;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        animationScale = 1.2;
        opacity = 1.0;
      });
    });

    Future.delayed(Duration(milliseconds: 2400), () {
      Navigator.pushNamedAndRemoveUntil(context, '/loginScreen', (route)=>false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Center(
        child: AnimatedScale(
          scale: animationScale,
          duration: Duration(milliseconds: 1400),
          curve: Curves.easeOutExpo,
          child: AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Crowd',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'pick',
                  style: TextStyle(
                    color: Color(0xFF95E143),
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
