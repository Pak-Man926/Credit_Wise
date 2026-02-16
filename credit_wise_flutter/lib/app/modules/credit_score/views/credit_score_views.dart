import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/widgets/button_widget.dart';
import '../../../data/widgets/credit_score_gauge.dart';
import '../../../data/widgets/profile_image_widget.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../utils/constants.dart';
import '../../../routes/app_routes.dart';
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
    // Determine avatar based on gender
    final gender = controller.userProfile.value?.gender ?? "Male";
    final avatarAsset = gender.toLowerCase() == "female"
        ? "assets/female_account_user.png"
        : "assets/male_account_user.png";

    final fullName =
        "${controller.userProfile.value?.firstName ?? ''} ${controller.userProfile.value?.lastName ?? ''}".trim();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                ProfileImageWidget(profilePic: avatarAsset),
                smallSpaceSize,
                Text(
                  fullName.isNotEmpty ? fullName : "User",
                  style: AppTextStyles.headingL,
                ),
                smallSpaceSize,
                Obx(
                  () => Text(
                    "Credit Score: ${controller.simulatedScore.value}",
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
      ),
    );
  }

  // Error Screen — failsafe with directions to fill in data
  Widget _buildErrorScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 64,
              color: AppColors.accent,
            ),
            largeSpaceSize,
            const Text(
              "No Credit Score Available",
              style: AppTextStyles.headingL,
              textAlign: TextAlign.center,
            ),
            smallSpaceSize,
            const Text(
              "We couldn't calculate your credit score. This usually means your profile or credit preferences haven't been filled in yet.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body,
            ),
            largeSpaceSize,
            CustomButton.primary(
              text: "Retry",
              onPressed: () => controller.fetchCreditScore(),
            ),
            mediumSpaceSize,
            CustomButton(
              text: "Fill in Profile",
              onPressed: () => Get.toNamed(Routes.PROFILE),
            ),
            mediumSpaceSize,
            CustomButton(
              text: "Set Credit Preferences",
              onPressed: () => Get.toNamed(Routes.CREDIT_PREFERENCE),
            ),
          ],
        ),
      ),
    );
  }
}
