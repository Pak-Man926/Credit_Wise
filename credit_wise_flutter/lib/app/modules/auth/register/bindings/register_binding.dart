import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../controllers/register_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(),
      fenix: true,
    );
    Get.lazyPut<LoginController>(() => LoginController(), fenix: false);
  }
}
