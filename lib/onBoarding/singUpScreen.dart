import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crowdpick_app/component/static_styles.dart';
import '../component/_customWidgets/textFormField.dart';
import '../component/authGuide.dart';
import 'controllers/authController.dart';

class singUpScreen extends StatelessWidget {
  const singUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SignupController());

    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Crowd', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700)),
                Text('pick', style: TextStyle(color: Color(0xFF95E143), fontSize: 25, fontWeight: FontWeight.w700)),
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
                  Expanded(child: socialIconButton(iconPath: 'assets/icons/googleIcon.png', onTap: () {})),
                  const SizedBox(width: 20),
                  Expanded(child: socialIconButton(iconPath: 'assets/icons/facebookIcon.png', onTap: () {})),
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
                  const Text('Full Name', style: TextStyle(color: Color(0xFFB0B0B0))),
                  const SizedBox(height: 6),
                  costomFormField(hintText: 'Your full name', onChanged: (v) {}),

                  const SizedBox(height: 11),
                  // Side-by-side Email + Phone
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Email Address', style: TextStyle(color: Color(0xFFB0B0B0))),
                            const SizedBox(height: 6),
                            costomFormField(hintText: 'Your email', onChanged: (v) {}),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Phone number', style: TextStyle(color: Color(0xFFB0B0B0))),
                            const SizedBox(height: 6),
                            costomFormField(hintText: 'Your Number', onChanged: (v) {}),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 11),
                  const Text('Password', style: TextStyle(color: Color(0xFFB0B0B0))),
                  const SizedBox(height: 6),
                  costomFormField(hintText: 'Set a strong password', obscureText: true, onChanged: (v) {}),

                  const SizedBox(height: 22),

                  // Sign Up Button
                  Obx(() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: c.onClick.value ? const Color(0xFF95E143) : const Color(0xFF212121),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: c.signup,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: c.onClick.value ? Colors.black : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),

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
    );
  }
}
