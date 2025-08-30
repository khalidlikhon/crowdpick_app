import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var scale = 0.0.obs;
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    // Start animation immediately
    Future.delayed(100.milliseconds, () {
      scale.value = 1.0;
      opacity.value = 1.0;
    });

    // Navigate 1 second after full scale is reached
    Future.delayed(2100.milliseconds, () { // animation duration + 1s pause
      Get.offAllNamed('/loginScreen');
    });
  }
}
