import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loan_offers_controller.dart';
import '../../../theme/app_text_styles.dart';
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

              // Retry button
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
        Obx(
          () => Text(
            controller.message.value,
            textAlign: TextAlign.center,
            style: AppTextStyles.body,
          ),
        ),
        largeSpaceSize,
        CustomButton.primary(
          text: "Retry",
          onPressed: () => controller.fetchLoanOffers(),
        ),
      ],
    );
  }

  // Loan Offers Display
  Widget _buildLoanOffers() {
    return Column(
      children: [
        // Display loan prediction result
        Obx(
          () => Text(
            "Approval Probability: ${controller.approvalProbability.value.toStringAsFixed(2)}%",
            style: AppTextStyles.body,
          ),
        ),
        mediumSpaceSize,
        Obx(
          () => Text(
            "Approval Band: ${controller.approvalBand.value}",
            style: AppTextStyles.headingM,
          ),
        ),

        // Offer feeds
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
    );
  }
}
