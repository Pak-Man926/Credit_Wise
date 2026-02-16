import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loan_offers_controller.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../routes/app_routes.dart';
import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/loan_offers_feed_widget.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';

class LoanOffersView extends GetView<LoanOffersController> {
  const LoanOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Loan Offers', style: AppTextStyles.headingL),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Personalized Offers", style: AppTextStyles.headingXL),
              mediumSpaceSize,

              // Display message or error
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.isError.value) {
                  return _buildErrorScreen();
                } else {
                  return _buildLoanOffers();
                }
              }),

              mediumSpaceSize,

              // Fetch button
              CustomButton.primary(
                text: "Fetch",
                onPressed: () => controller.fetchLoanOffers(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Error Screen — with failsafe directions
  Widget _buildErrorScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: 64,
              color: AppColors.accent,
            ),
            largeSpaceSize,
            const Text(
              "No Loan Data Available",
              style: AppTextStyles.headingL,
              textAlign: TextAlign.center,
            ),
            smallSpaceSize,
            Obx(
              () => Text(
                controller.message.value.isNotEmpty
                    ? controller.message.value
                    : "Please fill in your profile and loan preferences to get personalized offers.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),
            ),
            largeSpaceSize,
            CustomButton.primary(
              text: "Retry",
              onPressed: () => controller.fetchLoanOffers(),
            ),
            mediumSpaceSize,
            CustomButton(
              text: "Fill in Profile",
              onPressed: () => Get.toNamed(Routes.PROFILE),
            ),
            mediumSpaceSize,
            CustomButton(
              text: "Set Loan Preferences",
              onPressed: () => Get.toNamed(Routes.LOAN_PREFERENCE),
            ),
          ],
        ),
      ),
    );
  }

  // Loan Offers Display
  Widget _buildLoanOffers() {
    return Obx(() {
      final probability = controller.displayProbability;
      final band = controller.approvalBand.value;
      final approved = controller.isApproved;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display loan prediction result
          Text(
            "Approval Probability: ${probability.toStringAsFixed(1)}%",
            style: AppTextStyles.headingM,
          ),
          smallSpaceSize,
          Text(
            "Status: $band",
            style: AppTextStyles.body,
          ),
          mediumSpaceSize,

          // Show message
          if (controller.message.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                controller.message.value,
                style: AppTextStyles.bodySmall,
              ),
            ),

          // Only show loan recommendation cards if approved
          if (approved) ...[
            LoanOffersFeedWidget(
              headlineText: "Sponsored",
              bottomlineText: "Get a low rate on a home \n equity line of credit",
              onPressed: () {},
              image: "assets/loan_recommendations_1.png",
              midlineText: "Home Equity Line of Credit",
              buttonLabel: "View Offer",
            ),
            mediumSpaceSize,
            LoanOffersFeedWidget(
              headlineText: "Sponsored",
              bottomlineText: "Get a low rate on a personal loan",
              onPressed: () {},
              image: "assets/loan_recommendations_2.png",
              midlineText: "Personal Loan",
              buttonLabel: "View Offer",
            ),
            mediumSpaceSize,
            LoanOffersFeedWidget(
              headlineText: "Sponsored",
              bottomlineText: "Get a low rate on an auto loan",
              onPressed: () {},
              image: "assets/loan_recommendations_3.png",
              midlineText: "Auto Loan",
              buttonLabel: "View Offer",
            ),
          ],

          // If not approved, show guidance
          if (!approved && band.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(Icons.sentiment_dissatisfied_outlined,
                        size: 40, color: AppColors.accent),
                    smallSpaceSize,
                    const Text(
                      "Your current approval probability is below the threshold for personalized offers.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body,
                    ),
                    smallSpaceSize,
                    const Text(
                      "Try improving your credit score or adjusting your loan preferences.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      );
    });
  }
}
