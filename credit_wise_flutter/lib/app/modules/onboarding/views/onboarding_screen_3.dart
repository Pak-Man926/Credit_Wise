import "package:flutter/material.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({
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
                  child: Image.asset("assets/onboarding_page_4.png",
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
                  "Tailored loan offers just for you",
                  style: AppTextStyles.headingL,
                  textAlign: TextAlign.center,
                ),
                mediumSpaceSize,
                Text(
                  "We\'ll help you find the best loan options based on your credit score and financial goals.",
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
