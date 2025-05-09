import 'package:equatable/equatable.dart';

class PlatformTicket extends Equatable {
  final int id;
  final String title;
  final DateTime? updatedAt;
  final String department;
  final String status;

  const PlatformTicket({
    required this.id,
    required this.title,
    this.updatedAt,
    required this.department,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        updatedAt,
        department,
        status,
      ];
}
