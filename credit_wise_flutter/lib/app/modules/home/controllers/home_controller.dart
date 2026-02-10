import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class HomeController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;
  var logger = Logger();

  var userProfile = Rxn<Users>();

  @override
  void onInit()
  {
    super.onInit();
    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();
    logger.d("HomePage Controller Initialized");
    
  }

  @override
  void onReady()
  {
    super.onReady();  
    logger.d("HomePage UI is now visible to the user");
    fetchUserProfile();
  }

  @override
  void onClose()
  {    
    logger.d("HomePage Controller is being disposed");
    super.onClose();
  }

  Future<void> fetchUserProfile() async {
    try {
      logger.i("Fetching user profile data...");
      final profile = await client.profile.getAppUser();
      if (profile != null) {
        userProfile.value = profile;
        logger.d("User profile data fetched successfully: $profile");
      } else {
        logger.w("No profile data found for the user.");
      }
    } catch (e) {
      logger.e("Error fetching user profile data: $e");
    }
  }
}
