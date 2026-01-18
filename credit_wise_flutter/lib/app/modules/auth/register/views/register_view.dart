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
        title: const Text('Create Account', style: AppTextStyles.headingL),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InputFieldWidget(
                hintText: "Enter your first name",
                controller: controller.firstNameController,
              ),
              smallSpaceSize,

              InputFieldWidget(
                hintText: "Enter your last name",
                controller: controller.lastNameController,
              ),
              smallSpaceSize,

              InputFieldWidget(
                hintText: "Enter your email address",
                controller: controller.emailController,
              ),
              smallSpaceSize,

              InputFieldWidget(
                hintText: "Enter your phone number",
                //keyboardType: TextInputType.phone,
                controller: controller.phoneNumberController,
              ),
              smallSpaceSize,

              InputFieldWidget(
                hintText: "Enter your password",
                obscureText: true,
                controller: controller.passwordController,
              ),
              smallSpaceSize,

              InputFieldWidget(
                hintText: "Confirm your password",
                obscureText: true,
                controller: controller.confirmPasswordController,
              ),
              smallSpaceSize,

              /// Gender Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.selectedGender.value,
                      items: controller.genderOptions
                          .map(
                            (option) => DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ),
                          )
                          .toList(),
                      onChanged: controller.updateGender,
                      hint: Text(
                        "Select your gender",
                        style: AppTextStyles.inputPlaceholder,
                      ),
                      dropdownColor: AppColors.inputBackground,
                      iconEnabledColor: AppColors.accent,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ),
              ),

              smallSpaceSize,

              CustomButton.primary(
                text: "Register",
                onPressed: controller.registerUser,
              ),

              smallSpaceSize,

              TextButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text(
                  "Already have an account? Sign in",
                  style: AppTextStyles.bodySmall.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.accent,
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
