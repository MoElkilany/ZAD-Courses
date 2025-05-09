import 'package:equatable/equatable.dart';

class Notice extends Equatable {
  final int id;
  final String title;
  final String? course;
  final String type;
  final String sender;
  final DateTime? date;
  final String message;

  const Notice({
    required this.id,
    required this.title,
    this.course,
    required this.type,
    required this.sender,
    this.date,
    required this.message,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        course,
        type,
        sender,
        date,
        message,
      ];
}
