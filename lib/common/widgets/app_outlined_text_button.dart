import 'package:movies_booking_app/common/widgets/app_gradient_text.dart';
import 'package:movies_booking_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppOutlinedTextButton extends StatelessWidget {
  const AppOutlinedTextButton({
    required this.text,
    required this.onTap,
    super.key,
    this.width,
    this.height,
    this.color,
    this.isGradient = true,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color? color;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w ?? 293.w,
      height: height?.w ?? 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              color ?? R.colors.blue_45C6EE,
              color ?? R.colors.navyBlue_00478B,
            ],
          ),
        ),
      ),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(R.colors.white_FFFFFF),
          side: WidgetStateProperty.all(BorderSide.none),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        onPressed: onTap,
        child: isGradient
            ? AppGradientText(
                text: text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              )
            : Text(
                text,
                style: TextStyle(
                  color: color ?? R.colors.navyBlue_00478B,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
