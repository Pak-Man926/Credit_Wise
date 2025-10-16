import 'package:credit_wise_flutter/app/data/widgets/textbox_widget.dart';
import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Welcome Back',
          style: AppTextStyles.headingXL,
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextBoxWidget(hintText: "Email or username"),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
