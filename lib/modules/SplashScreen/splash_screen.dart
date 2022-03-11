import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/layout/home_layout.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash.png',
      nextScreen: HomeLayOut(),
      duration: 3000,
      animationDuration: Duration(milliseconds: 250),
      backgroundColor: Colors.black,
      splashTransition: SplashTransition.rotationTransition,
      splashIconSize: 250.0,
    );
  }
}

