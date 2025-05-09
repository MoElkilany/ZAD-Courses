import 'package:equatable/equatable.dart';

class StudentAttachment extends Equatable {
  final String url;
  final String name;

  const StudentAttachment({
    required this.url,
    required this.name,
  });

  @override
  List<Object?> get props => [url, name];
}
