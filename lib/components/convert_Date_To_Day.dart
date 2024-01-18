import 'package:intl/intl.dart';

String getDayFromDate(String dateString) {
  try {
    DateTime date = DateFormat('yyyy-MM-dd').parse(dateString);
    String day = DateFormat('EEEE').format(date);
    return day;
  } catch (e) {
    return 'Invalid Date';
  }
}
