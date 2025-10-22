import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/input_field_widget.dart';
import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:credit_wise_flutter/app/theme/app_colors.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          'Welcome Back',
          style: AppTextStyles.headingXL,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputFieldWidget(hintText: "Email or username"),
            smallSpaceSize,
            InputFieldWidget(obscureText: true, hintText: "Password"),
            smallSpaceSize,
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: AppTextStyles.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.accent),
                ),
              ),
            ),
            mediumSpaceSize,
            CustomButton.primary(
              text: "Login",
              onPressed: () {},
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTRATION);
                  },
                  child: Text(
                    "Don\'t have an account? Sign Up",
                    style: AppTextStyles.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
