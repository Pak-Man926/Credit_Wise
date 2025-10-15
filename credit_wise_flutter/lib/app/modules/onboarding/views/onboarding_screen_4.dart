import "package:flutter/material.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";

class OnBoardingScreen4 extends StatelessWidget {
  const OnBoardingScreen4({
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
                  child: Image.asset("assets/onboarding_page_5.png",
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
                  "Your Financial Journey Starts Here",
                  style: AppTextStyles.headingL,
                  textAlign: TextAlign.center,
                ),
                mediumSpaceSize,
                Text(
                  "Take control of your finances with our app. Login or register to start managing your credit and explore loan options",
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
