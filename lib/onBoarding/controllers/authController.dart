import 'package:get/get.dart';

/// LoginController
class LoginController extends GetxController {
  var keepLoggedIn = false.obs;
  var onClick = false.obs;
  var isLoading = false.obs;

  void toggleKeepLoggedIn(bool? value) {
    keepLoggedIn.value = value ?? false;
  }

  void login() {
    onClick.value = true;
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () => Get.offAllNamed('/homeScreen'));
  }
}

/// SignupController
class SignupController extends GetxController {
  var onClick = false.obs;
  var isLoading = false.obs;

  void signup() {
    onClick.value = true;
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1), () => Get.offAllNamed('/loginScreen'));
  }
}
