import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import '../../../../routes/app_routes.dart';

class RegistrationController extends GetxController {
  // Logic for handling user input, validation, and API calls for sign-up
  late final Client client;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var selectedGender = Rx<String?>(null);

  List<String> genderOptions = ['Male', 'Female'];

  void updateGender(String? newGender) {
    selectedGender.value = newGender;
  }

  Gender? get genderEnum {
    if (selectedGender.value == 'Male') return Gender.MALE;
    if (selectedGender.value == 'Female') return Gender.FEMALE;
    return null;
  }

  @override
  void onInit() {
    super.onInit();

    client = Client("http://$localhost:8080/")
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }

  Future<void> registerUser() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        passwordController.text.isEmpty ||
        genderEnum == null) {
      Get.snackbar("Error", "Fill all fields");
      return;
    }

    try {
      final result = await client.auth.registerUser(
        firstNameController.text,
        "", // secondName (optional — pass empty if unused)
        lastNameController.text,
        emailController.text,
        int.parse(phoneNumberController.text),
        genderEnum!,
        passwordController.text,
      );

      if (result) {
        Get.snackbar("Success", "User registered");

        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar("Error", "User already exists");
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error", "Registration failed");
    }
  }
}
