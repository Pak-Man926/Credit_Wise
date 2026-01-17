import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:flutter/material.dart";

import "../../theme/app_colors.dart";
import "../../utils/constants.dart";

class PreferencesWidget extends StatelessWidget {
  final String title;
  final String details;
  final IconData leadingIcon;
  final IconData trailingicon;
  final void Function()? onTap;

  const PreferencesWidget({
    super.key,
    required this.title,
    required this.details,
    required this.leadingIcon,
    required this.trailingicon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Icons design
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inputBackground,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(80),
                      child: Icon(
                        leadingIcon,
                        size: 50,
                        color: AppColors.accent,
                      ),
                    )),
                mediumSpaceSize,
                Icon(
                  trailingicon,
                  size: 30,
                  color: AppColors.accent,
                ),
              ],
            ),
            //Text Design
            smallSpaceSize,
            Text(title, style: AppTextStyles.headingL),
            smallSpaceSize,
            Text(details, style: AppTextStyles.captionXL),
          ]),
        ),
      ),
    );
  }
}
