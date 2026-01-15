import 'package:get/get.dart';

import '../controllers/preferences_controller.dart';

class PreferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferencesController>(
      () => PreferencesController(),
    );
  }
}
