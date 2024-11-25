import 'package:get/get.dart';
import 'package:z_vpn/Ui/screens/home_screen.dart';

class SplashScreenController extends GetxController {
  Future<void> navigateToHomePage() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Get.offNamed(HomeScreen.text);
  }
}
