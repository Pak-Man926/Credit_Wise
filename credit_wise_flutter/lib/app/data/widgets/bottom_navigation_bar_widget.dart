import "package:credit_wise_flutter/app/theme/app_theme.dart";
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
      //type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: appTheme.bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor:
          appTheme.bottomNavigationBarTheme.unselectedItemColor,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.house(),
              size: 32.0,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.presentationChart(),
              size: 32.0,
            ),
            label: "Credit Score"),
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.star(),
              size: 32.0,
            ),
            label: "Recommendations"),
        BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.user(),
              size: 32.0,
            ),
            label: "Profile"),
      ],
    );
  }
}
