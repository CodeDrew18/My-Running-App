import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:fitnessrun/dashboard/homepage_screen.dart';
import 'package:flutter/material.dart';

class SplashscreenScreen extends StatelessWidget {
  const SplashscreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: 'assets/splashscreen_icon.gif',
      gifWidth: 269,
      gifHeight: 474,
      nextScreen: MainScreen(),
      duration: Duration(milliseconds: 3515),
      backgroundColor: Colors.greenAccent,
    );
  }
}
