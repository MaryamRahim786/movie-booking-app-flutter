import 'package:flutter/material.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class AppDividerWidget extends StatelessWidget {
  final Color? color;
  final double? thickness;

  const AppDividerWidget({super.key, this.color, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: color ?? R.colors.grey_EAF0FF, thickness: thickness ?? 1);
  }
}
