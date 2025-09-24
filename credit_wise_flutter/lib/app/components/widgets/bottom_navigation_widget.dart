import "package:flutter/material.dart";
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final List<BottomNavigationBarItem>? items;

  const BottomNavigationWidget({
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
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.house()), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(
            PhosphorIcons.presentationChart(),
          ),
          label: "Credit Score",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_outlined),
            label: "Recommendations"),
        BottomNavigationBarItem(
            icon: Icon(PhosphorIcons.user()), label: "Profile"),
      ],
    );
  }
}
