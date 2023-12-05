import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


import 'login.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        centered: true,
        duration: 3000,
        splashIconSize: double.maxFinite,
        splash: Container(
          height:MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/GTPodcastSplash.gif"),
                fit: BoxFit.fill),
          ),
        ),
        nextScreen: const Login(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
