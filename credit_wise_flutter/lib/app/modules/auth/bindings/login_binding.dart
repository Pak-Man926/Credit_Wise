import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../register/controllers/register_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(), fenix: true
    );
    Get.lazyPut<RegistrationController>(() => RegistrationController(), fenix: false);
  }
}
