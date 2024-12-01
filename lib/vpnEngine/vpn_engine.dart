import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:z_vpn/models/vpn_configuration.dart';
import 'package:z_vpn/models/vpn_status.dart';

class VpnEngine {
  // NATIVE CHANNEL
  static final String eventChannelVpnStage = "vpnStage";
  static final String eventChannelVpnStatus = "vpnStatus";
  static final String methodChannelVpnControl = "vpnControl";

  // VPN CONNECTION STAGE SNAPSHOT
  static Stream<String> snapshopVpnStage() =>
      EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

  // VPN CONNECTION STATIUS SNAPSHOT
  static Stream<VpnStatus?> snapshotVpnStatus() =>
      EventChannel(eventChannelVpnStatus)
          .receiveBroadcastStream()
          .map((evenStatus) => VpnStatus.fromJson(jsonDecode(evenStatus)))
          .cast();
  // START VPN METHOD
  static Future<void> startVpn(VpnConfiguration vpnConfiguration) async {
    return MethodChannel(methodChannelVpnControl).invokeMethod(
      "Start",
      {
        "config": vpnConfiguration.config,
        "country": vpnConfiguration.countryName,
        "username": vpnConfiguration.username,
        "password": vpnConfiguration.password,
      },
    );
  }

  // STOP VPN NOW
  static Future<void> stopNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("Stop");
  }

  // KILL SWITCH
  static Future<void> killSwitchOpenNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("kill_switch");
  }

  // REFRESH STAGE
  static Future<void> refreshStage() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("refresh");
  }

  // GET STAGE
  static Future<String?> getStageNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod("stage");
  }

  // CONNECT STAGE
  static Future<bool> isConnectedNow() {
    return getStageNow()
        .then((valueStage) => valueStage!.toString() == "connected");
  }

  // STAGE OF VPN CONNECTION
  static const vpnConnectedNow = "connected";
  static const vpnDisconnectedNow = "disconnected";
  static const String vpnWaitConnectionNow = "wait_connection";
  static const String vpnAuthenticatingNow = "authenticating";
  static const String vpnReconnectNow = "reconnect";
  static const vpnNoConnectionNow = "no_connection";
  static const vpnConnectingNow = "connecting";
  static const vpnPrepareNow = "prepare";
  static const vpnDeniedNow = "denied";
}
