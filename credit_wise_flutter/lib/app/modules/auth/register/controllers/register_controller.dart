import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // Logic for handling user input, validation, and API calls for sign-up

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

  void registerUser() {
    // Implement registration logic
    Get.log('Attempting to register new user...');
  }
}
