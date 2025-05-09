import '../../domain/entities/bar_data.dart';

class BarDataModel extends BarData {
  const BarDataModel({
    required super.name,
    required super.values,
  });

  factory BarDataModel.fromJson(Map<String, dynamic> json) {
    final List<String> data = [];
    for (var item in json['data']) {
      //if not string, convert to string
      if (item is String) {
        data.add(item);
      } else {
        data.add(item.toString());
      }
    }
    return BarDataModel(
      name: json['name'],
      values: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
    };
  }
}
