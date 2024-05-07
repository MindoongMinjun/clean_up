import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:kyonggi_project/testdata/test_data.dart';
import 'package:kyonggi_project/widgets/bottom_nav_bar.dart';
import 'package:kyonggi_project/widgets/box.dart';
// ignore: unused_import
import 'package:charts_flutter/flutter.dart' as charts;
// ignore: unused_import
import 'package:kyonggi_project/LineChartData/pollution_line_chart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isAmPm1 = false;
  bool isAmPm2 = false;
  late int month;
  late int day;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      setState(() {});
    }
  }

  void _makeAPIRequest(bool isAmPm1, int month, int day) async {
    // API 요청 URL 및 파라미터 설정
    String url = "http://localhost:8080/parkinglot/info";
    Map<String, dynamic> body = {
      "isPm": isAmPm1,
      "month": month,
      "day": day,
    };
    // API 요청 보내기
    try {
      Response response = await Dio().post(url, data: body);
      if (response.statusCode == 200) {
        // API 요청 성공 처리
        print("API 요청 성공: ${response.data}");
      } else {
        // API 요청 실패 처리
        print("API 요청 실패: ${response.statusCode}");
      }
    } catch (error) {
      // API 요청 오류 처리
      print("API 요청 오류: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('나의 위치', style: TextStyle(fontSize: 28)),
                      Text('성남시', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _selectDate(context).then((context) {
                              setState(() {
                                month = selectedDate.month;
                                day = selectedDate.day;
                              });
                            }).then((context) {
                              _makeAPIRequest(isAmPm1, selectedDate.month,
                                  selectedDate.day);
                            });
                          },
                          child: const Text('Select Date'),
                        ),
                      ],
                    ),
                  ),
                  Box(
                    width: width,
                    height: height * 0.2,
                    widget: const ParkingDataWidget(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Box(
                    width: width,
                    height: height * 0.5,
                    widget: Container(),
                  ),
                  // Box(
                  //   widget: PollutionLineChart(),
                  //   height: height * 0.35,
                  //   width: width,
                  // )
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}
