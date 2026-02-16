import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/profile_image_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/profile_selection_widget.dart';
import 'package:credit_wise_flutter/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_text_styles.dart';
import '../../../utils/constants.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Obx(() {
                final gender = controller.userProfile.value?.gender ?? 'Male';
                final avatarAsset = gender.toLowerCase() == 'female'
                    ? 'assets/female_account_user.png'
                    : 'assets/male_account_user.png';
                final fullName =
                    '${controller.userProfile.value?.firstName ?? ''} ${controller.userProfile.value?.lastName ?? ''}'.trim();

                return Column(children: [
                  ProfileImageWidget(profilePic: avatarAsset),
                  smallSpaceSize,
                  Text(fullName.isNotEmpty ? fullName : 'User',
                      style: AppTextStyles.headingL),
                  smallSpaceSize,
                  Text(controller.userProfile.value?.email ?? '',
                      style: AppTextStyles.bodySmall),
                ]);
              }),
            ),
            mediumSpaceSize,
            const Text("Account & Settings", style: AppTextStyles.headingL),
            smallSpaceSize,
            ProfileSelectionWidget(
              leadingIcon: Icons.person_outline_outlined,
              accountSelection: "Profile & Finances",
              onPressed: () => Get.toNamed(Routes.PROFILE),
            ),
            mediumSpaceSize,
            ProfileSelectionWidget(
              leadingIcon: Icons.star_border_outlined,
              accountSelection: "Preferences",
              onPressed: () => Get.toNamed(Routes.PREFERENCES),
            ),
            mediumSpaceSize,
            ProfileSelectionWidget(
                leadingIcon: Icons.insert_link_outlined,
                accountSelection: "Linked Accounts",
                onPressed: () {}),
            mediumSpaceSize,
            ProfileSelectionWidget(
                accountSelection: "Support",
                leadingIcon: Icons.contact_support_outlined,
                onPressed: () => Get.toNamed(Routes.SUPPORT)),
            mediumSpaceSize,
            ProfileSelectionWidget(
                leadingIcon: Icons.security_outlined,
                accountSelection: "Privacy & Security",
                onPressed: () => Get.toNamed(Routes.SUPPORT)),
            mediumSpaceSize,
            ProfileSelectionWidget(
                accountSelection: "Notifications",
                leadingIcon: Icons.notifications_outlined,
                onPressed: () => Get.toNamed(Routes.NOTIFICATIONS)),
            largeSpaceSize,
            CustomButton(
              text: "Sign Out",
              onPressed: () => controller.logout(),
            ),
          ],
        ),
      ),
    );
  }
}
