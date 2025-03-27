import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime? {
  String? toFormattedString() {
    if (this == null) return null;
    return DateFormat('yyyy-MM-dd').format(this!);
  }
}
