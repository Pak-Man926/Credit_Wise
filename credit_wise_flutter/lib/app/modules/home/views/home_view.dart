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
          children: [
            Text("Welcome back, David", style: AppTextStyles.headingXL),
            mediumSpaceSize,
            
          ],
        ),
      ),
     )
    );
  }
}
