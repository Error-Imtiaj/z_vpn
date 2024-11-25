import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_vpn/Ui/screens/splash_screen.dart';

class VpnApp extends StatefulWidget {
  const VpnApp({super.key});
  // CREATE A GLOBAL NAVIGATOR KEY
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<VpnApp> createState() => _VpnAppState();
}

class _VpnAppState extends State<VpnApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: VpnApp.navigatorKey,
      initialRoute: SplashScreen.text,
      routes: {
        SplashScreen.text: (context) => const SplashScreen(),
      },
    );
  }
}
