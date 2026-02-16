import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This controller contains the logic to handle the onboarding state
class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  // Method to set the flag that onboarding is complete
  void markOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time', false);
    Get.snackbar('Success', 'Onboarding completed!');
  }
}
