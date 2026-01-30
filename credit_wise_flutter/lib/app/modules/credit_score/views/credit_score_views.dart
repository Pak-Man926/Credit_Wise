import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/widgets/button_widget.dart';
import '../../../data/widgets/credit_score_gauge.dart';
import '../../../data/widgets/profile_image_widget.dart';
import '../../../theme/app_text_styles.dart';
import '../../../utils/constants.dart';
import '../controllers/credit_score_controllers.dart';

class CreditScoreView extends GetView<CreditScoreController> {
  const CreditScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Credit Score", style: AppTextStyles.headingXL),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.isError.value) {
            return _buildErrorScreen();
          } else {
            return _buildSuccessScreen();
          }
        }),
      ),
    );
  }

  // Success Screen
  Widget _buildSuccessScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              ProfileImageWidget(profilePic: "assets/male_account_user.png"),
              smallSpaceSize,
              const Text("David Mwaura", style: AppTextStyles.headingL),
              smallSpaceSize,
              Obx(
                () => Text(
                  "Credit Score: ${controller.simulatedScore}",
                  style: AppTextStyles.captionXL,
                ),
              ),
            ],
          ),
        ),
        largeSpaceSize,
        const Text("Credit Score:", style: AppTextStyles.headingM),
        smallSpaceSize,
        Obx(
          () => Text(
            "${controller.simulatedScore.value}",
            style: AppTextStyles.headingXL,
          ),
        ),
        largeSpaceSize,
        Obx(
          () => CreditScoreGauge(
            score: controller.simulatedScore.value.toDouble(),
            scoreBand: controller.scoreBand.value,
            riskProbability: controller.riskProbability.value,
          ),
        ),
        largeSpaceSize,
        CustomButton.primary(
          text: "Fetch Again",
          onPressed: () => controller.fetchCreditScore(),
        ),
      ],
    );
  }

  // Error Screen
  Widget _buildErrorScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Oops! Something went wrong.",
          style: AppTextStyles.headingM,
        ),
        smallSpaceSize,
        const Text(
          "We couldn't fetch your credit score. Please check your internet connection or fill in your details.",
          textAlign: TextAlign.center,
          style: AppTextStyles.body,
        ),
        largeSpaceSize,
        CustomButton.primary(
          text: "Retry",
          onPressed: () => controller.fetchCreditScore(),
        ),
        largeSpaceSize,
        CustomButton(
          text: "Fill in details",
          onPressed: () {
            // Navigate to the preferences form
            Get.toNamed('/loan-preferences');
          },
        ),
      ],
    );
  }
}
