extension SubstringExtension on String {
  /// Returns a substring from [start] to [end] (non-inclusive),
  /// but safely avoids `RangeError`.
  /// If [end] is beyond the length, it will use the string's length.
  /// If [start] is greater than the string's length, returns an empty string.
  String substringSafe(int start, [int? end]) {
    if (isEmpty || start >= length) return '';

    final safeEnd = (end == null || end > length) ? length : end;
    final result = substring(start, safeEnd);

    // Add ellipsis only if the string was actually truncated
    return (safeEnd < length) ? '$result...' : result;
  }
}
