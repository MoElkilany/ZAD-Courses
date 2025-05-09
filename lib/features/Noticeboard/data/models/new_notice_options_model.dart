import 'package:dartz/dartz.dart';
import '../../domain/entities/new_notice_options.dart';

class NewNoticeOptionsModel extends NewNoticeOptions {
  const NewNoticeOptionsModel({
    required super.courses,
  });

  factory NewNoticeOptionsModel.fromJson(Map<String, dynamic> json) {
    return NewNoticeOptionsModel(
      courses: json['courses'] == null
          ? []
          : json['courses']
              .map<Tuple2<int, String>>(
                (course) => Tuple2<int, String>(
                  course['id'],
                  course['translations'][0]['title'],
                ),
              )
              .toList(),
    );
  }
}
