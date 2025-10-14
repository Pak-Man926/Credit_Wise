import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account & Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('User Email: ${controller.userEmail.value}')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.logout,
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
