import 'package:credit_wise_flutter/app/modules/home_view/home_page_view.dart';
import 'package:credit_wise_flutter/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:credit_wise_flutter/app/modules/onboarding/views/onboarding_view.dart';
import 'package:get/get.dart';


import '../modules/home_view/account/bindings/account_binding.dart';
import '../modules/home_view/account/views/account_view.dart';
import '../modules/home_view/auth/bindings/login_binding.dart';
import '../modules/home_view/auth/register/bindings/register_binding.dart';
import '../modules/home_view/auth/register/views/register_view.dart';
import '../modules/home_view/auth/views/login_view.dart';
import '../modules/home_view/credit_score/bindings/credit_score_bindings.dart';
import '../modules/home_view/credit_score/views/credit_score_views.dart';
import '../modules/home_view/home/bindings/home_bindings.dart';
import '../modules/home_view/home/views/home_view.dart';
import '../modules/home_view/loan_offers/bindings/loan_offers_binding.dart';
import '../modules/home_view/loan_offers/views/loan_offer_view.dart';
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
