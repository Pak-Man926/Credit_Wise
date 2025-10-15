import "package:credit_wise_flutter/app/data/widgets/button_widget.dart";
import "package:credit_wise_flutter/app/modules/onboarding/views/onboarding_screens_view.dart";
import "package:credit_wise_flutter/app/theme/app_colors.dart";
import "package:flutter/material.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";
import "package:get/get.dart";
import "../controllers/onboarding_controller.dart";
import "package:credit_wise_flutter/app/routes/app_routes.dart";
import "package:flutter_onboarding_slider/flutter_onboarding_slider.dart";

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        SizedBox(height: 40),
        Align(
          alignment: Alignment.center,
          child: Text("Get started with your \n    financial journey",
              style: AppTextStyles.headingXL),
        ),
        smallSpaceSize,
        Text(
            "Unlock your financial potential with personalizes insights and recommendations",
            style: AppTextStyles.headingM),
        mediumSpaceSize,
        SizedBox(
          width: double.infinity,
          height: 450,
          child: Image.asset("assets/onboarding_page_1.png", fit: BoxFit.fill),
        ),
        mediumSpaceSize,
        CustomButton.primary(
          text: "Get Started",
          //color: AppColors.accent,
          onPressed: () {
            Get.to(OnboardingScreens());
          },
        ),
        smallSpaceSize,
        CustomButton(
          text: ("Login"),
          onPressed: () => Get.toNamed(Routes.LOGIN),
        ),
        smallSpaceSize,
        Text(
          "By continuining, you agree to our Terms of Service and Privacy Policy",
          style: TextStyle(color: AppColors.secondaryText),
        )
      ]),
    ));
  }
}
