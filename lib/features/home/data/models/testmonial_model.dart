import '../../domain/entities/testmonial.dart';

class TestmonialModel extends Testmonial {
  const TestmonialModel({
    required super.title,
    required super.rating,
    required super.comment,
    required super.imageSrc,
  });

  factory TestmonialModel.fromJson(Map<String, dynamic> json) {
    return TestmonialModel(
      title: json["title"],
      comment: json["comment"],
      imageSrc: Uri.parse(json["image"] as String),
      rating: (json["rating"] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'rating': rating,
      'comment': comment,
      'image': imageSrc.toString(),
    };
  }
}
