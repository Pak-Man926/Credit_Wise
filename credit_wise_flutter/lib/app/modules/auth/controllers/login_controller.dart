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
    client = Client("http://$localhost:8080/")
      ..connectivityMonitor = FlutterConnectivityMonitor();
    // Load stored login data if available
  }

  Future<void> loginUser({
    required int phoneNumber,
    required String password,
    //bool autoLogin = false,
  }) async {
    // Set loading state to true
    //isLoading.value = true;
    //Checks if all fields are filled
    if (password.isEmpty || phoneNumber.toString().isEmpty) 
    {
      // Show error message if any field is empty
      Get.snackbar(
        "Error",
        "Please fill in all the fields!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final result = await client.auth.loginUser(
        phoneNumber,
        password,
      );

      if (result == true) {
        //Fetch user details from the server
        // final userDetails = await client.userEndpoints.getUserProfile(
        //   contactNumber,
        // );
        // loggedInUser.value = User(
        //   firstName: userDetails!.firstName,
        //   lastName: userDetails.lastName,
        //   contacts: contactNumber,
        //   email: userDetails.email,
        //   password: password,
        //   authlevel: authenticationLevel,
        //   country: country,
        // );
        // //Login Successful
        // await StorageService.saveLoginData(
        //   contacts: contactNumber,
        //   authLevel: authenticationLevel.toString(),
        //   country: country.toString(),
        //   password: password,
        // );

        Get.snackbar(
          "Login Successful",
           "Welcome back!",
          snackPosition: SnackPosition.BOTTOM,
        );

        //Redirect to the homepage
        Get.offAllNamed(Routes.HOME);
      } else {
        // Login failed

        Get.snackbar(
          "Error",
          "Invalid Credentials",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error during login: $e');

      Get.snackbar(
        "Error",
        "An error occurred during login",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> logout() async {
    // loggedInUser.value = null;
    // await StorageService.clearLoginData();

    Get.snackbar(
      "Thank you!",
      "GoodBye!",
      snackPosition: SnackPosition.BOTTOM);

    Get.offAllNamed(Routes.LOGIN);
  }

}
