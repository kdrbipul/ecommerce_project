import 'package:ecommerce_project/presentation/screens/splash_screen.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
       colorSchemeSeed: AppColors.primaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor
        )
      ),

    );
  }
}
