import "package:credit_wise_flutter/app/modules/home_page_view/controllers/home_page_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../data/widgets/bottom_navigation_bar_widget.dart";

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.pages[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => AppBottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onChange),
      ),
    );
  }
}
