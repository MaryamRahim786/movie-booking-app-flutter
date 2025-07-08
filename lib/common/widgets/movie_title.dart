import 'package:flutter/material.dart';
import 'package:movies_booking_app/common/extensions/substring_string.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  final int subString;
  final double textSize;
  final Color? color;

  const MovieTitle({
    super.key,
    required this.title,
    required this.subString,
    this.textSize = 16, // Default value set here
    this.color , // Default value set here
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AppText(
        text: title.substringSafe(0, subString),
        color:color?? R.colors.white_FFFFFF,
        fontSize: textSize ,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
