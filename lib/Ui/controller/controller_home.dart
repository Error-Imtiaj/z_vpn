import 'dart:convert';

import 'package:get/get.dart';
import 'package:z_vpn/databse/apprefrence.dart';
import 'package:z_vpn/models/vpn_configuration.dart';
import 'package:z_vpn/models/vpn_info.dart';
import 'package:z_vpn/vpnEngine/vpn_engine.dart';

class ControllerHome extends GetxController {
  final Rx<VpnInfo> vpnInfo = Apprefrence.VpnInfoObj.obs;

  final vpnConnectionState = VpnEngine.vpnDisconnectedNow.obs;

  void connectToVpnNow() async {
    if (vpnInfo.value.base64OpenVpnConfiguration.isEmpty) {
      Get.snackbar(
          "Contry / Location", "Please select country or location first.");
      return;
    }
    if (vpnConnectionState.value == VpnEngine.vpnConnectedNow) {
      final dataConfigVpn =
          Base64Decoder().convert(vpnInfo.value.base64OpenVpnConfiguration);
      final configuration = Utf8Decoder().convert(dataConfigVpn);
      final vpnConfiguration = VpnConfiguration(
        username: "vpn",
        password: "vpn",
        countryName: vpnInfo.value.countryLongName,
        config: configuration,
      );

      await VpnEngine.startVpn(vpnConfiguration);
    } else {
      await VpnEngine.stopNow();
    }
  }

  String get getRoundButtonContext {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return " Tap to Connect";
      case VpnEngine.vpnConnectedNow:
        return "Disconnect";
      default:
        return "Connecting";
    }
  }
}
