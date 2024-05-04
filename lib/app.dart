import 'package:ecommerce_project/presentation/screens/splash_screen.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        colorSchemeSeed: AppColors.primaryColor,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.primaryColor),
        textTheme: _textTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
      ),
    );
  }

  TextTheme _textTheme() => const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey));
  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        border: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );
  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor));
  ElevatedButtonThemeData _elevatedButtonThemeData() => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(double.maxFinite),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      );
}
