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
        child: RefreshIndicator(
          onRefresh: () => controller.reset(delay: 800),
          color: const Color(0xFF95E143),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(), // required for RefreshIndicator
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
        CustomFormField(
          hintText: 'Enter Your Organizer License',
          controller: controller.licenseController,
        ),
        const SizedBox(height: 10),
        const Text('Password', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        Obx(
          () => CustomFormField(
            hintText: 'Enter Your Password',
            obscureText: !controller.loginPasswordVisible.value,
            prefixIcon: Icons.lock_outline,
            suffixIcon: IconButton(
              icon: Icon(
                controller.loginPasswordVisible.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: controller.loginPasswordVisible.value
                    ? Colors.white
                    : Colors.grey,
              ),
              onPressed: controller.toggleLoginPasswordVisibility,
            ),
            controller: controller.passwordController,
          ),
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
        CustomFormField(
          hintText: 'Enter Your organization name',
          controller: controller.organizationNameController,
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
        CustomFormField(
          hintText: 'Your full name',
          prefixIcon: Icons.person_outline,
          controller: controller.fullNameController,
        ),
        const SizedBox(height: 10),
        const Text('Email Address', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        CustomFormField(
          hintText: 'Enter Email Address',
          prefixIcon: Icons.email_outlined,
          controller: controller.emailController,
        ),
        const SizedBox(height: 10),
        const Text('Phone Number', style: TextStyle(color: Color(0xFFB0B0B0))),
        const SizedBox(height: 6),
        CustomFormField(
          hintText: 'Enter Phone Number',
          prefixIcon: Icons.call_outlined,
          controller: controller.phoneController,
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
                  Obx(()=> CustomFormField(
                    hintText: 'Set a strong pass',
                    prefixIcon: Icons.lock_outline,
                    obscureText: !controller.registerPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.registerPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: controller.registerPasswordVisible.value
                            ? Colors.white
                            : Colors.grey,
                      ),
                      onPressed: controller.toggleRegisterPasswordVisibility,
                    ),
                    controller: controller.setPasswordController,
                  )),
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
                  Obx(()=> CustomFormField(
                    hintText: 'Re-enter your pass',
                    prefixIcon: Icons.lock_outline,
                    obscureText: !controller.registerConfirmPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.registerConfirmPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: controller.registerConfirmPasswordVisible.value
                            ? Colors.white
                            : Colors.grey,
                      ),
                      onPressed: controller.toggleRegisterConfirmPasswordVisibility,
                    ),
                    controller: controller.confirmPasswordController,
                  )),
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
