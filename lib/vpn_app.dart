import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:z_vpn/Ui/screens/home_screen.dart';
import 'package:z_vpn/Ui/screens/splash_screen.dart';
import 'package:z_vpn/controller_binder.dart';

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
    return ScreenUtilInit(
      // minTextAdapt: true,
      // splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: VpnApp.navigatorKey,
          initialRoute: SplashScreen.text,
          initialBinding: ControllerBinder(),
          routes: routes,
        );
      },
    );
  }

  // NAVIGATION ROUTES
  Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.text: (context) => const SplashScreen(),
    HomeScreen.text: (context) => const HomeScreen(),
  };
}
