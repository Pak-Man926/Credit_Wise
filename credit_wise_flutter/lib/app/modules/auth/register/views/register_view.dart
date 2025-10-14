import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New User Registration')),
      body: const Center(
        child: Text('Registration Form goes here!'),
      ),
    );
  }
}
