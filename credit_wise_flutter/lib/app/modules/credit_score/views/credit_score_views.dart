import 'package:credit_wise_flutter/app/data/widgets/profile_image_widget.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_text_styles.dart';
import '../controllers/credit_score_controllers.dart';

class CreditScoreView extends GetView<CreditScoreController> {
  const CreditScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Credit Score", style: AppTextStyles.headingXL),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ProfileImageWidget(
                    profilePic: "assets/male_account_user.png",
                  ),
                  smallSpaceSize,
                  const Text("David Mwaura", style: AppTextStyles.headingL),
                  smallSpaceSize,
                  const Text("Credit Score: 720",
                      style: AppTextStyles.captionXL),
                ],
              ),
            ),
            largeSpaceSize,
            const Text("Credit Score:", style: AppTextStyles.headingM),
            smallSpaceSize,
            const Text("720", style: AppTextStyles.headingXL),
            Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                    //color: Colors.blue,
                    margin: const EdgeInsets.all(20),
                    child: Obx(() {
                      return PieChart(
                        //duration: Duration(milliseconds: 2000),
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              titlePositionPercentageOffset: 0.5,
                              radius: controller.touchedIndex.value == 0 ? 60 : 50,
                              title: "Good",
                              titleStyle: AppTextStyles.body,
                              showTitle: true,
                              color: Colors.blue,
                              value: 80,
                            ),
                            PieChartSectionData(
                              titlePositionPercentageOffset: 0.5,
                              radius: controller.touchedIndex.value == 1 ? 60:40,
                              title: "Bad",
                              titleStyle: AppTextStyles.body,
                              showTitle: true,
                              color: Colors.red,
                              value: 20,
                            ),
                          ],
                          //centerSpaceRadius: 120,
                          sectionsSpace: 5,
                          startDegreeOffset: 120,
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                controller.touchedIndex.value = -1;
                                return;
                              }

                              controller.touchedIndex.value = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            },
                          ),
                        ),
                      );
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
