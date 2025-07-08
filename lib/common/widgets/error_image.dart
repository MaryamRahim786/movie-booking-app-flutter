import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 130.w,
      child: Center(
        child: Icon(Icons.error, color: R.colors.red_FF3B30, size: 30.sp),
      ),
    );
  }
}
