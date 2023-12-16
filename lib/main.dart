import 'package:figma_project/colors.dart';
import 'package:figma_project/landing_screen.dart';
import 'package:figma_project/paymentform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPageView(),
      theme: ThemeData(splashColor: AppColors.orangeShade_2),
    );
  }
}
