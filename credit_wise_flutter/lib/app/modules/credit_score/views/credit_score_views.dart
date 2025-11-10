import 'package:credit_wise_flutter/app/data/widgets/profile_image_widget.dart';
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
      body:Column(
        children: [
          Center(
          child: ProfileImageWidget("assets/male_account_user.png"),
          ),
        ],
      ),
    );
  }
}
