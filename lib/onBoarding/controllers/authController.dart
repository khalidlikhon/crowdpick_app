import 'package:get/get.dart';


/// LoginController
class LoginController extends GetxController {
  var keepLoggedIn = false.obs;
  var onClick = false.obs;

  void toggleKeepLoggedIn(bool? value) {
    keepLoggedIn.value = value ?? false;
  }

  void login() {
    onClick.value = true;
    Get.offAllNamed('/homeScreen');
  }
}


/// SignupController
class SignupController extends GetxController{
  var onClick = false.obs;

  void signup() {
    onClick.value = true;
    Get.offAllNamed('/loginScreen');
  }
}