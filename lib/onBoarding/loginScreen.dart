import 'package:crowdpick_app/component/static_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/_customWidgets/textFormField.dart';
import '../component/authGuide.dart';
import 'controllers/authController.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
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
            LoginGuide,
            const SizedBox(height: 50),

            // Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email or Phone Number',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Enter email or phone number',
                    onChanged: (v) {},
                  ),

                  const SizedBox(height: 11),
                  const Text(
                    'Password',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Enter your password',
                    obscureText: true,
                    onChanged: (v) {},
                  ),

                  const SizedBox(height: 5),
                  // Checkbox
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: 0.9,
                              child: Checkbox(
                                value: controller.keepLoggedIn.value,
                                onChanged: controller.toggleKeepLoggedIn,
                                checkColor: const Color(0xFF212121),
                                activeColor: const Color(0xFF95E143),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // extra padding কমাবে
                              ),
                            ),
                            const Text(
                              'Keep me logged in',
                              style: TextStyle(fontSize: 12, color: Color(0xFFB0B0B0)),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed('/forgotPassword'),
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(fontSize: 12, color: Color(0xFF95E143)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13),

                  // Login Button
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
                        onPressed: controller.login,
                        child: controller.isLoading.value
                            ? SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF141414)),
                              )
                            : Text(
                                'Log In',
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
                  const SizedBox(height: 22),

                  // Divider
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(color: Color(0xFF212121), thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'or',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Color(0xFF212121), thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

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
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Footer
            onBoardingFooterText(
              title: "Don't you have an account? ",
              buttonName: 'Sign UP',
              OnTap: () => Get.toNamed('/singUpScreen'),
            ),
            const SizedBox(height: 4),
            onBoardingFooterText(
              title: 'Need access to your organizer tools? ',
              buttonName: 'Access as Organizer',
              OnTap: () => Get.toNamed('/organizerAuthScreen'),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
