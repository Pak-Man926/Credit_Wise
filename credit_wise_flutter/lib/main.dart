//import "package:credit_wise_flutter/app/routes.dart";
// import "package:credit_wise_flutter/app/modules/onboarding/views/onboarding_view.dart";
// import "package:credit_wise_flutter/app/theme/app_theme.dart";
import "package:credit_wise_client/credit_wise_client.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";
import "package:flutter/material.dart";
//import "package:get/get.dart";
import "package:credit_wise_flutter/app/app.dart";
import "package:get/get.dart";
import "package:logger/logger.dart";
import "package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";

void main() async {
  var logger = Logger();
  WidgetsFlutterBinding.ensureInitialized();

  final client = Client(
    webBaseUrl,
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // Optional: set up SessionManager here if you use it
  final sessionManager = SessionManager(caller: client.modules.auth);
  await sessionManager.initialize();

  // Make client available to all GetX controllers
  Get.put<Client>(client, permanent: true);
  Get.put<SessionManager>(sessionManager, permanent: true);

  logger.d("Client initialized with base URL: $webBaseUrl");

  runApp(App());
}
