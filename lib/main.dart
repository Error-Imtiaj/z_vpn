import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_vpn/databse/apprefrence.dart';
import 'package:z_vpn/vpn_app.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();

  // INIT HIVE
  await Apprefrence.initHive();

  // RUN APP 
  runApp( VpnApp());
}
