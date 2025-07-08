import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Formats the DateTime to 'yyyy-MM-dd' format (e.g., '2025-06-16')
  String toDateString() {
    return '${year.toString().padLeft(4, '0')}-'
        '${month.toString().padLeft(2, '0')}-'
        '${day.toString().padLeft(2, '0')}';
  }
}



extension DateTimeExtensions on String {


  /// Converts ISO 8601 string to a formatted date and time string.
  String get toDateTime {
    try {
      final dateTime =
      DateTime.parse(this).toLocal(); // Convert to local timezone
      return DateFormat('MMMM dd, yyyy | hh:mm:ss a').format(dateTime);
    } catch (e) {
      return 'Invalid DateTime';
    }
  }

  /// Converts ISO 8601 string to a formatted date string.
  String get toDateOnly {
    try {
      final dateTime =
      DateTime.parse(this).toLocal(); // Convert to local timezone
      return DateFormat('MMMM dd, yyyy').format(dateTime);
    } catch (e) {
      return 'Invalid DateTime';
    }
  }

  /// Converts ISO 8601 string to a formatted time string.
  String get toTimeOnly {
    try {
      final dateTime =
      DateTime.parse(this).toLocal(); // Convert to local timezone
      return DateFormat('hh:mm:ss a').format(dateTime);
    } catch (e) {
      return 'Invalid DateTime';
    }
  }

  /// Converts ISO 8601 string to a DateTime object
  String get toDateTimeObject {
    try {
      // Parse the ISO 8601 date string into a DateTime object
      DateTime dateTime = DateTime.parse(this);

      // Format the DateTime object into the desired format
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formattedDate = formatter.format(dateTime);

      return formattedDate;
    } catch (e) {
      return 'Invalid DateTime';
    }
  }



  /// Converts API datetime string to localized time format (HH:mm)
  /// Usage: `someApiTimeString.toLocalizedTime()`
  String toLocalizedTime() {
    try {
      final utcTime = DateTime.parse(this);
      final localTime = utcTime.toLocal();
      return DateFormat.Hm().format(localTime); // Uses current device locale
    } catch (e) {
      return this; // Return original string if parsing fails
    }
  }


  /// Converts a date string in format "YYYY-MM-DD" to "Month Day, Year" format
  /// Example: "2025-05-28" → "May 28, 2025"
  String toFormattedDate() {
    try {
      final parsedDate = DateTime.parse(this);
      return DateFormat('MMMM d, y').format(parsedDate);
    } catch (e) {
      // Return original string if parsing fails
      return this;
    }
  }

}


extension DistanceFormatting on double {
  /// Formats a distance in meters into a human-readable string.
  /// - Returns "X m" if distance is < 1000 meters.
  /// - Returns "Y.XX km" (rounded to 2 decimal places) if distance is ≥ 1000 meters.
  /// - Returns "Unknown" if the value is null (handled via nullable extension).
  ///
  /// Example:
  /// ```dart
  /// 500.0.formatDistance();   // "500 m"
  /// 1500.0.formatDistance();  // "1.50 km"
  /// ```
  String formatDistance() {
    if (this < 1000) {
      return "${toStringAsFixed(0)} m";
    } else {
      final kilometers = this / 1000;
      return "${kilometers.toStringAsFixed(2)} km";
    }
  }
}

/// Nullable version to handle `double?` safely.
extension NullableDistanceFormatting on double? {
  String formatDistance({String unknownText = "Unknown"}) {
    if (this == null) return unknownText;
    return this!.formatDistance();
  }
}
