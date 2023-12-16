import 'dart:async';
import 'package:figma_project/colors.dart';
import 'package:figma_project/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoard_screen() ));
     });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeShade_1,
      body: SafeArea(child: Column(
        children: [
              Container(
                margin:const EdgeInsets.only(top: 350),
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/images/splash/Emoji.svg",
                height: 100,
                width: 100,
                ),
              ),
              Container(
                height: 90,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 30),
                child: Image.asset("assets/images/splash/signature.png",
                height: 200,
                width: 280,
                ),
              )
        ],
      ))
    );
  }
}