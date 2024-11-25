import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:z_vpn/Ui/utils/urls.dart';

class SplashScreen extends StatefulWidget {
  static const String text = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Lottie.asset(
              Urls.splahAnimationUrl,
            ),
          ),
        ],
      ),
    );
  }
}
