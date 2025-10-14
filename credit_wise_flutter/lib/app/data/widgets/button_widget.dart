import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:credit_wise_flutter/app/theme/app_theme.dart";
import "package:flutter/material.dart";

import "../../theme/app_colors.dart";

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color = AppColors.background,
    this.textStyle = AppTextStyles.button,
  });

  const CustomButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.color = AppColors.accent,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            text,
            style: textStyle,
          ),
        ));
  }
}
