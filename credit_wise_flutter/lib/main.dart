import "package:credit_wise_flutter/app/routes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
    );
  }
}