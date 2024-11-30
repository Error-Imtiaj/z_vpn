import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_vpn/models/vpn_info.dart';

class Apprefrence {
  static late Box boxOfData;

  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox('data');
  }

  // SAVING SINGLE SELECTED VPN\
  // GET VPN INFO
  static VpnInfo get VpnInfoObj =>
      VpnInfo.fromJson(boxOfData.get("vpn") ?? '{}');
  // SET VPN INFO
  static set setVpnInfo(VpnInfo value) =>
      boxOfData.put("vpn", jsonEncode(value));

  //? GET LIST OF VPN
  static List<VpnInfo> get vpnList {
    List<VpnInfo> templist = [];
    final dataVpn = jsonDecode(boxOfData.get("vpnList") ?? '[]');

    for (var data in dataVpn) {
      templist.add(VpnInfo.fromJson(data));
    }
    return templist;
  }

  //? SET VPN LIST
  static Future<void> saveVpnList(List<VpnInfo> valueList) async {
    final jsonList = jsonEncode(valueList);
    await boxOfData.put("vpnList", jsonList);
  }
}
