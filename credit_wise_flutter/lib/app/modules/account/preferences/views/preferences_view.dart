import 'package:credit_wise_flutter/app/data/widgets/preferences_widget.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../routes/app_routes.dart';
import '../controllers/preferences_controller.dart';

class PreferencesView extends GetView<PreferencesController> {
  const PreferencesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences', style: AppTextStyles.headingL),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Choose a category to manage your preferences",
                style: AppTextStyles.bodyM),
            mediumSpaceSize,
            PreferencesWidget(
              title: "Credit Preferences",
              details:
                  "Set notification thresholds for credit score and configure monitoring allers.",
              leadingIcon: PhosphorIcons.cardholder(),
              trailingicon: Icons.arrow_forward_ios_outlined,
              onTap: () => Get.toNamed(Routes.CREDIT_PREFERENCE),
            ),
            largeSpaceSize,
            PreferencesWidget(
              title: "Loan Preferences",
              details:
                  "Customize your preferred loan terms, interest rate targets and notification settings for new offers.",
              leadingIcon: PhosphorIcons.money(),
              trailingicon: Icons.arrow_forward_ios_outlined,
              onTap: () => Get.toNamed(Routes.LOAN_PREFERENCE),
            ),
          ],
        ),
      ),
    );
  }
}
