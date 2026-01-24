import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import "package:logger/logger.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';

class LoginController extends GetxController {
  late final Client client;
  late final SessionManager sessionManager;
  var logger = Logger();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    client = Get.find<Client>();
    sessionManager = Get.find<SessionManager>();
    logger.d("Login Controller Initialized");
  }

  @override
  void onReady() {
    super.onReady();
    logger.d("Login UI is now visible to the user");
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();

    logger.i("Preparing to log in user...");

    final phoneText = phoneNumberController.text.trim();
    final passwordText = passwordController.text;

    if (phoneText.isEmpty || passwordText.isEmpty) {
      Get.snackbar("Error", "Please fill in all the fields!");
      logger.w("Login failed: Missing phone number or password.");
      return;
    }

    final phoneNumber = int.tryParse(phoneText);
    if (phoneNumber == null) {
      Get.snackbar("Error", "Invalid phone number");
      logger.w("Login failed: Phone number is not a valid integer.");
      return;
    }

    logger.d("Logging in User....");

    logger.i("Phone: $phoneText \n Password: $passwordText");

     try {
      // Call your AuthEndpoint.loginUser, which returns AuthenticationResponse
      final AuthenticationResponse response =
          await client.auth.loginUser(phoneNumber, passwordText);

      if (response.success) {
        // Register signed-in user in SessionManager
        await sessionManager.registerSignedInUser(
          response.userInfo!,
          response.keyId!,
          response.key!,
        ); 

        Get.snackbar("Success", "Logged in successfully");
        Get.offAllNamed(Routes.HOME_VIEW); // or wherever
      } else {
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      logger.e("Login error:", error: "$e");
      Get.snackbar("Error", "Login failed");
    }
  }

  Future<void> logout() async {
    // loggedInUser.value = null;
    // await StorageService.clearLoginData();

    Get.snackbar("Thank you!", "GoodBye!", snackPosition: SnackPosition.BOTTOM);

    logger.i("Logging out user...");

    Get.offAllNamed(Routes.LOGIN);
  }
}
