import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    // Initializes the OnboardingController when the page is loaded
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
  }
}
