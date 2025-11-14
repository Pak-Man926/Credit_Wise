import 'package:credit_wise_flutter/app/data/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_text_styles.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Account', style: AppTextStyles.headingL),
        ),
      body: Column(
        children:[
          Center(
            child: Column(
              children: [
                ProfileImageWidget(profilePic: "assets/female_account_user.png"),
              ]
            ),),
        ],
      ),
    );
  }
}
