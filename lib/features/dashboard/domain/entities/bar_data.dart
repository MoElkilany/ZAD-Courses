import 'package:equatable/equatable.dart';

class BarData extends Equatable {
  final String name;
  final List<String> values;

  const BarData({required this.name, required this.values});

  @override
  List<Object?> get props => [name, values];
}
