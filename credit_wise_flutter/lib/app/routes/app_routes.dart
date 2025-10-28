abstract class Routes {
  // Define the initial route for the GetMaterialApp
  static const INITIAL = ONBOARDING;

  // --- Authentication & Onboarding Routes ---
  static const ONBOARDING =
      '/onboarding'; // Onboarding Flow (View handles 5 internal pages)
  static const LOGIN = '/login';
  static const REGISTRATION = '/registration'; // NEW

  // --- Main Application Pages ---
  static const HOME_VIEW = '/home_view';
  static const HOME = '/home';
  static const CREDIT_SCORE = '/credit-score'; // NEW
  static const LOAN_OFFERS = '/loan-offers'; // NEW
  static const ACCOUNT = '/account'; // NEW (e.g., User Profile, Settings)
}
