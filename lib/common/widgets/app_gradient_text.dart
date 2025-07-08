import 'package:movies_booking_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const AppGradientText({
    required this.text,
    super.key,
    this.fontSize = 38,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          R.colors.blue_45C6EE,
          R.colors.navyBlue_00478B,
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
