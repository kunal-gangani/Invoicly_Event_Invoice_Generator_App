import 'dart:async';

import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/Views/HomePage/home_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        Flexify.goRemoveAll(
          const HomePage(),
          animation: FlexifyRouteAnimations.slideAndFade,
          duration: const Duration(
            microseconds: 150,
          ),
        );
      },
    );
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "lib/Views/SplashScreen/assets/splash.json",
        ),
      ),
    );
  }
}
