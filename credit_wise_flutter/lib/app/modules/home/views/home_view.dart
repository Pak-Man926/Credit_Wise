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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  final firstName = controller.userProfile.value?.firstName ?? 'User';
                  return Text("Welcome back, $firstName",
                      style: AppTextStyles.headingXL);
                }),
                mediumSpaceSize,
                Obx(() {
                  final score = controller.creditPrediction.value?.simulatedScore ?? 0;
                  final band = controller.creditPrediction.value?.scoreBand ?? '--';
                  return HomeFeedWidget(
                    headlineText: "Credit Score",
                    bottomlineText: band,
                    onPressed: () => Get.toNamed(Routes.CREDIT_SCORE),
                    image: "assets/view_score_background_image.png",
                    creditScore: score,
                    buttonLabel: "View Score",
                  );
                }),
                mediumSpaceSize,
                HomeFeedWidget(
                  headlineText: "Recommendation",
                  bottomlineText: "Personalized Offers",
                  onPressed: () => Get.toNamed(Routes.LOAN_OFFERS),
                  image: "assets/recommendation_view_background.png",
                  creditScore: null,
                  buttonLabel: "View Offers",
                ),
                mediumSpaceSize,
                const Text("Tips", style: AppTextStyles.headingXL),
                mediumSpaceSize,
                SizedBox(
                  height: 275,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/improve_credit_score_backround_image.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Text overlay
                      Positioned(
                        left: 20, // distance from left edge
                        top: 120,
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width:
                                290, // limits text width so it doesn’t stretch across
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Improve your credit score",
                                  style: AppTextStyles.captionL,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Learn how to boost your credit rating with our expert tips.",
                                  style: AppTextStyles.caption,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
