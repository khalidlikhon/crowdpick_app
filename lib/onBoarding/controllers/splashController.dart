// lib/controllers/splash_controller.dart
import 'package:get/get.dart';

class SplashController extends GetxController {
  var scale = 0.0.obs;
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(200.milliseconds, () {
      scale.value = 1.2;
      opacity.value = 1.0;
    });

    Future.delayed(2400.milliseconds, () {
      Get.offAllNamed('/loginScreen');
    });
  }
}
