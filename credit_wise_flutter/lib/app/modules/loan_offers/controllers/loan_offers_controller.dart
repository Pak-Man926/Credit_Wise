import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class LoanOffersController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;
  var logger = Logger();

  var approvalProbability = 0.0.obs;
  var approvalBand = "".obs;
  var isLoading = false.obs;
  var isError = false.obs;
  var message = "".obs; // Error/Info message

  /// Approval probability as a percentage (0–100)
  double get displayProbability => approvalProbability.value * 100;

  /// Whether the loan is considered approved (>= 50% probability)
  bool get isApproved => approvalProbability.value >= 0.5;

  @override
  void onInit() {
    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();
    logger.i("Loan Offer controller initialized");
    super.onInit();
  }

  @override
  void onReady() {
    logger.i("Loan Offers UI is now visible");
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchLoanOffers() async {
    isLoading.value = true;
    isError.value = false;

    try {
      var result = await client.loanPrediction.getLoanPrediction();
      if (result != null) {
        approvalProbability.value = result.approvalProbability;
        approvalBand.value = result.approvalBand;
        logger.d("Results: $result");

        // Display appropriate message based on the approval band
        if (approvalBand.value == "Very unlikely") {
          message.value = "Your loan approval chances are very unlikely.";
        } else {
          message.value = "Here are your personalized loan offers.";
        }
      } else {
        isError.value = true;
        message.value =
            "No data received. Please ensure your profile and loan preferences are filled in.";
      }
    } catch (e) {
      logger.e("Could not reach the server: $e");
      isError.value = true;
      message.value = "Could not reach the server, please try again.";
    } finally {
      isLoading.value = false;
    }
  }
}
