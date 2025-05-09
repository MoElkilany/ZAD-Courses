import 'purchase.dart';

class FavouritedCourse extends PurchasedCourse {
  final bool isPurchased;
  final String? purchaseLink;
  final int instructorId;

  //constructor
  const FavouritedCourse({
    required this.isPurchased,
    required this.purchaseLink,
    required this.instructorId,
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
  });

  // props override
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
        isPurchased,
      ];
}
