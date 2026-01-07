import 'package:credit_wise_flutter/app/data/widgets/loan_offers_feed_widget.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_text_styles.dart';
import '../controllers/loan_offers_controller.dart';

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
              LoanOffersFeedWidget(
                headlineText: "Sponsered",
                bottomlineText:
                    "Get a low rate on a home \n equity line of credit",
                onPressed: () {},
                image: "assets/loan_recommendations_1.png",
                midlineText: "Home Equity Line of Credit",
                buttonLabel: "View Offer",
              ),
              mediumSpaceSize,
              LoanOffersFeedWidget(
                headlineText: "Sponsered",
                bottomlineText: "Get a low rate on a personal loan",
                onPressed: () {},
                image: "assets/loan_recommendations_2.png",
                midlineText: "Personal Loan",
                buttonLabel: "View Offer",
              ),
              mediumSpaceSize,
              LoanOffersFeedWidget(
                headlineText: "Sponsered",
                bottomlineText: "Get a low rate on an auto loan",
                onPressed: () {},
                image: "assets/loan_recommendations_3.png",
                midlineText: "Auto Loan",
                buttonLabel: "View Offer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
