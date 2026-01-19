import 'package:get/get.dart';

class LoanPreferenceController extends GetxController {
  var repaymentHistory = "".obs;
  var employmentLevel = "".obs;

  final paymentHistoryItems = [
    "Yes, I have always repaid on time",
    "Yes, but missed a payment before",
    "No, I've never borrowed before",
    "Not sure",
  ];

  final employmentStatusItems = [
    "Full time employed",
    "Contract/ Casual",
    "Self-mployed/ Business",
    "Freelance/ Gig worker",
    "Student",
    "Unemployed",
  ];

  void setPaymentHistory(String? value) {
    repaymentHistory.value = value ?? "";
  }

  void setEmploymentLevel(String? value) {
    employmentLevel.value = value ?? "";
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
