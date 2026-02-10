import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import "package:logger/logger.dart";

class AccountController extends GetxController {
  var logger = Logger();
  late final Client client;

  var userProfile = Rxn<Users>();

  @override
  void onInit() {
    client = Get.find<Client>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final profile = await client.profile.getAppUser();
      if (profile != null) {
        userProfile.value = profile;
        logger.d("Account: user profile loaded: ${profile.firstName}, gender: ${profile.gender}");
      }
    } catch (e) {
      logger.e("Error fetching user profile: $e");
    }
  }

  Future<void> logout() async {
    Get.snackbar("Thank you!", "GoodBye!", snackPosition: SnackPosition.BOTTOM);
    logger.i("Logging out user...");
    Get.offAllNamed(Routes.LOGIN);
  }
}
