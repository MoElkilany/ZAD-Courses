import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class NewNoticeOptions extends Equatable {
  final List<Tuple2<int, String>> courses;

  const NewNoticeOptions({
    required this.courses,
  });

  @override
  List<Object?> get props => [courses];
}
