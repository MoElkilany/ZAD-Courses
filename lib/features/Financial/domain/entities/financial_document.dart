import 'package:equatable/equatable.dart';

class FinDoc extends Equatable {
  final String title;
  final String course;
  final String description;
  final double amount;
  final String creator;
  final DateTime createdAt;

  const FinDoc({
    required this.title,
    required this.course,
    required this.description,
    required this.amount,
    required this.creator,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        title,
        course,
        description,
        amount,
        creator,
        createdAt,
      ];
}
