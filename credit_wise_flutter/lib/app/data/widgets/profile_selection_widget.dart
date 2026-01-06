import "package:credit_wise_flutter/app/theme/app_colors.dart";
import "package:flutter/material.dart";

import "../../theme/app_text_styles.dart";

class ProfileSelectionWidget extends StatelessWidget {
  const ProfileSelectionWidget({
    super.key,
    required this.accountSelection,
    required this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward_ios_rounded,
    this.onPressed,
  });

  final String? accountSelection;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 40,
            width: 40,
            child: Icon(
              leadingIcon,
              size: 30,
            ),
          ),
          const SizedBox(width: 15),
          Text("$accountSelection", style: AppTextStyles.body),
          const Spacer(),
          Icon(
            trailingIcon,
            size: 20,
          ),
        ]),
      ),
    );
  }
}
