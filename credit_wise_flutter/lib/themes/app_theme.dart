import 'package:flutter/material.dart';

/// App Color Constants
class AppColors {
  static const Color background = Color(0xFFF8FAFC); // slate-50
  static const Color primaryText = Color(0xFF0D171B); // dark text
  static const Color secondaryText = Color(0xFF4C809A); // light blue-grey
  static const Color divider = Color(0xFFE7EFF3); // borders / cards
  static const Color accent = Color(0xFF4C809A); // buttons/icons highlight
}

/// App Font Sizes
class AppFontSizes {
  static const double headingXL = 22; // big headings
  static const double headingL = 20; 
  static const double headingM = 18;
  static const double body = 16;
  static const double bodySmall = 14;
  static const double caption = 12;
}

/// App Text Styles
class AppTextStyles {
  static const TextStyle headingXL = TextStyle(
    fontSize: AppFontSizes.headingXL,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static const TextStyle headingM = TextStyle(
    fontSize: AppFontSizes.headingM,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppFontSizes.body,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.4,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontSize: AppFontSizes.bodySmall,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.4,
  );

  static const TextStyle caption = TextStyle(
    fontSize: AppFontSizes.caption,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryText,
    height: 1.2,
  );
}
