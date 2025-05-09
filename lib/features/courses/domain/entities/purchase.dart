import 'package:equatable/equatable.dart';
import 'course.dart';

class PurchasedCourse extends Equatable {
  final int id;
  final Course? courseContents;
  final String? purchaseDate;
  final String? expireDate;
  final String classType;
  final String yearType;
  final String schoolType;
  final bool isFavorite;
  final String classTitle;
  final String classYear;
  final double rating;
  final String instructorName;
  final DateTime startDate;
  final String durationPerSession;
  final String? imageUrl;

  const PurchasedCourse({
    required this.courseContents,
    required this.purchaseDate,
    required this.expireDate,
    required this.classType,
    required this.yearType,
    required this.schoolType,
    required this.isFavorite,
    required this.classTitle,
    required this.classYear,
    required this.rating,
    required this.instructorName,
    required this.startDate,
    required this.durationPerSession,
    required this.imageUrl,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
        courseContents,
        purchaseDate,
        expireDate,
        classType,
        yearType,
        schoolType,
        isFavorite,
        classTitle,
        classYear,
        rating,
        instructorName,
        startDate,
        durationPerSession,
        imageUrl,
      ];

  //copyWith method
  PurchasedCourse copyWith({
    int? id,
    required Course? courseContents,
    required String? purchaseDate,
    required String? expireDate,
    String? classType,
    String? yearType,
    String? schoolType,
    bool? isFavorite,
    String? classTitle,
    String? classYear,
    double? rating,
    String? instructorName,
    DateTime? startDate,
    String? durationPerSession,
    required String? imageUrl,
  }) {
    return PurchasedCourse(
      id: id ?? this.id,
      courseContents: courseContents ?? this.courseContents,
      purchaseDate: purchaseDate,
      expireDate: expireDate ?? this.expireDate,
      classType: classType ?? this.classType,
      yearType: yearType ?? this.yearType,
      schoolType: schoolType ?? this.schoolType,
      isFavorite: isFavorite ?? this.isFavorite,
      classTitle: classTitle ?? this.classTitle,
      classYear: classYear ?? this.classYear,
      rating: rating ?? this.rating,
      instructorName: instructorName ?? this.instructorName,
      startDate: startDate ?? this.startDate,
      durationPerSession: durationPerSession ?? this.durationPerSession,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
