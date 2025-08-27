import 'package:crowdpick_app/component/_customWidgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/authGuide.dart';
import '../controllers/verificationController.dart';

class emailVerificationScreen extends StatelessWidget {
  const emailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      EmailVerificationController(),
    ); // Controller instance

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          // App title
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

          emailVerificationGuide,
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email or Phone Number',
                  style: TextStyle(color: Color(0xFFB0B0B0)),
                ),
                const SizedBox(height: 6),
                costomFormField(
                  hintText: 'Enter your registered email or phone',
                  onChanged: (v) {},
                ),
                const SizedBox(height: 22),

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
                      onPressed: controller.goToOtpScreen,
                      child: controller.isLoading.value
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF141414),
                              ),
                            )
                          : Icon(
                              Icons.navigate_next_outlined,
                              color: controller.onClick.value ? Colors.white : const Color(0xFF212121),
                              size: 18,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
