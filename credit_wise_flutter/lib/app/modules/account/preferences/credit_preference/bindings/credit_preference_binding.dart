import 'package:get/get.dart';

import '../controllers/credit_preference_controller.dart';

class CreditPreferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditPreferenceController>(
      () => CreditPreferenceController(),
    );
  }
}
