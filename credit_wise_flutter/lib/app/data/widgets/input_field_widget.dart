import "package:credit_wise_flutter/app/theme/app_colors.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:flutter/material.dart";

class InputFieldWidget extends StatelessWidget {
  final String? hintText;
  final Color? inputBgColor;
  final bool obscureText;
  final TextEditingController? controller;

  const InputFieldWidget({
    super.key,
    required this.hintText,
    this.inputBgColor = AppColors.inputBackground,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: inputBgColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: TextField(
            obscureText: obscureText,
            style: AppTextStyles.body,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.inputPlaceholder,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ),
    );
  }
}
