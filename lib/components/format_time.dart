String formatTime(DateTime? date) {
  int hour = date!.hour;
  int formattedHour = hour > 12 ? hour - 12 : hour;
  String period = hour >= 12 ? 'PM' : 'AM';

  return '$formattedHour:${date.minute.toString().padLeft(2, '0')} $period';
}
