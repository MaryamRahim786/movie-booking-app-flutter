import 'package:movies_booking_app/util/resources/r.dart';
import 'package:flutter/material.dart';

// Gradient extension for widgets
extension GradientWidgetExtension on Widget {
  Widget withGradient({
    BlendMode blendMode = BlendMode.srcIn,
  }) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => gradient.createShader(bounds),
      blendMode: blendMode,
      child: this,
    );
  }
}

// Gradient
LinearGradient gradient = LinearGradient(
  colors: [
    R.colors.navyBlue_00478B,
    R.colors.blue_20B4E3,
  ],
  stops: [0.0, 1.0], // Position of each color stop
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
