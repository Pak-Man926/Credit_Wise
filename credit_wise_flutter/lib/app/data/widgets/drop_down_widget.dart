import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
import "package:flutter/material.dart";

import "../../theme/app_colors.dart";

class DropDownWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? value; // Changed from selectedItem
  final void Function(String?)? onChanged;
  final Color selectedColor;

  const DropDownWidget({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.selectedColor = AppColors.primaryText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value == "" ? null : value, // Handle empty state
      iconEnabledColor: selectedColor,
      style: AppTextStyles.bodySmall.copyWith(color: selectedColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.inputPlaceholder,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
