import 'package:get/get.dart';
import 'package:z_vpn/databse/apprefrence.dart';
import 'package:z_vpn/models/vpn_info.dart';
import 'package:z_vpn/vpnEngine/vpn_engine.dart';

class ControllerHome extends GetxController {
  final Rx<VpnInfo> vpnInfo = Apprefrence.VpnInfoObj.obs;

  final vpnConnectionState = VpnEngine.vpnDisconnectedNow.obs;

  void connectToVpnNow(){
    if (vpnInfo.value.base64OpenVpnConfiguration.isEmpty) {
      
    }
  }
}
