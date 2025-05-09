import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class NewTicketOptions extends Equatable {
  final List<Tuple2<int, String>> courses;
  final List<Tuple2<int, String>> departments;
  final List<Tuple2<int, String>> roles;

  const NewTicketOptions({
    required this.courses,
    required this.departments,
    required this.roles,
  });

  @override
  List<Object?> get props => [courses, departments, roles];
}
