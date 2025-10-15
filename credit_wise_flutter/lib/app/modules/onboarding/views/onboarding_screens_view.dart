import "package:credit_wise_flutter/app/modules/onboarding/views/onboarding_screen_1.dart";
import "package:credit_wise_flutter/app/modules/onboarding/views/onboarding_screen_2.dart";
import "package:credit_wise_flutter/app/modules/onboarding/views/onboarding_screen_3.dart";
import "package:credit_wise_flutter/app/modules/onboarding/views/onboarding_screen_4.dart";
import "package:credit_wise_flutter/app/routes/app_routes.dart";
import "package:credit_wise_flutter/app/theme/app_colors.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:flutter/material.dart";
import "package:flutter_onboarding_slider/flutter_onboarding_slider.dart";
import "package:get/get.dart";

import "../controllers/onboarding_controller.dart";

class OnboardingScreens extends GetView<OnboardingController> {
  //const OnboardingScreens({super.key});

  final List<Widget> pages = const [
    OnBoardingScreen1(),
    OnBoardingScreen2(),
    OnBoardingScreen3(),
    OnBoardingScreen4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: pages.length,
            itemBuilder: (context, int index) => pages[index],
          ),
        ],
      ),
    );
  }
}
