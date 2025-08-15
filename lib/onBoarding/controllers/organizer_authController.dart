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

  // Button click state (e.g., for changing button color)
  var onClick = false.obs;

  // Toggle login/register view
  void toggleLogin(bool value) {
    isLogin.value = value;
  }

  // Update button click state
  void buttonOnClick(bool value) {
    onClick.value = value;
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
  void login() {
    print('Login pressed: license=${license.value}, password=${password.value}');
    // TODO: Add your API call here
  }

  // Registration logic
  void register() {
    print(
        'Register pressed: org=${organizationName.value}, country=${selectedCountry.value}, currency=${selectedCurrency.value}, fullName=${fullName.value}, email=${email.value}, phone=${phone.value}');
    // TODO: Add your API call here
  }
}
