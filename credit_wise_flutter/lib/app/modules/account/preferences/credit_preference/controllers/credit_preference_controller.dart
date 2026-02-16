import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class CreditPreferenceController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;

  var logger = Logger();

  // Variables for user selections
  var selectedUsage = "".obs;
  var selectedLateRepayments = "".obs;
  var selectedActiveLoans = "".obs;

  final usageItems = [
    "I dont use credit",
    "Very little (0-20%)",
    "Some (20-40%)",
    "About half (40-60%)",
    "Most (60-80%)",
    "Almost all (80-100%)",
    "Not sure",
  ];

  final lateRepaymentItems = [
    "Never",
    "1-2 times",
    "3-5 times",
    "More than 5 times",
    "Not sure",
  ];

  final activeLoansItems = ["None", "1", "2-3", "4-5", "6+"];

  @override
  void onInit() {
    super.onInit();

    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();

    logger.d("Credit Preference Controller Initialized");
  }

  @override
  void onReady() {
    super.onReady();
    logger.d("Credit Preference UI is now visible to the user");
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Methods to set values
  void setUsage(String? value) {
    selectedUsage.value = value ?? "";
  }

  void setLateRepayments(String? value) {
    selectedLateRepayments.value = value ?? "";
  }

  void setActiveLoans(String? value) {
    selectedActiveLoans.value = value ?? "";
  }

  // Backend submission method
  Future<void> submitCreditPreferences() async {
    logger.i("Submitting Credit Preferences...");

    // Map credit usage to RevolvingUtilizationOfUnsecuredLines
    double creditUsage = 0;
    switch (selectedUsage.value) {
      case "I dont use credit":
        creditUsage = 0.05;
        break;
      case "Very little (0-20%)":
        creditUsage = 0.10;
        break;
      case "Some (20-40%)":
        creditUsage = 0.30;
        break;
      case "About half (40-60%)":
        creditUsage = 0.50;
        break;
      case "Most (60-80%)":
        creditUsage = 0.70;
        break;
      case "Almost all (80-100%)":
        creditUsage = 0.90;
        break;
      case "Not sure":
        creditUsage = 0.50; // Default value for uncertainty
        break;
      default:
        creditUsage = 0;
    }

    // Map late repayments to time late variables
    int times30_59 = 0;
    int times60_89 = 0;
    int times90 = 0;

    switch (selectedLateRepayments.value) {
      case "Never":
        times30_59 = 0;
        times60_89 = 0;
        times90 = 0;
        break;
      case "1-2 times":
        times30_59 = 1;
        break;
      case "3-5 times":
        times30_59 = 2;
        times60_89 = 1;
        break;
      case "More than 5 times":
        times30_59 = 3;
        times60_89 = 2;
        times90 = 1;
        break;
      case "Not sure":
        times30_59 = 0;
        times60_89 = 0;
        times90 = 0;
        break;
      default:
        times30_59 = 0;
        times60_89 = 0;
        times90 = 0;
    }

    // Map active loans to NumberOfOpenCreditLinesAndLoans
    int activeLoans = 0;
    switch (selectedActiveLoans.value) {
      case "None":
        activeLoans = 0;
        break;
      case "1":
        activeLoans = 1;
        break;
      case "2-3":
        activeLoans = 3;
        break;
      case "4-5":
        activeLoans = 5;
        break;
      case "6+":
        activeLoans = 7;
        break;
      default:
        activeLoans = 0;
    }

    // Prepare the payload for backend submission
    var payload = {
      "creditUsage": creditUsage,
      "times30_59": times30_59,
      "times60_89": times60_89,
      "times90": times90,
      "activeLoans": activeLoans,
    };

    logger.i("Payload ready for submission: $payload");

    // Placeholder for the API submission, replace with actual API call
    try {
      await client.credit.createCreditPreference(
        creditUsage,
        times30_59,
        times60_89,
        times90,
        activeLoans,
      );
      logger.d("Credit preferences submitted successfully");
      Get.snackbar("Success", "Credit Preferences submitted successfully");

      Future.delayed(Duration(seconds: 4), () {
        logger.i("Navigating back after successful submission");
        Get.back();
      });
    } catch (e) {
      logger.e("Error submitting credit preferences: $e");
      Get.snackbar("Error", "Failed to register loan prefrences");
    }
  }
}
