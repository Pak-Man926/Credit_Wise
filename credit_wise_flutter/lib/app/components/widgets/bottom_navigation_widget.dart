import "package:flutter/material.dart";
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavigationWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<BottomNavigationBarItem> items;
  final int currentIndex;

  const BottomNavigationWidget(
      {this.onPressed, required this.items, this.currentIndex = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onPressed: onPressed,
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
