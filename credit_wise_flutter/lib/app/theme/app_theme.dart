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

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.headingXL.copyWith(color: AppColors.primaryText),
      iconTheme: IconThemeData(color: AppColors.primaryText),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      selectedIconTheme: IconThemeData(color: AppColors.primaryText),
      unselectedIconTheme: IconThemeData(color: AppColors.accent),
    ),
  );
}
