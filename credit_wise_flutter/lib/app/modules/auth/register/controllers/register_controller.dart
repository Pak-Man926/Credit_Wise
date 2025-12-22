import 'package:credit_wise_client/credit_wise_client.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart'
    show FlutterConnectivityMonitor;
import '../../../../routes/app_routes.dart';

class RegistrationController extends GetxController {
  late final Client client;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final selectedGender = Rx<String?>(null);

  final List<String> genderOptions = ['Male', 'Female'];

  void updateGender(String? value) {
    selectedGender.value = value;
  }

  Gender? get genderEnum {
    switch (selectedGender.value) {
      case 'Male':
        return Gender.MALE;
      case 'Female':
        return Gender.FEMALE;
      default:
        return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    client = Client("http://10.0.2.2:8080/")
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }

  Future<void> registerUser() async {
    debugPrint("Trying to registering User.....");

    debugPrint("First name: '${firstNameController.text}'");
    debugPrint("Last name: '${lastNameController.text}'");
    debugPrint("Email: '${emailController.text}'");
    debugPrint("Phone: '${phoneNumberController.text}'");
    debugPrint("Password: '${passwordController.text}'");
    debugPrint("Confirm: '${confirmPasswordController.text}'");
    debugPrint("Gender raw: '${selectedGender.value}'");
    debugPrint("Gender enum: $genderEnum");

    final phoneText = phoneNumberController.text.trim();

    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneText.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        genderEnum == null) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    final phoneNumber = int.tryParse(phoneText);
    if (phoneNumber == null) {
      Get.snackbar("Error", "Invalid phone number");
      return;
    }

    try {
      final success = await client.auth.registerUser(
        firstNameController.text.trim(),
        "",
        lastNameController.text.trim(),
        emailController.text.trim(),
        phoneNumber,
        genderEnum!,
        passwordController.text,
      );

      if (success) {
        Get.snackbar("Success", "Account created successfully");
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar("Error", "User already exists");
      }
    } catch (e) {
      debugPrint("Registration error: $e");
      Get.snackbar("Error", "Registration failed");
    }
  }
}
