import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import "package:logger/logger.dart";

class AccountController extends GetxController {
  var logger = Logger();

  Future<void> logout() async {
    // loggedInUser.value = null;
    // await StorageService.clearLoginData();

    Get.snackbar("Thank you!", "GoodBye!", snackPosition: SnackPosition.BOTTOM);

    logger.i("Logging out user...");

    Get.offAllNamed(Routes.LOGIN);
  }
}
