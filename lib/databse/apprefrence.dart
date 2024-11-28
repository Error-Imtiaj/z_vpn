import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
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

  static List<VpnInfo> get vpnList {
    List<VpnInfo> templist = [];
    final data = jsonDecode(boxOfData.get("vpnList") ?? '[]');

    for (var da in data) {
      templist.add(VpnInfo.fromJson(da));
    }
    return templist;
  }
}
