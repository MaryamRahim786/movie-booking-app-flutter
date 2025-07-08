import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only( bottom: 24.h),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 180.h,
                    color: Colors.white,
                  ),
                  8.hb,
                  Container(
                    width: 100.w,
                    height: 12.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return 20.hb;
        },
        itemCount: 10,
      ),
    );
  }
}
