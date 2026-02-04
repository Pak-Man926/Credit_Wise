import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ProfileController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;

  var logger = Logger();

  var selection = "".obs;

  final ageController = TextEditingController();
  final dependantsController = TextEditingController();
  final incomeController = TextEditingController();
  final debtRepaymentsController = TextEditingController();
  final contributorsIncomeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();

    logger.d("Profile Controller Initialized");
  }

  @override
  void onReady() {
    super.onReady();

    logger.d("Profile UI is now visible to the user");
  }

  @override
  void onClose() {
    ageController.dispose();
    dependantsController.dispose();
    incomeController.dispose();
    debtRepaymentsController.dispose();
    contributorsIncomeController.dispose();
    super.onClose();
  }

  void selectedOption(String? value) {
    selection.value = value ?? "";
  }

  Future<void> registerProfileData() async {
    logger.d("Registering Profile Data...");

    logger.i(
      "Age: '${ageController.text}' \n No. of Dependants: '${dependantsController.text}' \n Monthly Income: '${incomeController.text}' \n Debt Repayments: '${debtRepaymentsController.text}' \n Contributors Income: '${contributorsIncomeController.text}'",
    );

    //final debtRatio = (debtRepaymentsController.text) / (incomeController.text);

    if (ageController.text.isEmpty ||
        dependantsController.text.isEmpty ||
        incomeController.text.isEmpty ||
        debtRepaymentsController.text.isEmpty ||
        (selection.value == "Yes" &&
            contributorsIncomeController.text.isEmpty)) {
      Get.snackbar("Error", "Please fill in all fields");

      logger.w("Profile Data is Incomplete");

      return;
    } else {
      logger.d("All Profile Data fields are filled. Proceeding...");
      try {
        await client.profile.createProfileData(
          int.parse(ageController.text.trim()),
          int.parse(dependantsController.text.trim()),
          double.parse(incomeController.text.trim()),
          double.parse(debtRepaymentsController.text.trim()) /
              double.parse(incomeController.text.trim()),
          selection.value == "Yes"
              ? double.parse(contributorsIncomeController.text.trim())
              : 0.0,
        );

        logger.i("Profile Data Registered Successfully");

        Get.snackbar("Success", "Profile Data Registered Successfully");

        Future.delayed(Duration(seconds: 5), () {
          Get.back();
        });
      } catch (e) {
        logger.e("Error registering profile data: $e");
        Get.snackbar("Error", "Failed to register profile data");
      }
    }
  }
}
