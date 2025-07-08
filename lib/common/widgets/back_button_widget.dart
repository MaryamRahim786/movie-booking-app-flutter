import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/gen/assets.gen.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    this.color,
    this.onTap,
    this.title,
    this.leftPadding,
    this.icon,
    this.bgColor,
    this.iconColor,
  });

  final Color? color;
  final Color? iconColor;
  final VoidCallback? onTap;
  final String? title;
  final double? leftPadding;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ?? Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
        child: Row(
          children: [
            13.wb,
            InkWell(
              onTap: () => GoRouter.of(context).pop(),
              child: Container(
                padding: EdgeInsets.all(1.r),
                decoration: BoxDecoration(
                    color: R.colors.white_FFFFFF, shape: BoxShape.circle),
                child: Assets.svgs.backButtonIcon.svg(
                  width: 30.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    R.colors.black_FF000000,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            16.wb,
            AppText(
              text: 'Watch',
              color: R.colors.white_FFFFFF,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
