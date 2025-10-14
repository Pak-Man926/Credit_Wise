import "package:flutter/material.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";
import "package:get/get.dart";
import "../controllers/onboarding_controller.dart";
import "package:credit_wise_flutter/app/routes/app_routes.dart";

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome! First Time User.', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example of setting the flag and navigating
                controller.markOnboardingComplete();
                Get.offAllNamed(Routes.LOGIN); 
              },
              child: const Text('Proceed to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
