// lib/controllers/splash_controller.dart
import 'package:get/get.dart';

class SplashController extends GetxController {
  /// Reactive animation values
  var scale = 0.0.obs;
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    // Start animation after a short delay
    Future.delayed(200.milliseconds, () {
      scale.value = 1.0;   // natural size
      opacity.value = 1.0; // fully visible
    });

    // Navigate after animation is complete
    Future.delayed(2400.milliseconds, () {
      Get.offAllNamed('/loginScreen');
    });
  }
}
