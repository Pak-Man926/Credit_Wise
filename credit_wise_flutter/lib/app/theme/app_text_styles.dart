import "package:flutter/material.dart";
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// App Font Sizes
class AppFontSizes {
  static const double headingXL = 22; // big headings
  static const double headingL = 20;
  static const double headingM = 16;
  static const double body = 16;
  static const double bodySmall = 14;
  static const double caption = 12;
}

const String headingXLFontFamily = "Manrope"; //Used for font sizes 18 and above
const String bodyFontFamily = "notoSans"; //Used for font sizes below 18


/// App Text Styles
class AppTextStyles {
  static const TextStyle headingXL = TextStyle(
    fontFamily: headingXLFontFamily,
    fontSize: AppFontSizes.headingXL,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static const TextStyle headingL = TextStyle(
    fontFamily: headingXLFontFamily,
    fontSize: AppFontSizes.headingL,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static const TextStyle headingM = TextStyle(
    fontFamily: headingXLFontFamily,
    fontSize: AppFontSizes.headingM,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static const TextStyle body = TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: AppFontSizes.body,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.4,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: AppFontSizes.bodySmall,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.4,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: AppFontSizes.caption,
    fontWeight: FontWeight.w500,
    color: AppColors.background,
    height: 1.2,
  );

  static const TextStyle button = TextStyle(
    fontFamily: bodyFontFamily,
    fontSize: AppFontSizes.body,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
  );
}

