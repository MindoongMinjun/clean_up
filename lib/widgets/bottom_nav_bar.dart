import 'package:flutter/material.dart';
import 'package:kyonggi_project/LineChartData/pollution_line_chart.dart';
import 'package:kyonggi_project/services/temperature.dart';
import 'package:kyonggi_project/widgets/box.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  double bottomNavbarHeight = 50;
  bool isActivated = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200), // 애니메이션의 길이 설정
      height: bottomNavbarHeight, // 애니메이션의 높이 설정
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  bottomNavbarHeight =
                      bottomNavbarHeight == 50 ? height * 0.8 : 50;
                  isActivated = !isActivated;
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(35),
              ),
              height: 8,
              width: 100,
            ),
          ),
          isActivated
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DatePickerDialog(
                                      firstDate: DateTime(2024, 1, 1),
                                      lastDate: DateTime(2024, 1, 1),
                                    );
                                  });
                            },
                            child: const Text('Select Date'),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                            },
                            child: const Text('Select Time'),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Box(
                            width: width * 0.16,
                            height: height * 0.08,
                            widget: const Temperature(),
                          ),
                          Box(
                            width: width * 0.16,
                            height: height * 0.08,
                            widget: const Temperature(),
                          ),
                          Box(
                            width: width * 0.16,
                            height: height * 0.08,
                            widget: const Temperature(),
                          ),
                          Box(
                            width: width * 0.16,
                            height: height * 0.08,
                            widget: const Temperature(),
                          ),
                          Box(
                            width: width * 0.16,
                            height: height * 0.08,
                            widget: const Temperature(),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Box(
                        widget: Container(),
                        height: height * 0.35,
                        width: width,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
