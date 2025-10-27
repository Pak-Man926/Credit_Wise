import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // Logic for handling user input, validation, and API calls for sign-up
  var selectedGender = Rx<String?>(null);

  void updateGender(String? newGender) {
    selectedGender.value = newGender;
  }

  void registerUser() {
    // Implement registration logic
    Get.log('Attempting to register new user...');
  }
}
