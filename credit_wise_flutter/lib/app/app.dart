import "package:credit_wise_flutter/app/theme/app_theme.dart";
import "package:credit_wise_flutter/app/utils/constants.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "routes/app_pages.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.sizeOf(context),
      ensureScreenSize: true,
      builder: (context, child) {
        return SafeArea(
            top: false,
            bottom: true,
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: App_Name,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              theme: appTheme,
            ));
      }
    );
  }
}
