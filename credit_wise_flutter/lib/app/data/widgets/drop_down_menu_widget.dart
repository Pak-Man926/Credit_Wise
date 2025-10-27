import "package:credit_wise_flutter/app/theme/app_colors.dart";
import "package:flutter/material.dart";

import "../../theme/app_text_styles.dart";

class DropDownMenuWidget extends StatelessWidget {
  final String? hintText;
  final Color? inputBgColor;
  final ValueChanged<String?>? onSelected;

  const DropDownMenuWidget({
    super.key,
    required this.hintText,
    this.inputBgColor = AppColors.inputBackground,
    this.onSelected,
  });

  final List<DropdownMenuItem<String>> itemSelection = const [
    DropdownMenuItem(
      value: "Male",
      child: Text("Male"),
    ),
    DropdownMenuItem(
      value: "Female",
      child: Text("Female"),
    ),
    DropdownMenuItem(
      value: "Other",
      child: Text("Other"),
    ),
  ];

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
            child: DropdownButtonFormField(
                items: itemSelection,
                onChanged: onSelected,
                hint: Text(
                  "$hintText",
                  style: AppTextStyles.inputPlaceholder,
                ),
                iconEnabledColor: AppColors.accent,
                decoration: InputDecoration(
                  //hintText: hintText,
                  //hintStyle: ,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ))),
      ),
    );
  }
}
