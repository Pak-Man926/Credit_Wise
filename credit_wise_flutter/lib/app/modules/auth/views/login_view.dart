import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // Use Obx to listen to controller state if needed
            Obx(() => Text('Status: ${controller.isLoggedIn.value ? "Logged In" : "Logged Out"}')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.login(); // Update state in controller
                Get.offAllNamed(Routes.HOME); // Navigate to Home
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
