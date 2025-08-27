import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/_customWidgets/textFormField.dart';
import '../../component/authGuide.dart';
import '../controllers/verificationController.dart';

class setNewPasswordScreen extends StatelessWidget {
  setNewPasswordScreen({super.key});

  final controller = Get.put(SetNewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
            restPasswordGuide,
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set a Password',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Create a secure password',
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  const SizedBox(height: 6),
                  costomFormField(
                    hintText: 'Re-enter your password',
                    obscureText: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 28),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF95E143),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: controller.goToLoginScreen,
                        child: controller.isLoading.value
                            ? SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF141414)),
                              )
                            : Text(
                                'Next',
                                style: TextStyle(
                                  color: Color(0xFF141414),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
