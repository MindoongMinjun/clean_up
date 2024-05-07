class MicroDustService {
  final String so2;
  final String no2;

  MicroDustService({required this.so2, required this.no2});

  factory MicroDustService.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return MicroDustService(
      so2: data['so2Value'] ?? 'null',
      no2: data['no2Value'] ?? 'null',
    );
  }
}
// {
//     "data": {
//         "so2Value": "0.002",
//         "no2Value": "0.026",
//     }
// }