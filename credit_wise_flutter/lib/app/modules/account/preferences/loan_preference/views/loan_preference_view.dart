import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/drop_down_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/input_field_widget.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loan_preference_controller.dart';

class LoanPreferenceView extends GetView<LoanPreferenceController> {
  const LoanPreferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Preferences', style: AppTextStyles.headingL),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const Text(
              "Pleae answer a few questions to help us tailor loan offers for you.",
              style: AppTextStyles.bodyM,
            ),
            largeSpaceSize,
            const Text(
              "How much is your preferred loan amount?",
              style: AppTextStyles.body,
            ),
            smallSpaceSize,
            InputFieldWidget(hintText: "e.g 30,000"),
            mediumSpaceSize,
            const Text(
              "How long do you intend to take to repay the loan?",
              style: AppTextStyles.body,
            ),
            smallSpaceSize,
            InputFieldWidget(hintText: "e.g 12 months"),
            smallSpaceSize,
            const Text(
              "Have you borrowed before and repaid successfully?",
              style: AppTextStyles.body,
            ),
            mediumSpaceSize,
            Obx(
              () => DropDownWidget(
                hintText: "Select payment history",
                items: controller.paymentHistoryItems,
                value: controller.repaymentHistory.value,
                onChanged: (value) => controller.setPaymentHistory(value),
              ),
            ),
            smallSpaceSize,
            const Text(
              "What best describes your work?",
              style: AppTextStyles.body,
            ),
            mediumSpaceSize,
            Obx(
              () => DropDownWidget(
                hintText: "Select employment status",
                items: controller.employmentStatusItems,
                value: controller.employmentLevel.value,
                onChanged: (value) => controller.setEmploymentLevel(value),
              ),
            ),
            largeSpaceSize,
            CustomButton.primary(text: "Submit", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
