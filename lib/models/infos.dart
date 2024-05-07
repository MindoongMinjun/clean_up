class WeatherData {
  int month;
  int day;
  int hour;
  int minute;
  int carCount;
  double temperature;
  double humidity;
  double nox;
  double sox;

  double exTemperature;
  double exHumidity;
  double exNox;
  double exSox;

  WeatherData({
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.carCount,
    required this.temperature,
    required this.humidity,
    required this.nox,
    required this.sox,
    required this.exTemperature,
    required this.exHumidity,
    required this.exNox,
    required this.exSox,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      month: json['month'] as int,
      day: json['day'] as int,
      hour: json['hour'] as int,
      minute: json['minute'] as int,
      carCount: json['carCount'] as int,
      temperature: json['temperature'] as double,
      humidity: json['humidity'] as double,
      nox: json['nox'] as double,
      sox: json['sox'] as double,
      exTemperature: json['exTemperature'] as double,
      exHumidity: json['exHumidity'] as double,
      exNox: json['exNox'] as double,
      exSox: json['exSox'] as double,
    );
  }
}
