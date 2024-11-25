import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_vpn/vpn_app.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const VpnApp());
}
