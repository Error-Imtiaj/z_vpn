import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:z_vpn/Ui/utils/colors.dart';

class SpeedMeterWidget extends StatefulWidget {
  final String subTitle;
  final double mbps;
  final IconData meterIcon;
  const SpeedMeterWidget({
    super.key,
    required this.subTitle,
    required this.mbps,
    required this.meterIcon,
  });

  @override
  State<SpeedMeterWidget> createState() => _SpeedMeterWidgetState();
}

class _SpeedMeterWidgetState extends State<SpeedMeterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          widget.meterIcon,
          size: 35.sp,
          color: ColorsUtil.geryTextColor,
        ),
        Text(
          "${widget.mbps} mbps",
          style: GoogleFonts.poppins(),
        ),
        Text(
          widget.subTitle,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: ColorsUtil.geryTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
