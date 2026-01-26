import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class LoanPreferenceController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;

  var logger = Logger();

  // Variables for user selections
  var loanAmount = 0.obs;
  var loanTerm = 0.obs;
  var repaymentHistory = "".obs;
  var employmentLevel = "".obs;

  // Dropdown items
  final paymentHistoryItems = [
    "Yes, I have always repaid on time",
    "Yes, but missed a payment before",
    "No, I've never borrowed before",
    "Not sure",
  ];

  final employmentStatusItems = [
    "Full time employed",
    "Contract/ Casual",
    "Self-employed/ Business",
    "Freelance/ Gig worker",
    "Student",
    "Unemployed",
  ];

  @override
  void onInit() {
    super.onInit();

    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();
    logger.i("Loan Preference Controller Initialized");
  }

  @override
  void onReady() {
    super.onReady();
    logger.i("Loan Preference UI is now visible to the user");
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Methods to set values
  void setLoanAmount(int value) {
    loanAmount.value = value;
  }

  void setLoanTerm(int value) {
    loanTerm.value = value;
  }

  void setPaymentHistory(String? value) {
    repaymentHistory.value = value ?? "";
  }

  void setEmploymentLevel(String? value) {
    employmentLevel.value = value ?? "";
  }

  // Backend submission method
  Future<void> submitLoanPreferences() async {
    logger.i("Submitting Loan Preferences...");

    // Map payment history to Credit_History
    double creditHistory = 0;
    switch (repaymentHistory.value) {
      case "Yes, I have always repaid on time":
        creditHistory = 1;
        break;
      case "Yes, but missed a payment before":
        creditHistory = 0.5;
        break;
      case "No, I've never borrowed before":
        creditHistory = 0;
        break;
      case "Not sure":
        creditHistory = 0.5; // Default for "Not sure"
        break;
      default:
        creditHistory = 0;
    }

    // Map employment level to Self_Employed
    bool isSelfEmployed = false;
    if (employmentLevel.value == "Self-employed/ Business" ||
        employmentLevel.value == "Freelance/ Gig worker") {
      isSelfEmployed = true;
    }

    // Prepare the payload for backend submission
    var payload = {
      "loanAmount": loanAmount.value,
      "loanTerm": loanTerm.value,
      "creditHistory": creditHistory,
      "selfEmployed": isSelfEmployed,
    };

    logger.d("Payload ready for submission: $payload");

    // Placeholder for the API submission, replace with actual API call
    try {
      await client.loan.createLoanPreference(
        double.parse(loanAmount.value.toString()),
        loanTerm.value,
        creditHistory,
        isSelfEmployed ? "Self-employed" : "Employed",
      );

      logger.d("Loan preferences submitted successfully");
      Get.snackbar("Success", "Loan preferences submitted successfully");
    } catch (e) {
      logger.e("Error submitting loan preferences: $e");
      Get.snackbar("Error", "Failed to register loan preferences");
    }
  }
}
