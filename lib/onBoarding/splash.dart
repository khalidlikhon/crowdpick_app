import 'package:crowdpick_app/component/static_styles.dart';
import 'package:crowdpick_app/onBoarding/controllers/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SplashController());

    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Center(
        child: Obx(() => AnimatedScale(
          scale: c.scale.value,
          duration: 1400.milliseconds,
          curve: Curves.easeOutExpo,
          child: AnimatedOpacity(
            opacity: c.opacity.value,
            duration: 800.milliseconds,
            curve: Curves.easeInOut,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
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
        )),
      ),
    );
  }
}
