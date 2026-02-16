import 'package:get/get.dart';

import '../controllers/loan_preference_controller.dart';

class LoanPreferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoanPreferenceController>(
      () => LoanPreferenceController(),
    );
  }
}
