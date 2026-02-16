import "package:flutter/material.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              Text("Welcome to Credit Wise", style: AppTextStyles.headingL),
              mediumSpaceSize,
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/onboarding_page_2.png",
                      fit: BoxFit.fill),
                ),
              ),
              mediumSpaceSize,
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Get your credit score, monitor your credit and get personalized loan recommendations",
                  style: AppTextStyles.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
