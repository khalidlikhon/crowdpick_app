import 'package:get/get.dart';
import '../VerificationScreens/otpVerificationScreen.dart';
import '../VerificationScreens/setNewPassword.dart';


/// EmailVerificationController
class EmailVerificationController extends GetxController {
  var onClick = true.obs;

  void toggleClick() {
    onClick.value = !onClick.value;
  }

  void goToOtpScreen() {
    toggleClick();
    Get.to(() => otpVerificationScreen());
  }
}


/// OtpVerificationController
class OtpVerificationController extends GetxController {
  var onClick = true.obs;

  void toggleClick() {
    onClick.value = !onClick.value;
  }

  void goToSetNewPassword() {
    toggleClick();
    Get.to(() => setNewPasswordScreen());
  }
}

/// SetNewPasswordController
class SetNewPasswordController extends GetxController {
  RxBool onClick = true.obs;

  void toggleButton() {
    onClick.value = !onClick.value;
  }

  void goToLoginScreen() {
    toggleButton();
    Get.offAllNamed('/loginScreen');
  }
}
