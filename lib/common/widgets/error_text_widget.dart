import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';

class ErrorTextWidget extends StatelessWidget {
  final String e;

  const ErrorTextWidget({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Center(
          child: AppText(
        text: 'Error: $e',
        fontWeight: FontWeight.w500,
        fontSize: 14,
      )),
    );
  }
}
