import 'package:credit_wise_flutter/app/data/widgets/home_feed_widget.dart';
import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:credit_wise_flutter/app/theme/app_colors.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home", style: AppTextStyles.headingXL),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Welcome back, David",
                      style: AppTextStyles.headingXL),
                ),
                mediumSpaceSize,
                HomeFeedWidget(
                  headlineText: "Credit Score",
                  bottomlineText: "Good",
                  onPressed: () => Get.toNamed(Routes.CREDIT_SCORE),
                  image: "assets/view_score_background_image.png",
                  creditScore: 720,
                  buttonLabel: "View Score",
                ),
                mediumSpaceSize,
                HomeFeedWidget(
                  headlineText: "Recommendation",
                  bottomlineText: "Personalized Offers",
                  onPressed: () => Get.toNamed(Routes.LOAN_OFFERS),
                  image: "assets/recommendation_view_background.png",
                  creditScore: 2,
                  buttonLabel: "View Offers",
                )
              ],
            ),
          ),
        ));
  }
}
