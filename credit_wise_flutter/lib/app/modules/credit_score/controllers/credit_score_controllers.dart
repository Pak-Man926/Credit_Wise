import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class CreditScoreController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;

  var isLoading = false.obs;
  var riskProbability = 0.0.obs;
  var simulatedScore = 0.obs;
  var scoreBand = "".obs;
  var isError = false.obs;
  var logger = Logger();
  var userProfile = Rxn<Users>();

  @override
  void onInit() {
    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();
    logger.i("Credit Score Controller is being initialized....");
    super.onInit();
  }

  @override
  void onReady() {
    logger.i("Credit Score UI has now loaded....");
    fetchUserProfile();
    fetchCreditScore();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchUserProfile() async {
    try {
      final profile = await client.profile.getAppUser();
      if (profile != null) {
        userProfile.value = profile;
        logger.d("User profile loaded: ${profile.firstName} ${profile.lastName}, gender: ${profile.gender}");
      }
    } catch (e) {
      logger.e("Error fetching user profile: $e");
    }
  }

  Future<void> fetchCreditScore() async {
    isLoading.value = true;
    isError.value = false; // Reset error state

    try {
      var result = await client.prediction.getCreditScore();
      if (result != null) {
        simulatedScore.value = result.simulatedScore;
        riskProbability.value = result.riskProbability;
        scoreBand.value = result.scoreBand;

        logger.d("Results: $result");
      } else {
        isError.value = true;
      }
    } catch (e) {
      Get.snackbar("Error", "Could not reach the analysis server");
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
