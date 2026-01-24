import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart'
    show FlutterConnectivityMonitor;
import '../../../../routes/app_routes.dart';

class RegistrationController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;
  var logger = Logger();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final selectedGender = Rx<String?>(null);

  final List<String> genderOptions = ['Male', 'Female'];

  @override
  void onInit() {
    super.onInit();

    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();

    logger.d("Registration Controller Initialized");
  }

  @override
  void onReady() {
    super.onReady();
    logger.d("Registration UI is now visible to the user");
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void updateGender(String? value) {
    selectedGender.value = value;
  }

  Future<void> registerUser() async {
    logger.d("Trying to registering User.....");

    logger.i(
      "First name: '${firstNameController.text}' \n Last name: '${lastNameController.text}' \n Email: '${emailController.text}' \n Phone: '${phoneNumberController.text}' \n Password: '${passwordController.text}' \n Confirm: '${confirmPasswordController.text}' \n Gender raw: '${selectedGender.value}'",
    );

    final phoneText = phoneNumberController.text.trim();

    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneText.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        selectedGender.value == null) {
      Get.snackbar("Error", "Please fill in all fields");

      logger.w("Registration failed: Missing required fields.");

      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");

      logger.w("Registration failed: Passwords do not match.");
      return;
    }

    final phoneNumber = int.tryParse(phoneText);
    if (phoneNumber == null) {
      Get.snackbar("Error", "Invalid phone number");
      logger.w("Registration failed: Invalid phone number!");
      return;
    }

    logger.d("All validations passed. Proceeding with registration...");
    try {
      final success = await client.auth.registerUser(
        firstNameController.text.trim(),
        "",
        lastNameController.text.trim(),
        emailController.text.trim(),
        phoneNumber,
        selectedGender.value!,
        passwordController.text,
      );

      if (success) {
        Get.snackbar("Success", "Account created successfully");
        logger.d("User registered successfully.");
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar("Error", "User already exists");
      }
    } catch (e) {
      logger.e("Registration error:", error: "$e");

      Get.snackbar("Error", "Registration failed");
    }
  }
}
