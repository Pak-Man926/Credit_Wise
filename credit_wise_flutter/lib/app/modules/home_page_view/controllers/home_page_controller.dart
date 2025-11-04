import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../account/views/account_view.dart";
import "../../credit_score/views/credit_score_views.dart";
import "../../home/views/home_view.dart";
import "../../loan_offers/views/loan_offer_view.dart";

class HomePageController extends GetxController {
    var selectedIndex = 0.obs;

  void onChange(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeView(),
    CreditScoreView(),
    LoanOffersView(),
    AccountView()
  ];



}
