import "package:flutter/material.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
                child: ClipRect(
                  child: Image.asset("assets/onboarding_page_3.png",
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
          mediumSpaceSize,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Credit Insights at your fingertips",
                  style: AppTextStyles.headingL,
                  textAlign: TextAlign.center,
                ),
                mediumSpaceSize,
                Text(
                  "We\'ll help you understand your credit score and how to improve it",
                  style: AppTextStyles.body,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
