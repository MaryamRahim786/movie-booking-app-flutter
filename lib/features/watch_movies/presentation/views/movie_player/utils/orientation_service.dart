// services/orientation_service.dart
import 'package:flutter/services.dart';

class OrientationService {
  static Future<void> setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static Future<void> setPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  static Future<void> resetOrientation() async {
    await SystemChrome.setPreferredOrientations([]);
  }
}