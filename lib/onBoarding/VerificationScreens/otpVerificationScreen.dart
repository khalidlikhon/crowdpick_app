import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/authGuide.dart';
import '../controllers/verificationController.dart';
import 'setNewPassword.dart';

class otpVerificationScreen extends StatelessWidget {
  const otpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller instance
    final controller = Get.put(OtpVerificationController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'pick',
                style: TextStyle(
                    color: Color(0xFF95E143),
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // OTP guide text
          OTPverificationGuide,
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // OTP Field (unchanged)
                const appOtpField(),
                const SizedBox(height: 22),

                // Reactive button using GetX
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
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: controller.goToSetNewPassword,
                      child: Icon(
                        Icons.navigate_next_outlined,
                        color: controller.onClick.value
                            ? Colors.black
                            : Colors.white,
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

// OTP Field Widget (unchanged)
class appOtpField extends StatelessWidget {
  const appOtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          width: 45,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF95E143), width: 1.2),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 5) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        );
      }),
    );
  }
}
