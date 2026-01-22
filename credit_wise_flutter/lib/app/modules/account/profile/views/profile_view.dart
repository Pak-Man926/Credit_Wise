import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/input_field_widget.dart';
import 'package:credit_wise_flutter/app/theme/app_colors.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Finances', style: AppTextStyles.headingL),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Age", style: AppTextStyles.body),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "Enter your age",
                controller: controller.ageController,
              ),
              smallSpaceSize,
              const Text("Number of Dependants", style: AppTextStyles.body),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "E.g 2",
                controller: controller.dependantsController,
              ),
              smallSpaceSize,
              const Text("Monthly Income", style: AppTextStyles.body),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "E.g 30000",
                controller: controller.incomeController,
              ),
              smallSpaceSize,
              const Text(
                "How much do you pay per month for existing loans/credit? \n (Includes loan repayments, credit cards, overdrafts)",
                style: AppTextStyles.body,
              ),
              smallSpaceSize,
              InputFieldWidget(
                hintText: "If none, enter 0.",
                controller: controller.debtRepaymentsController,
              ),
              smallSpaceSize,
              const Text(
                "Do you have a second income contributor(e.g Spouse)?",
                style: AppTextStyles.body,
              ),
              smallSpaceSize,
              Row(
                children: [
                  // --- YES OPTION ---
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Obx(
                        () => RadioListTile<String>(
                          title: const Text("Yes", style: AppTextStyles.body),
                          value: "Yes", // Unique value for this tile
                          groupValue:
                              controller.selection.value, // Current state
                          onChanged: (value) =>
                              controller.selectedOption(value),
                          activeColor: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // --- NO OPTION ---
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Obx(
                        () => RadioListTile<String>(
                          title: const Text("No", style: AppTextStyles.body),
                          value: "No", // Unique value for this tile
                          groupValue:
                              controller.selection.value, // Current state
                          onChanged: (value) =>
                              controller.selectedOption(value),
                          activeColor: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              smallSpaceSize,
              Obx(
                () => controller.selection.value == "Yes"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InputFieldWidget(
                          hintText:
                              "Kindly input your contributor's income e.g 30,000",
                          controller: controller.contributorsIncomeController,
                        ), // This appears only if "Yes" is picked
                      )
                    : const SizedBox.shrink(), // Returns nothing if "No" or empty
              ),
              mediumSpaceSize,
              CustomButton.primary(
                text: "Submit",
                onPressed: () => controller.registerProfileData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
