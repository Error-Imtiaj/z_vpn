import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:z_vpn/Ui/controller/splash_screen_controller.dart';
import 'package:z_vpn/Ui/utils/urls.dart';

class SplashScreen extends StatefulWidget {
  static const String text = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashController = Get.find<SplashScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashController.navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              Urls.splahAnimationUrl,
              width: 150.w,
              height: 150.h,
            ),
          ),
        ],
      ),
    );
  }
}
