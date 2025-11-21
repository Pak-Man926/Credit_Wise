import 'package:credit_wise_flutter/app/data/widgets/button_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/profile_image_widget.dart';
import 'package:credit_wise_flutter/app/data/widgets/profile_selection_widget.dart';
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
              child: Column(children: [
                ProfileImageWidget(
                    profilePic: "assets/female_account_user.png"),
                smallSpaceSize,
                const Text("Jane Mwaura", style: AppTextStyles.headingL),
                smallSpaceSize,
                const Text("San Francisco, CA", style: AppTextStyles.bodySmall),
              ]),
            ),
            mediumSpaceSize,
            const Text("Account & Settings", style: AppTextStyles.headingL),
            smallSpaceSize,
            // ListTile(
            //   leading: const Icon(Icons.person_outline_rounded, size: 24,),
            //   title: const Text("Personal Information", style: AppTextStyles.body),
            //   trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15,),
            //   onTap: () {},
            // ),
            ProfileSelectionWidget(
              leadingIcon: Icons.person_outline_outlined,
              accountSelection: "Personal",
            ),
            mediumSpaceSize,
            ProfileSelectionWidget(
              leadingIcon: Icons.star_border_outlined,
              accountSelection: "Preferences",
            ),
            mediumSpaceSize,
            ProfileSelectionWidget(
              leadingIcon: Icons.insert_link_outlined,
              accountSelection: "Linked Accounts",
            ),
            mediumSpaceSize,
            ProfileSelectionWidget(
              accountSelection: "Support",
              leadingIcon: Icons.contact_support_outlined,
            ),
            mediumSpaceSize,
            ProfileSelectionWidget(
              leadingIcon: Icons.security_outlined,
              accountSelection: "Privacy & Security",
            ),
            mediumSpaceSize,
            ProfileSelectionWidget(
              accountSelection: "Notifications",
              leadingIcon: Icons.notifications_outlined,
            ),
            largeSpaceSize,
            CustomButton(text: "Sign Out",
            onPressed: () => controller.logout(),),
          ],
        ),
      ),
    );
  }
}
