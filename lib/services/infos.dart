import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kyonggi_project/models/infos.dart';

Future<WeatherData> fetchWeatherData({
  required int month,
  required int day,
  required int hour,
  required int minute,
  required int carCount,
  required double temperature,
  required double humidity,
  required double nox,
  required double sox,
  required double exTemperature,
  required double exHumidity,
  required double exNox,
  required double exSox,
}) async {
  final response = await http.post(
    Uri.parse('https://your-api-endpoint'),
    body: jsonEncode({
      'month': month,
      'day': day,
      'hour': hour,
      'minute': minute,
      'carCount': carCount,
      'temperature': temperature,
      'humidity': humidity,
      'nox': nox,
      'sox': sox,
      'externalTemperature': exTemperature,
      'externalHumidity': exHumidity,
      'externalNox': exNox,
      'externalSox': exSox,
    }),
  );

  if (response.statusCode == 200) {
    return WeatherData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch weather data: ${response.statusCode}');
  }
}
