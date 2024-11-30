import 'package:get/get.dart';
import 'package:z_vpn/databse/apprefrence.dart';
import 'package:z_vpn/models/vpn_info.dart';

class ControllerHome extends GetxController {
  final Rx<VpnInfo> vpnInfo = Apprefrence.VpnInfoObj.obs;

  
}
