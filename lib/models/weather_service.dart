class WeatherService {
  final int temperature;
  final int humidity;

  WeatherService({required this.temperature, required this.humidity});

  factory WeatherService.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return WeatherService(
      temperature: int.tryParse(data['temperature']) ?? 0,
      humidity: int.tryParse(data['humidity']) ?? 0,
    );
  }
}
