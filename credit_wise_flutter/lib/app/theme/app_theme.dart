import 'package:flutter/material.dart';
import "app_colors.dart";
import 'app_text_styles.dart';

final ThemeData appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final baseTheme = ThemeData.light(); //Light theme as base theme

  return baseTheme.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: baseTheme.colorScheme.copyWith( 
      primary: AppColors.accent,
      secondary: AppColors.accent,
      error: AppColors.error,
    ),

    textTheme: baseTheme.textTheme.copyWith(
      headlineLarge: AppTextStyles.headingXL,
      headlineMedium: AppTextStyles.headingL,
      headlineSmall: AppTextStyles.headingM,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.bodySmall,
      bodySmall: AppTextStyles.bodySmall,
    ),
  );
}
