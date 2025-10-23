import 'package:credit_wise_flutter/app/data/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            InputFieldWidget(hintText: "Enter your first name:"),
            InputFieldWidget(hintText: "Enter your Last name:"),
            InputFieldWidget(hintText: "Enter your  email address:"),
            InputFieldWidget(hintText: "Enter your phone number:"),
            InputFieldWidget(
              hintText: "Enter your password:",
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
