import 'package:flutter/material.dart';
import 'package:kyonggi_project/models/weather_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _HumidityState();
}

class _HumidityState extends State<Temperature> {
  Future<int>? _temperatureFuture;

  @override
  void initState() {
    super.initState();
    _temperatureFuture = fetchWeatherService();
  }

  Future<int> fetchWeatherService() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/weather/info'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final weatherService = WeatherService.fromJson(data);
      return weatherService.temperature; // 직접 습도 값을 반환합니다.
    } else {
      // 에러 처리
      print('Failed to load weather data');
      throw Exception('Failed to load weather data'); // 에러를 던집니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _temperatureFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text(
            'error',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          );
        } else {
          // 데이터 로딩 성공
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('온도: ${snapshot.data}%'), // snapshot.data는 int 타입의 습도 값입니다.
            ],
          );
        }
      },
    );
  }
}
