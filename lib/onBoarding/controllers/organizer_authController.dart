import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizerAuthController extends GetxController {
  // Toggle between login and register
  var isLogin = true.obs;

  // Login fields
  var license = ''.obs;
  var password = ''.obs;

  // Register fields
  var organizationName = ''.obs;
  var selectedCountry = Rx<String?>(null);
  var selectedCurrency = Rx<String?>(null);

  var fullName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var setPassword = ''.obs;
  var confirmPassword = ''.obs;

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

  // Login logic
  // Login logic
  void login() {
    accessOnClick.value = true;
    isLoginLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      print('Login pressed: license=${license.value}, password=${password.value}');
      isLoginLoading.value = false;

      // Show snackbar after login "succeeds"
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


  void register() {
    joinOnClick.value = true;
    isRegisterLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      print('Register pressed: org=${organizationName.value}, ...');

      // Show success message
      Get.snackbar(
        'Registration',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(18),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
      );

      // Navigate after showing snackbar
      toggleLogin(true);


      isRegisterLoading.value = false;
    });
  }


}
