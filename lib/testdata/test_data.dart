import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Parking Data')),
        body: const ParkingDataWidget(),
      ),
    );
  }
}

// Dummy data model
class ParkingData {
  final int month;
  final int day;
  final int hour;
  final int minute;
  final double temperature;
  final double humidity;
  final double nox;
  final double sox;
  final int vehicleCount;

  ParkingData({
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.temperature,
    required this.humidity,
    required this.nox,
    required this.sox,
    required this.vehicleCount,
  });
}

// Example data list
final List<ParkingData> parkingDataList = [
  ParkingData(
    month: 3,
    day: 7,
    hour: 0,
    minute: 0,
    temperature: 3.3,
    humidity: 48.4,
    nox: 0.038,
    sox: 0.019,
    vehicleCount: 92,
  ),
  ParkingData(
    month: 2,
    day: 7,
    hour: 0,
    minute: 0,
    temperature: 3.3,
    humidity: 48.4,
    nox: 0.038,
    sox: 0.019,
    vehicleCount: 92,
  ),
  ParkingData(
    month: 1,
    day: 7,
    hour: 0,
    minute: 0,
    temperature: 3.3,
    humidity: 48.4,
    nox: 0.038,
    sox: 0.019,
    vehicleCount: 92,
  ),
  ParkingData(
    month: 4,
    day: 7,
    hour: 0,
    minute: 0,
    temperature: 3.3,
    humidity: 48.4,
    nox: 0.038,
    sox: 0.019,
    vehicleCount: 92,
  ),
  ParkingData(
    month: 3,
    day: 7,
    hour: 0,
    minute: 0,
    temperature: 3.3,
    humidity: 48.4,
    nox: 0.038,
    sox: 0.019,
    vehicleCount: 92,
  ),
];

class ParkingDataWidget extends StatelessWidget {
  const ParkingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: parkingDataList.length,
      itemBuilder: (context, index) {
        var data = parkingDataList[index];
        return Container(
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.white : Colors.grey[300],
            border: const Border(
              top: BorderSide(width: 1.0, color: Colors.black26),
              bottom: BorderSide(width: 1.0, color: Colors.black26),
            ),
          ),
          child: ListTile(
            title: Text(
                'Date: ${data.month}/${data.day} at ${data.hour}:${data.minute}'),
            subtitle: Text(
                'Temp: ${data.temperature}°C, Humidity: ${data.humidity}%, NOx: ${data.nox}, SOx: ${data.sox}'),
            trailing: Text('Vehicles: ${data.vehicleCount}'),
          ),
        );
      },
    );
  }
}
