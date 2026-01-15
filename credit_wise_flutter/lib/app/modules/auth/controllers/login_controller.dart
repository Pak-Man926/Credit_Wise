import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import "package:logger/logger.dart";
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // Example state management using Rx (Reactive variables)
  //var isLoggedIn = false.obs;
  late final Client client;
  var logger = Logger();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    client = Client("http://localhost:8080/")
      ..connectivityMonitor = FlutterConnectivityMonitor();
    // Load stored login data if available
  }

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();

    logger.i("Preparing to log in user...");

    final phoneText = phoneNumberController.text.trim();
    final passwordText = passwordController.text.trim();

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
      final result = await client.auth.loginUser(
        phoneNumber,
        passwordText,
      );

      logger.d("Login result: $result");

      //debugPrint("Login details: $phoneNumber, \n $passwordText");

      if (result == true) {
        Get.snackbar("Login Successful", "Welcome back!");

        await prefs.setInt("phoneNumber", phoneNumber);

        Get.offAllNamed(Routes.HOME_VIEW);

        logger.d("User logged in successfully.");
      } else {
        Get.snackbar("Error", "Invalid Credentials");

        logger.d("Login failed: Invalid credentials.");
      }
    } catch (e) {
      logger.e("Login error", error: "$e");
      Get.snackbar("Error", "An error occurred during login");
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
