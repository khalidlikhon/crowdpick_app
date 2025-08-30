import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crowdpick_app/component/static_styles.dart';
import '../component/_customWidgets/textFormField.dart';
import '../component/authGuide.dart';
import '../component/static_styles.dart';
import 'controllers/authController.dart';

class singUpScreen extends StatelessWidget {
  const singUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => controller.reset(delay: 800),
          color: const Color(0xFF95E143),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(), // required for RefreshIndicator
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                // Title
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
                RegistrationGuide,
                const SizedBox(height: 25),

                // Social buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: socialIconButton(
                          iconPath: 'assets/icons/googleIcon.png',
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: socialIconButton(
                          iconPath: 'assets/icons/facebookIcon.png',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),
                alternetGuide,
                const SizedBox(height: 28),

                // Form
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Full Name',
                        style: TextStyle(color: Color(0xFFB0B0B0)),
                      ),
                      const SizedBox(height: 6),
                      CustomFormField(
                        hintText: 'Your full name',
                        prefixIcon: Icons.person_outline,
                        controller: controller.fullNameController,
                      ),

                      const SizedBox(height: 11),
                      // Side-by-side Email + Phone
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Email Address',
                                  style: TextStyle(color: Color(0xFFB0B0B0)),
                                ),
                                const SizedBox(height: 6),
                                CustomFormField(
                                  hintText: 'Your email',
                                  prefixIcon: Icons.email_outlined,
                                  controller: controller.emailController,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Phone number',
                                  style: TextStyle(color: Color(0xFFB0B0B0)),
                                ),
                                const SizedBox(height: 6),
                                CustomFormField(
                                  hintText: 'Your Number',
                                  prefixIcon: Icons.call_outlined,
                                  controller: controller.phoneController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 11),
                      const Text(
                        'Password',
                        style: TextStyle(color: Color(0xFFB0B0B0)),
                      ),
                      const SizedBox(height: 6),

                      Obx(
                        () => CustomFormField(
                          hintText: 'Set a strong password',
                          prefixIcon: Icons.lock_outline,
                          obscureText: !controller.isPasswordVisible.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: controller.isPasswordVisible.value
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                         controller: controller.passwordController,
                        ),
                      ),

                      const SizedBox(height: 22),

                      // Sign Up Button
                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: controller.onClick.value
                                  ? const Color(0xFF95E143)
                                  : const Color(0xFF212121),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: controller.signup,
                            child: controller.isLoading.value
                                ? SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Color(0xFF141414),
                                    ),
                                  )
                                : Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: controller.onClick.value
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Footer
                      onBoardingFooterText(
                        title: 'have an account? ',
                        buttonName: 'Login',
                        OnTap: () => Get.back(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
