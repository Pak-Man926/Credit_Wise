import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class AccountController extends GetxController {
  var userEmail = 'david@example.com'.obs;

  void logout() {
    // 1. Perform backend logout
    Get.log('Logging out user...');
    
    // 2. Clear local storage (auth tokens, etc.)
    
    // 3. Navigate back to the login page (and clear history)
    Get.offAllNamed(Routes.LOGIN);
  }
}
