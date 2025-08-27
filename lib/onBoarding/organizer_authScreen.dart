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
                  Text(
                    'Crowd',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'pick',
                    style: TextStyle(
                      color: Color(0xFF95E143),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Welcome to",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Organizer Panel",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Manage your events efficiently using Crowdpick. "
                "Login if you're returning, or register to start organizing your first event!",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 28),

              // Login/Register toggle buttons
              Obx(
                () => Row(
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
                            color: Colors.white.withOpacity(0.2),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
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
                            color: Colors.white.withOpacity(0.2),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              Obx(
                () => controller.isLogin.value
                    ? LoginItems(controller: controller)
                    : OrganizerItems(controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// LoginItems
class LoginItems extends StatelessWidget {
  final OrganizerAuthController controller;

  const LoginItems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Organizer License',
          style: TextStyle(color: Color(0xFFB0B0B0)),
        ),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Enter Your Organizer License',
          onChanged: (val) => controller.license.value = val,
        ),
        const SizedBox(height: 10),
        const Text('Password', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Enter Your Password',
          obscureText: true,
          onChanged: (val) => controller.password.value = val,
        ),
        const SizedBox(height: 24),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.accessOnClick.value
                    ? const Color(0xFF95E143)
                    : const Color(0xFF212121),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: controller.login,
              child: controller.isLoginLoading.value
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Color(0xFF141414),
                      ),
                    )
                  : const Text(
                      'Access',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

/// OrganizerItems
class OrganizerItems extends StatelessWidget {
  final OrganizerAuthController controller;

  const OrganizerItems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Organization Name',
          style: TextStyle(color: Color(0xFFB0B0B0)),
        ),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Enter Your organization name',
          onChanged: (val) => controller.organizationName.value = val,
        ),
        const SizedBox(height: 12),
        // Country & Currency
        Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Country',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  Obx(
                    () => DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: _dropdownDecoration(),
                      dropdownColor: const Color(0xFF1E1E1E),
                      hint: const Text(
                        'Select Country',
                        style: TextStyle(color: Colors.grey),
                      ),
                      value: controller.selectedCountry.value,
                      onChanged: controller.selectCountry,
                      items: controller.countries
                          .map(
                            (c) => DropdownMenuItem(
                              value: c,
                              child: Text(c, overflow: TextOverflow.ellipsis),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Currency',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  Obx(
                    () => DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: _dropdownDecoration(),
                      dropdownColor: const Color(0xFF212121),
                      hint: const Text(
                        'Select Currency',
                        style: TextStyle(color: Color(0xFFB0B0B0)),
                      ),
                      value: controller.selectedCurrency.value,
                      onChanged: controller.selectCurrency,
                      items: controller.countryCurrency.values
                          .map(
                            (cur) => DropdownMenuItem(
                              value: cur,
                              child: Text(cur, overflow: TextOverflow.ellipsis),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Owner Information',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text('Full Name', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Your full name',
          onChanged: (val) => controller.fullName.value = val,
        ),
        const SizedBox(height: 10),
        const Text('Email Address', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Enter Email Address',
          onChanged: (val) => controller.email.value = val,
        ),
        const SizedBox(height: 10),
        const Text('Phone Number', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        costomFormField(
          hintText: 'Enter Phone Number',
          onChanged: (val) => controller.phone.value = val,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set a password',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Set a strong pass',
                    onChanged: (val) => controller.setPassword.value = val,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Confirm Password',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Re-enter your pass',
                    obscureText: true,
                    onChanged: (val) => controller.confirmPassword.value = val,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.joinOnClick.value
                    ? const Color(0xFF95E143)
                    : const Color(0xFF212121),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: controller.register,
              child: controller.isRegisterLoading.value
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Color(0xFF141414),
                      ),
                    )
                  : const Text(
                      'Join Crowdpick',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 20),
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
