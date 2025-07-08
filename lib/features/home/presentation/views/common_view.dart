import 'package:flutter/material.dart';
import 'package:movies_booking_app/common/extensions/capitalize_string.dart';
import 'package:movies_booking_app/common/widgets/app_text.dart';

class CommonView extends StatelessWidget {
  final String view;

  const CommonView({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: view.capitalize ,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        textAlign: TextAlign.center,
      ),
    );
  }
}
