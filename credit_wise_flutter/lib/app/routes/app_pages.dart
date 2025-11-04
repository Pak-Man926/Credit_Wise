import 'package:credit_wise_flutter/app/modules/home_page_view/bindings/home_page_binding.dart';
import 'package:credit_wise_flutter/app/modules/home_page_view/views/home_page_view.dart';
import 'package:credit_wise_flutter/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:credit_wise_flutter/app/modules/onboarding/views/onboarding_view.dart';
import 'package:get/get.dart';


import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/auth/bindings/login_binding.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/credit_score/bindings/credit_score_bindings.dart';
import '../modules/credit_score/views/credit_score_views.dart';
import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loan_offers/bindings/loan_offers_binding.dart';
import '../modules/loan_offers/views/loan_offer_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    // 1. ONBOARDING WELCOME
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),

    // 2. AUTHENTICATION
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
      transition: Transition.rightToLeft,
    ),

    // 3. MAIN APPLICATION PAGES
    GetPage(
      name: Routes.HOME_VIEW,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CREDIT_SCORE,
      page: () => const CreditScoreView(),
      binding: CreditScoreBinding(),
    ),
    GetPage(
      name: Routes.LOAN_OFFERS,
      page: () => const LoanOffersView(),
      binding: LoanOffersBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
  ];
}
