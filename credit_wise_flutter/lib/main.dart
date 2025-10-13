//import "package:credit_wise_flutter/app/routes.dart";
import "package:credit_wise_flutter/app/modules/onboarding/views/getting_started_page.dart";
import "package:credit_wise_flutter/app/theme/app_theme.dart";
import "package:flutter/material.dart";
//import "package:get/get.dart";
import "package:credit_wise_flutter/app/app.dart";

void main() {
  runApp(App());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const GettingStarted(),
    );
  }
}
