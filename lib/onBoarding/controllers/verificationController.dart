import 'package:get/get.dart';
import '../VerificationScreens/otpVerificationScreen.dart';
import '../VerificationScreens/setNewPassword.dart';


/// EmailVerificationController
class EmailVerificationController extends GetxController {
  var onClick = false.obs;
  var isLoading = false.obs;


  void toggleClick() {
    onClick.value = !onClick.value;
  }

  void goToOtpScreen() {
    toggleClick();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1), ()=> Get.to(() => otpVerificationScreen()));
  }
}


/// OtpVerificationController
class OtpVerificationController extends GetxController {
  var onClick = false.obs;
  var isLoading = false.obs;


  void toggleClick() {
    onClick.value = !onClick.value;
  }

  void goToSetNewPassword() {
    toggleClick();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1), ()=> Get.to(() => setNewPasswordScreen()));
  }
}

/// SetNewPasswordController
class SetNewPasswordController extends GetxController {
  RxBool onClick = false.obs;
  var isLoading = false.obs;

  void toggleButton() {
    onClick.value = !onClick.value;
  }

  void goToLoginScreen() {
    toggleButton();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), ()=>  Get.offAllNamed('/loginScreen'));
  }
}
