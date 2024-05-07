import 'package:flutter/material.dart';
import 'package:kyonggi_project/models/miocro_dust_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class No2 extends StatefulWidget {
  const No2({super.key});

  @override
  State<No2> createState() => _No2State();
}

class _No2State extends State<No2> {
  Future<String>? _no2Future;

  @override
  void initState() {
    super.initState();
    _no2Future = fetchMicroDustService();
  }

  Future<String> fetchMicroDustService() async {
    final response = await http
        .get(Uri.parse('http://localhost:8080/weather/airQuality/forecast'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final miocroDustService = MicroDustService.fromJson(data);
      return miocroDustService.no2; // 직접 습도 값을 반환합니다.
    } else {
      // 에러 처리
      print('Failed to load weather data');
      throw Exception('Failed to load weather data'); // 에러를 던집니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _no2Future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text(
            'error',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          );
        } else {
          // 데이터 로딩 성공
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${snapshot.data}%'), // snapshot.data는 int 타입의 습도 값입니다.
            ],
          );
        }
      },
    );
  }
}
