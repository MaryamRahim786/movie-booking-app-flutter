import 'package:intl/intl.dart';

String formatDateddMMMyyyy(String date) {
  if (date.isEmpty) {
    return '';
  }
  final formattedDate = DateFormat('dd MMM yyyy').format(DateTime.parse(date));
  return formattedDate;
}

String convertTimestampToFormattedString(String? dateTimeString) {
  if (dateTimeString == null) {
    return '';
  }

  DateTime dateTime = DateTime.parse(dateTimeString);

  String formattedDate = DateFormat('MMM dd, yyyy HH:mm').format(dateTime);

  String result = formattedDate;

  return result;
}

String formatTime(String? dateTimeString) {
  if (dateTimeString == null) {
    return '';
  }

  DateTime dateTime = DateTime.parse(dateTimeString);

  String formattedDate = DateFormat('HH:mm a').format(dateTime);

  String result = formattedDate;

  return result;
}


String formatTimeStringTOAMPM(String timeString) {
  try {
    // Handle empty or null input
    if (timeString.isEmpty) return 'Invalid time';

    // Split the time string into components
    final parts = timeString.split(':');
    if (parts.length < 2) return 'Invalid format';

    // Parse hours and minutes
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;

    // Validate time ranges
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
      return 'Invalid time';
    }

    // Format to 12-hour time with AM/PM
    final period = hour < 12 ? 'AM' : 'PM';
    final twelveHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    final minuteStr = minute.toString().padLeft(2, '0');

    return '$twelveHour:$minuteStr $period';
  } catch (e) {
    return 'Invalid time';
  }
}

// [ 2025-06-27 00:00:00.000 date time into formatted string DD, MMMM YYYY ]
String formatDateTimeToDDMMYY(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  if (date.year == today.year &&
      date.month == today.month &&
      date.day == today.day) {
    return 'Today';
  } else {
    return DateFormat('EEE, MMM d').format(date);
  }
}

