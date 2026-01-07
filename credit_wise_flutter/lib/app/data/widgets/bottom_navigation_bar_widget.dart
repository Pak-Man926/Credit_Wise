import "package:credit_wise_flutter/app/theme/app_colors.dart";
import "package:credit_wise_flutter/app/theme/app_text_styles.dart";
//import "package:credit_wise_flutter/app/theme/app_theme.dart";
import "package:flutter/material.dart";
import "package:phosphor_flutter/phosphor_flutter.dart";

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final List<BottomNavigationBarItem>? items;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.background,
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedItemColor: AppColors.accent,
      selectedItemColor: AppColors.primaryText,
      selectedFontSize: 8,
      unselectedFontSize: 8,
      showUnselectedLabels: true,
      selectedLabelStyle: AppTextStyles.bodySmall,
      unselectedLabelStyle: AppTextStyles.bodySmall,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.house(),
              size: 24.0,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.presentationChart(),
              size: 24.0,
            ),
            label: "Credit Score"),
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.star(),
              size: 24.0,
            ),
            label: "Recommendations"),
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.user(),
              size: 24.0,
            ),
            label: "Profile"),
      ],
    );
  }
}
