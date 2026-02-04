extension DateExt on DateTime {
  String get shortDotted {
    return '${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.$year';
  }

  static DateTime dateTimeFromShortDottedFormat(String format) {
    final parts = format.split('.');
    if (parts.length != 3) throw FormatException('Invalid format');
    return DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
  }
}