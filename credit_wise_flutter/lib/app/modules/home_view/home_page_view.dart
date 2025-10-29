import "package:credit_wise_flutter/app/modules/home_view/account/views/account_view.dart";
import "package:credit_wise_flutter/app/modules/home_view/credit_score/views/credit_score_views.dart";
import "package:credit_wise_flutter/app/modules/home_view/home/views/home_view.dart";
import "package:credit_wise_flutter/app/modules/home_view/loan_offers/views/loan_offer_view.dart";
import "package:credit_wise_flutter/app/modules/home_view/home_page_controller.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../data/widgets/bottom_navigation_bar_widget.dart";

class HomePageView extends StatelessWidget {
  //const HomePageView({super.key});
  var _selectedIndex = 0.obs;

  void onChange(int index) {
    _selectedIndex.value = index;
  }

  final List<Widget> _pages = [
    HomeView(),
    CreditScoreView(),
    LoanOffersView(),
    AccountView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => _pages[_selectedIndex.value])),
      bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: _selectedIndex.value, onTap: onChange),
    );
  }
}
