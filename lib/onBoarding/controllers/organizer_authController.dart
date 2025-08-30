import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizerAuthController extends GetxController {
  var isLogin = true.obs;

  // Login fields
  TextEditingController licenseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginPasswordVisible = false.obs;

  // Register fields
  var organizationName = ''.obs;
  var selectedCountry = Rx<String?>(null);
  var selectedCurrency = Rx<String?>(null);

  TextEditingController organizationNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController setPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var registerPasswordVisible = false.obs; // Added
  var registerConfirmPasswordVisible = false.obs; // Added

  // Country and currency mapping
  final List<String> countries = ['Bangladesh', 'India', 'USA', 'UK', 'Canada'];
  final Map<String, String> countryCurrency = {
    'Bangladesh': 'BDT',
    'India': 'INR',
    'USA': 'USD',
    'UK': 'GBP',
    'Canada': 'CAD',
  };

  // Separate button onChange & loading for login & register
  var accessOnClick = false.obs;
  var joinOnClick = false.obs;
  var isLoginLoading = false.obs;
  var isRegisterLoading = false.obs;

  // Toggle login/register view
  void toggleLogin(bool value) {
    isLogin.value = value;
  }

  // Select country & auto-update currency
  void selectCountry(String? value) {
    selectedCountry.value = value;
    selectedCurrency.value = value != null ? countryCurrency[value] : null;
  }

  // Select currency manually
  void selectCurrency(String? value) {
    selectedCurrency.value = value;
  }

  // Password visibility toggles
  void toggleLoginPasswordVisibility() {
    loginPasswordVisible.value = !loginPasswordVisible.value;
  }

  void toggleRegisterPasswordVisibility() {
    registerPasswordVisible.value = !registerPasswordVisible.value;
  }

  void toggleRegisterConfirmPasswordVisibility() {
    registerConfirmPasswordVisible.value = !registerConfirmPasswordVisible.value;
  }

  // Login logic
  void login() {
    accessOnClick.value = true;
    isLoginLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      print('Login pressed: license=${licenseController.value}, password=${passwordController.value}');
      isLoginLoading.value = false;

      Get.snackbar(
        'Login',
        'Login Successful',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(18),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
      );
    });
  }

  // Register logic
  void register() {
    joinOnClick.value = true;
    isRegisterLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      print('Register pressed: org=${organizationName.value}, ...');

      Get.snackbar(
        'Registration',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(18),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
      );

      toggleLogin(true);
      isRegisterLoading.value = false;
    });
  }

  /// Reset all fields
  Future<void> reset({int delay = 500}) async {
    await Future.delayed(Duration(milliseconds: delay));

    // Clear TextEditingControllers
    licenseController.clear();
    passwordController.clear();
    organizationNameController.clear();
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    setPasswordController.clear();
    confirmPasswordController.clear();

    // Reset toggles
    loginPasswordVisible.value = false;
    registerPasswordVisible.value = false;
    registerConfirmPasswordVisible.value = false;

    // Reset other states
    accessOnClick.value = false;
    joinOnClick.value = false;
    isLoginLoading.value = false;
    isRegisterLoading.value = false;
  }
}
