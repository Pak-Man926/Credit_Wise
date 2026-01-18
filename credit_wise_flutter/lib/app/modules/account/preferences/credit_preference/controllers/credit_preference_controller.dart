import 'package:get/get.dart';

class CreditPreferenceController extends GetxController {
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

  void setUsage(String? value) {
    selectedUsage.value = value ?? "";
  }

  void setLateRepayments(String? value) {
    selectedLateRepayments.value = value ?? "";
  }

  void setActiveLoans(String? value) {
    selectedActiveLoans.value = value ?? "";
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
