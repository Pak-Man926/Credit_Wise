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
      items: const [
        BottomNavigationBarItem(icon: Icon(
  PhosphorIcons.house,
  size: 32.0,
), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: "Schedule"),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_rounded), label: "Saved"),
      ],
    );
  }
}
