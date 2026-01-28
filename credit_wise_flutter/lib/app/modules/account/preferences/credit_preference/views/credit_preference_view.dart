import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/drop_down_widget.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/credit_preference_controller.dart';

class CreditPreferenceView extends GetView<CreditPreferenceController> {
  const CreditPreferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Preferences', style: AppTextStyles.headingL),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const Text(
              "If you use credit(credit card/overdraft), how much do you typically use?)",
              style: AppTextStyles.body,
            ),
            smallSpaceSize,
            Obx(
              () => DropDownWidget(
                hintText: "Select usage",
                items: controller.usageItems,
                value: controller.selectedUsage.value,
                onChanged: (val) => controller.setUsage(val),
              ),
            ),
            mediumSpaceSize,
            const Text(
              "In the 2 years, how often have you been late on loan repayments?",
              style: AppTextStyles.body,
            ),
            smallSpaceSize,
            Obx(
              () => DropDownWidget(
                hintText: "Select frequency",
                items: controller.lateRepaymentItems,
                value: controller.selectedLateRepayments.value,
                onChanged: (val) => controller.setLateRepayments(val),
              ),
            ),
            mediumSpaceSize,
            const Text(
              "How many active loans or credit accounts do you have?",
              style: AppTextStyles.body,
            ),
            smallSpaceSize,
            Obx(
              () => DropDownWidget(
                hintText: "Select number of accounts",
                items: controller.activeLoansItems,
                value: controller.selectedActiveLoans.value,
                onChanged: (val) => controller.setActiveLoans(val),
              ),
            ),
            largeSpaceSize,
            CustomButton.primary(
              text: "Submit",
              onPressed: () => controller.submitCreditPreferences(),
            ),
          ],
        ),
      ),
    );
  }
}
