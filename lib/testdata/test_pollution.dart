import 'dart:math';

import 'package:kyonggi_project/LineChartData/pollution_line_chart.dart';

List<PollutionData> generateDummyData() {
  const int numDataPoints = 50; // 50 묶음의 데이터
  List<PollutionData> data = [];
  Random random = Random();

  for (int i = 0; i < numDataPoints; i++) {
    int year = 2024; // 현재 연도 사용
    int month = random.nextInt(12) + 1; // 1 ~ 12월 범위
    int day = random.nextInt(month == 2 ? 28 : DateTime(year, month, 1).day) +
        1; // 날짜
    int hour = random.nextInt(24); // 0 ~ 23시간
    int minute = random.nextInt(60); // 0 ~ 59분
    double soxConcentration =
        random.nextDouble() * 100 + 1; // 1 ~ 100 사이의 SOx 농도
    double noxConcentration =
        random.nextDouble() * 100 + 1; // 1 ~ 100 사이의 NOx 농도

    data.add(PollutionData(
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      soxConcentration: soxConcentration,
      noxConcentration: noxConcentration,
    ));
  }

  return data;
}
