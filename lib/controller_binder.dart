import 'package:get/get.dart';
import 'package:z_vpn/Ui/controller/splash_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
