import 'package:dartz/dartz.dart';
import '../../domain/entities/new_ticket_options.dart';

class NewTicketOptionsModel extends NewTicketOptions {
  const NewTicketOptionsModel({
    required super.courses,
    required super.departments,
    required super.roles,
  });

  factory NewTicketOptionsModel.fromJson(Map<String, dynamic> json) {
    return NewTicketOptionsModel(
      courses: json['courses'] == null
          ? []
          : json['courses']
              .map<Tuple2<int, String>>(
                (course) => Tuple2<int, String>(
                  course['id'],
                  course['title'],
                ),
              )
              .toList(),
      departments: json['departments'] == null
          ? []
          : json['departments']
              .map<Tuple2<int, String>>(
                (department) => Tuple2<int, String>(
                  department['id'],
                  department['title'],
                ),
              )
              .toList(),
      roles: json['roles'] == null
          ? []
          : json['roles']
              .map<Tuple2<int, String>>(
                (role) => Tuple2<int, String>(
                  role['id'],
                  role['title'],
                ),
              )
              .toList(),
    );
  }
}
