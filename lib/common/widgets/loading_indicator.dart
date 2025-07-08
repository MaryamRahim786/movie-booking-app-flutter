import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class LoadingIndicator extends StatelessWidget {
  final double? progress;
  final double? height;
  final double? width;

  const LoadingIndicator({super.key, this.progress, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height:height?? 24.h,
        width:width?? 20.w,
        child: CircularProgressIndicator(
          value: progress,
          color: R.colors.purple_202C43,
        ),
      ),
    );
  }
}
