// lib/views/splash_screen.dart
import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/splashController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SplashController());

    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Center(
        child: Obx(
              () => AnimatedScale(
            scale: c.scale.value,
            duration: 1200.milliseconds,
            curve: Curves.easeOutBack, // feels more lively than easeOutExpo
            child: AnimatedOpacity(
              opacity: c.opacity.value,
              duration: 1000.milliseconds,
              curve: Curves.easeIn,
              child: AnimatedSlide(
                // extra polish → slide slightly from bottom to center
                offset: c.opacity.value == 0 ? const Offset(0, 0.2) : Offset.zero,
                duration: 1000.milliseconds,
                curve: Curves.easeOut,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Crowd',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      'pick',
                      style: TextStyle(
                        color: Color(0xFF95E143),
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
