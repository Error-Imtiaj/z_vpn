import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:z_vpn/Ui/utils/colors.dart';
import 'package:z_vpn/Ui/widgets/speed_meter_widget.dart';

class HomeScreen extends StatefulWidget {
  static const text = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isConnected = false;

  void sis() {
    setState(() {
      isConnected = !isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Z VPN ",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: ColorsUtil.whiteTextColor),
        ),
        backgroundColor: ColorsUtil.buttonBackgroundActive,
      ),
      backgroundColor: ColorsUtil.appBackgroundColor,
      body: Column(
        children: [
          // CONNECTION CIRCLE
          Gap(60.h),
          _conncetionCircle(),
          // UNCLICKABLE CONEECT DISCONNECT BUTTON
          Gap(20.h),
          _unclickableButton(),
          // SPEED METER
          Gap(20.h),
          _speedMeter(),
          // SERVER CHANGE BUTTON
          Spacer(),
          _serverChangeButton(),
        ],
      ),
    );
  }

  // TAP TO CONNECTION CIRCLE
  Widget _conncetionCircle() {
    return GestureDetector(
      onTap: sis,
      child: Center(
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isConnected
                  ? ColorsUtil.primaryActiveColorShade
                  : ColorsUtil.primaryColor,
            ),
            width: 200.w,
            height: 200.h,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isConnected
                  ? ColorsUtil.primaryActiveColor
                  : Colors.deepOrange,
            ),
            width: 175.w,
            height: 175.h,
          ),
          Text(
            textAlign: TextAlign.center,
            isConnected ? "Tap to \nDisconnect" : "Tap to \nconnect",
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsUtil.whiteTextColor),
          ),
        ]),
      ),
    );
  }

  // CONNECT DISCONNECT BUTTON
  Widget _unclickableButton() {
    return Container(
      width: ScreenUtil.defaultSize.width,
      height: 50.h,
      decoration: BoxDecoration(
          color: ColorsUtil.buttonBackgroundActive,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.lightGreen.shade200,
              offset: const Offset(5, 5),
            ),
          ]),
      child: Center(
        child: Text(
          isConnected ? "Connected" : "Disconnected",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsUtil.whiteTextColor,
          ),
        ),
      ),
    );
  }

  // SPEED METER SECTION
  Widget _speedMeter() {
    return Column(
      children: [
        Text(
          "Speed",
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: ColorsUtil.geryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10.h),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpeedMeterWidget(
                subTitle: "Download Speed",
                mbps: 20.4,
                meterIcon: Icons.download,
              ),
              SpeedMeterWidget(
                subTitle: "Upload Speed",
                mbps: 20.4,
                meterIcon: Icons.upload,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // SERVER CHANGE BUTTON
  Widget _serverChangeButton() {
    return Container(
      color: ColorsUtil.buttonBackgroundActive,
      width: double.infinity,
      child: ListTile(
        title: Text(
          "Change the server",
          style: GoogleFonts.poppins(color: ColorsUtil.whiteTextColor),
        ),
        trailing: Icon(
          Icons.arrow_circle_right_rounded,
          color: ColorsUtil.whiteTextColor,
          size: 28,
        ),
        onTap: () => print("Hello "),
      ),
    );
  }
}
