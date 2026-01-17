import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/input_field_widget.dart';
import 'package:credit_wise_flutter/app/theme/app_colors.dart';
import 'package:credit_wise_flutter/app/theme/app_text_styles.dart';
import 'package:credit_wise_flutter/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Finances', style: AppTextStyles.headingL),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Age", style: AppTextStyles.body),
          smallSpaceSize,
          InputFieldWidget(hintText: "Enter your age"),
          smallSpaceSize,
          const Text("Number of Dependants", style: AppTextStyles.body),
          smallSpaceSize,
          InputFieldWidget(hintText: "E.g 2"),
          smallSpaceSize,
          const Text("Monthly Income", style: AppTextStyles.body),
          smallSpaceSize,
          InputFieldWidget(hintText: "E.g 30000"),
          smallSpaceSize,
          const Text(
              "How much do you pay per month for existing loans/credit? \n (Includes loan repayments, credit cards, overdrafts)",
              style: AppTextStyles.body),
          smallSpaceSize,
          InputFieldWidget(hintText: "If none, enter 0."),
          smallSpaceSize,
          const Text("Do you have a second income contributor(e.g Spouse)?",
              style: AppTextStyles.body),
          smallSpaceSize,
          Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      border: Border.all(color: AppColors.inputBackground),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: RadioListTile(
                      value: "Yes",
                      title: const Text("Yes", style: AppTextStyles.body),
                      //selected: true,
                      selectedTileColor: AppColors.primaryText,
                    )),
                SizedBox(
                  width: 5,
                ),
                Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      border: Border.all(color: AppColors.inputBackground),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: RadioListTile(
                      value: "No",
                      title: const Text("No", style: AppTextStyles.body),
                      toggleable: true,
                    )),
              ]),
          mediumSpaceSize,
          CustomButton.primary(
            text: "Submit",
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
