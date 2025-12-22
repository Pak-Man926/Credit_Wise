import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class LoginController extends GetxController {
  // Example state management using Rx (Reactive variables)
  //var isLoggedIn = false.obs;
  late final Client client;

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    client = Client("http://10.0.2.2:8080/")
      ..connectivityMonitor = FlutterConnectivityMonitor();
    // Load stored login data if available
  }

  Future<void> loginUser() async {
    final phoneText = phoneNumberController.text.trim();
    final passwordText = passwordController.text.trim();

    if (phoneText.isEmpty || passwordText.isEmpty) {
      Get.snackbar("Error", "Please fill in all the fields!");
      return;
    }

    final phoneNumber = int.tryParse(phoneText);
    if (phoneNumber == null) {
      Get.snackbar("Error", "Invalid phone number");
      return;
    }

    debugPrint("Logging in User....");

    try {
      final result = await client.auth.loginUser(
        phoneNumber,
        passwordText,
      );

      debugPrint("Login result: $result");

      debugPrint("Login details: $phoneNumber, \n $passwordText");

      if (result == true) {
        Get.snackbar("Login Successful", "Welcome back!");
        Get.offAllNamed(Routes.HOME_VIEW);
      } else {
        Get.snackbar("Error", "Invalid Credentials");
      }
    } catch (e) {
      debugPrint("Login error: $e");
      Get.snackbar("Error", "An error occurred during login");
    }
  }

  Future<void> logout() async {
    // loggedInUser.value = null;
    // await StorageService.clearLoginData();

    Get.snackbar("Thank you!", "GoodBye!", snackPosition: SnackPosition.BOTTOM);

    Get.offAllNamed(Routes.LOGIN);
  }
}
