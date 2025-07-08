import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class AppText extends ConsumerStatefulWidget {
  const AppText({
    required this.text,
    super.key,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.fontStyle,
    this.textDirection,
    this.textAlign,
    this.textDecoration,
    this.overflow,
    this.maxLines,
    this.decorationColor,
    this.height,
  });

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? decorationColor;
  final double? height;

  @override
  ConsumerState createState() => _AppTextState();
}

class _AppTextState extends ConsumerState<AppText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.fontSize?.sp ?? 12.sp,
        fontWeight: widget.fontWeight ?? FontWeight.w400,
        color: widget.color ?? R.colors.black_FF000000,
        fontStyle: widget.fontStyle ?? FontStyle.normal,
        decoration: widget.textDecoration ?? TextDecoration.none,
        decorationColor: widget.decorationColor,
        height: widget.height,
        fontFamily: 'Poppins',
      ),
      textAlign: widget.textAlign,
      textDirection: widget.textDirection ?? TextDirection.ltr,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
    );
  }
}
