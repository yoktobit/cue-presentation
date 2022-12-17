class SeparatedDate {
  final int day;
  final int month;
  final int year;

  SeparatedDate({
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  String toString() {
    return DateTime(year, month, day).toString();
  }
}
