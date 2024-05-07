class PollutionData {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final double soxConcentration;
  final double noxConcentration;

  PollutionData(
      {required this.year,
      required this.month,
      required this.day,
      required this.hour,
      required this.minute,
      required this.soxConcentration,
      required this.noxConcentration});
}
