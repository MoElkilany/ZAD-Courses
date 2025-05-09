import 'package:easy_localization/easy_localization.dart';

import '../../domain/entities/favourited.dart';
import 'course_model.dart';

class FavouritedCourseModel extends FavouritedCourse {
  const FavouritedCourseModel({
    required super.id,
    required super.courseContents,
    required super.purchaseDate,
    required super.expireDate,
    required super.classType,
    required super.yearType,
    required super.schoolType,
    required super.isFavorite,
    required super.classTitle,
    required super.classYear,
    required super.rating,
    required super.instructorName,
    required super.startDate,
    required super.durationPerSession,
    required super.imageUrl,
    required super.isPurchased,
    required String super.purchaseLink,
    required super.instructorId,
  });

  factory FavouritedCourseModel.fromJson(Map<String, dynamic> json) {
    return FavouritedCourseModel(
      id: json['id'],
      courseContents: null, //CourseModel.fromJson(json['courseContents']),
      //format date to string DateTime.parse(json['purchased_at'])
      //to the format dd/MM/yyyy
      purchaseDate: json['purchased_at'] == null
          ? null
          : DateFormat('dd/MM/yyyy').format(
              DateTime.parse(json['purchased_at']),
            ),

      purchaseLink: json['link'],
      //'expire_on' is in seconds since epoch, convert to DateTime then to iso string
      expireDate: json['expire_on'] == null ? null : DateTime.fromMillisecondsSinceEpoch(json['expire_on'] * 1000).toIso8601String(),
      classType: getClassTypeFromJson(json['type']),
      yearType: json['category'],
      schoolType: json['parent_category'],
      isFavorite: json['is_favorite'],
      classTitle: json['title'],
      //use the created_at date and use that year to create a string of the format
      // thatyear/thatyear+1
      classYear: '${DateTime.parse(json['created_at']).year}/'
          '${DateTime.parse(json['created_at']).year + 1}',
      //if rating is int, convert to double
      rating: double.tryParse('${json['rate']}') ?? 0,
      instructorName: json['teacher']['full_name'],
      instructorId: json['teacher']['id'],
      //'start_date' is in seconds since epoch, convert to DateTime
      startDate: DateTime.fromMillisecondsSinceEpoch(json['start_date'] * 1000),
      //duration is in Minutes, convert to format HH.MM Hrs
      durationPerSession: '${Duration(minutes: json['duration']).toString().split(':').sublist(0, 2).join('.')} ${'courses.durationHrs'.tr()}',
      imageUrl: json['image'],
      isPurchased: json['purchased_at'] != null && json['purchased_at'] != '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseContents': courseContents == null ? null : (courseContents as CourseModel).toJson(),
      'purchaseDate': purchaseDate,
      'expireDate': expireDate,
      'classType': classType,
      'yearType': yearType,
      'schoolType': schoolType,
      'isFavorite': isFavorite,
      'classTitle': classTitle,
      'classYear': classYear,
      'rating': rating,
      'instructorName': instructorName,
      'startDate': startDate.toIso8601String(),
      'durationPerSession': durationPerSession,
      'imageUrl': imageUrl,
      'isPurchased': isPurchased,
      'purchaseLink': purchaseLink,
      'instructorId': instructorId,
    };
  }
}

String getClassTypeFromJson(String json) {
  return json == 'course'
      ? 'courses.liveClass'.tr()
      : json == 'video_course'
          ? 'courses.videoCourse'.tr()
          : json == 'meeting'
              ? 'courses.meeting'.tr()
              : json == 'text_lesson'
                  ? 'courses.textLesson'.tr()
                  : 'courses.liveClass'.tr();
}
