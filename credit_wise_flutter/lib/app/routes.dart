import "package:credit_wise_flutter/app/modules/auth/login/views/login.dart";
import "package:get/get.dart";

class AppRoutes {
  static final routes = [
    GetPage(
      name: "/login",
      page: () => const Login(),
    ),
  ];
}
