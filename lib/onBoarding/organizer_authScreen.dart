import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/_customWidgets/textFormField.dart';
import 'controllers/organizer_authController.dart';

class OrganizerAuthScreen extends StatelessWidget {
  OrganizerAuthScreen({super.key});

  final OrganizerAuthController controller = Get.put(OrganizerAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Crowd',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700)),
                  Text('pick',
                      style: TextStyle(
                          color: Color(0xFF95E143),
                          fontSize: 25,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 30),
              const Text("Welcome to",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              const Text("Organizer Panel",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                "Manage your events efficiently using Crowdpick. "
                    "Login if you're returning, or register to start organizing your first event!",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 28),

              // Login/Register toggle buttons
              Obx(() => Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => controller.toggleLogin(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isLogin.value
                            ? const Color(0xFF95E143)
                            : Colors.transparent,
                        foregroundColor: controller.isLogin.value
                            ? Colors.black
                            : Colors.white,
                        elevation: 0,
                        side: BorderSide(
                            color: Colors.white.withOpacity(0.2)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Login",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => controller.toggleLogin(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !controller.isLogin.value
                            ? const Color(0xFF95E143)
                            : Colors.transparent,
                        foregroundColor: !controller.isLogin.value
                            ? Colors.black
                            : Colors.white,
                        elevation: 0,
                        side: BorderSide(
                            color: Colors.white.withOpacity(0.2)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Register",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 32),

              Obx(() => controller.isLogin.value
                  ? LoginItems(controller: controller)
                  : OrganizerItems(controller: controller)),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginItems extends StatelessWidget {
  final OrganizerAuthController controller;
  const LoginItems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Organizer License',
            style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Enter Your Organizer License',
          onChanged: (inputData) => controller.license.value = inputData,
        ),
        const SizedBox(height: 10),
        const Text('Password', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Enter Your Password',
          obscureText: true,
          onChanged: (inputData) => controller.password.value = inputData,
        ),
        const SizedBox(height: 24),
        Obx(()=> SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.login();
                controller.onClick(true);
                Get.snackbar(
                  'Login',
                  'Login button pressed',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.grey[900],
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(12),
                  borderRadius: 12,
                  duration: const Duration(seconds: 2),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.onClick.value ? const Color(0xFF95E143) : const Color(0xFF212121),
                foregroundColor: controller.onClick.value
                    ? Colors.black
                    : Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Text('Access'),
            )

        ),
        ),
        SizedBox(height: 20)

      ],
    );
  }
}

class OrganizerItems extends StatelessWidget {
  final OrganizerAuthController controller;
  const OrganizerItems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Organization Name',
            style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
            hintText: 'Enter Your organization name',
            onChanged: (val) => controller.organizationName.value = val),
        const SizedBox(height: 12),

        // Country & Currency
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Country',
                      style: TextStyle(color: Color(0xFFB0B0B0))),
                  const SizedBox(height: 6),
                  Obx(() => DropdownButtonFormField<String>(
                    decoration: _dropdownDecoration(),
                    dropdownColor: const Color(0xFF1E1E1E),
                    hint: const Text('Select Country',
                        style: TextStyle(color: Colors.grey)),
                    value: controller.selectedCountry.value,
                    onChanged: controller.selectCountry,
                    items: controller.countries
                        .map((country) => DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    ))
                        .toList(),
                  )),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Currency',
                      style: TextStyle(color: Color(0xFFB0B0B0))),
                  const SizedBox(height: 6),
                  Obx(() => DropdownButtonFormField<String>(
                    decoration: _dropdownDecoration(),
                    dropdownColor: const Color(0xFF1E1E1E),
                    hint: const Text('Select Currency',
                        style: TextStyle(color: Colors.grey)),
                    value: controller.selectedCurrency.value,
                    onChanged: controller.selectCurrency,
                    items: controller.countryCurrency.values
                        .map((currency) => DropdownMenuItem(
                      value: currency,
                      child: Text(currency),
                    ))
                        .toList(),
                  )),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        const Text('Owner Information',
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        const Text('Full Name', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
            hintText: 'Your full name',
            onChanged: (val) => controller.fullName.value = val),
        const SizedBox(height: 10),

        const Text('Email Address',
            style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
            hintText: 'Enter Email Address',
            onChanged: (val) => controller.email.value = val),
        const SizedBox(height: 10),

        const Text('Phone Number',
            style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
            hintText: 'Enter Phone Number',
            onChanged: (val) => controller.phone.value = val),
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Set a password',
                      style: TextStyle(color: Color(0xFFB0B0B0))),
                  const SizedBox(height: 6),
                  costomFormField(
                      hintText: 'Set a strong pass',
                      onChanged: (val) => controller.setPassword.value = val),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Confirm Password',
                      style: TextStyle(color: Color(0xFFB0B0B0))),
                  const SizedBox(height: 6),
                  costomFormField(
                      hintText: 'Re-enter your pass',
                      obscureText: true,
                      onChanged: (val) =>
                      controller.confirmPassword.value = val),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Obx(()=> SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.onClick(true);
                controller.register();

                // Show a snackbar using GetX
                Get.snackbar(
                  'Registration',
                  'Register button pressed',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor:  Colors.grey[900],
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(12),
                  borderRadius: 12,
                  duration: const Duration(seconds: 2),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.onClick.value ? const Color(0xFF95E143) : const Color(0xFF212121), //
                foregroundColor: controller.onClick.value
                    ? Colors.black
                    : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Text('Join Crowdpick',),
            )

        ),

        ),
        SizedBox(height: 20)
      ],
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF1E1E1E)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF95E143)),
      ),
    );
  }
}
