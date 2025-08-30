import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// LoginController
class LoginController extends GetxController {
  var keepLoggedIn = false.obs;
  var onClick = false.obs;
  var isLoading = false.obs;
  final isPasswordVisible = false.obs;

  /// TextEditingControllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void toggleKeepLoggedIn(bool? value) {
    keepLoggedIn.value = value ?? false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    onClick.value = true;
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () => Get.offAllNamed('/homeScreen'));
  }

  /// Reset all login fields and states
  Future<void> reset({int delay = 500}) async {
    await Future.delayed(Duration(milliseconds: delay));

    emailController.clear();
    passwordController.clear();
    keepLoggedIn.value = false;
    onClick.value = false;
    isLoading.value = false;
    isPasswordVisible.value = false;
  }
}

/// SignupController
class SignupController extends GetxController {
  var onClick = false.obs;
  var isLoading = false.obs;

  // Password visibility
  final isPasswordVisible = false.obs;

  // TextEditingControllers for all fields
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  /// Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Signup logic
  void signup() {
    onClick.value = true;
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      print('SignUp pressed: '
          'FullName=${fullNameController.text}, '
          'Email=${emailController.text}, '
          'Phone=${phoneController.text}, '
          'Password=${passwordController.text}');

      isLoading.value = false;
      onClick.value = false;

      Get.snackbar(
        'Signup',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(18),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
      );

      // Optional: navigate after signup
      Get.offAllNamed('/loginScreen');
    });
  }

  /// Reset all form fields
  Future<void> reset({int delay = 500}) async {
    await Future.delayed(Duration(milliseconds: delay));
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    isPasswordVisible.value = false;
    onClick.value = false;
    isLoading.value = false;
  }
}