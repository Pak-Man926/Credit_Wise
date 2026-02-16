import "package:credit_wise_flutter/app/theme/app_colors.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class InputFieldWidget extends StatelessWidget {
  final String? hintText;
  final Color? inputBgColor;
  final bool obscureText;
  final TextEditingController? controller;

  InputFieldWidget({
    super.key,
    required this.hintText,
    this.inputBgColor = AppColors.inputBackground,
    this.obscureText = false,
    this.controller,
  });

  // Local reactive state for password visibility toggle
  final RxBool _obscured = true.obs;

  @override
  Widget build(BuildContext context) {
    // Initialize based on the obscureText parameter
    _obscured.value = obscureText;

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
          child: obscureText
              ? Obx(() => TextField(
                    controller: controller,
                    obscureText: _obscured.value,
                    style: AppTextStyles.body,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: AppTextStyles.inputPlaceholder,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscured.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.accent,
                          size: 22,
                        ),
                        onPressed: () => _obscured.toggle(),
                      ),
                    ),
                  ))
              : TextField(
                  controller: controller,
                  obscureText: false,
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
