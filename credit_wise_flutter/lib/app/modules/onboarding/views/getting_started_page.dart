import "package:flutter/material.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: true,
      top: true,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Get started with your \n financial journery",
              style: AppTextStyles.headingXL,
              //textAlign: TextAlign.center,
            ),
            smallSpaceSize,
            Text(
                "Unlock your financial potential with personalized insights and recommendations",
                style: AppTextStyles.headingM),
            smallSpaceSize,
            Container(
              width: double.infinity,
              height: 450,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/onboarding_page_5.png",
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
