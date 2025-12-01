import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/input_field_widget.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import '../controllers/register_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InputFieldWidget(
                hintText: "Enter your first name:",
                controller: controller.firstNameController,
              ),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "Enter your Last name:",
                controller: controller.lastNameController,
              ),
              smallSpaceSize,
              InputFieldWidget(
                  hintText: "Enter your  email address:",
                  controller: controller.emailController),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "Enter your phone number:",
                controller: controller.phoneNumberController,
              ),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "Enter your password:",
                obscureText: true,
                controller: controller.passwordController,
              ),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "Confirm your password:",
                obscureText: true,
                controller: controller.confirmPasswordController,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: DropdownButtonFormField(
                          style: AppTextStyles.body,
                          items: controller.genderOptions.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.updateGender(newValue);
                          },
                          hint: Text(
                            "Select your gender",
                            style: AppTextStyles.inputPlaceholder,
                          ),
                          dropdownColor: AppColors.inputBackground,
                          iconEnabledColor: AppColors.accent,
                          decoration: InputDecoration(
                            //hintText: hintText,
                            //hintStyle: ,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.all(16),
                          ))),
                ),
              ),
              smallSpaceSize,
              CustomButton.primary(
                text: "Register",
                onPressed: () {
                  controller.registerUser();
                },
              ),
              smallSpaceSize,
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    "Already have an account? Sign in",
                    style: AppTextStyles.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
