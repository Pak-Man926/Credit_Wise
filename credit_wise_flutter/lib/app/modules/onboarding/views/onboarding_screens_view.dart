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
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import "../../../data/widgets/button_widget.dart";
import "../controllers/onboarding_controller.dart";

class OnBoardingScreens extends GetView<OnboardingController> {
  //const OnboardingScreens({super.key});

  final List<Widget> pages = const [
    OnBoardingScreen1(),
    OnBoardingScreen2(),
    OnBoardingScreen3(),
    OnBoardingScreen4(),
  ];

  void skipOnboarding() {
    pageController.animateToPage(
      pages.length - 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void nextPage() {
    if (controller.currentIndex.value < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      onFinish();
    }
  }

  void onFinish() {
    Get.offAllNamed(Routes.LOGIN);
  }

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: (int index) {
              controller.currentIndex.value = index;
              //controller.update();
            },
            itemBuilder: (context, int index) => pages[index],
          ),
          Obx(
            () => controller.currentIndex.value == pages.length - 1
                ? SizedBox.shrink()
                : Positioned(
                    bottom: 20,
                    left: 20,
                    child: TextButton(
                      onPressed: () {
                        skipOnboarding();
                      },
                      child: Text("Skip"),
                    ),
                  ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Obx(
              () => TextButton(
                onPressed: () {
                  nextPage();
                },
                child: Text(
                  controller.currentIndex.value == pages.length - 1
                      ? ""
                      : "Next",
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: pages.length,
                effect: WormEffect(
                  activeDotColor:AppColors.accent,
                  dotColor: const Color.fromARGB(255, 220, 226, 233),
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),
          Obx(
            () => controller.currentIndex.value == pages.length - 1
                ? Positioned(
                    bottom: 200,
                    left: 20,
                    right: 20,
                    child: CustomButton.primary(
                      text: "Login",
                      onPressed: () => Get.offAllNamed(Routes.LOGIN),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          Obx(
            () => controller.currentIndex.value == pages.length - 1
                ? Positioned(
                    bottom: 140,
                    left: 20,
                    right: 20,
                    child: CustomButton(
                      text: "Register",
                      onPressed: () => Get.offAllNamed(Routes.REGISTRATION),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
