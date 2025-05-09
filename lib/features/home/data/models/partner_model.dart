import '../../domain/entities/partner.dart';

class PartnerModel extends Partner {
  const PartnerModel({
    required super.imageSrc,
    required super.title,
    required super.subtitle,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(
      title: json["title"],
      subtitle: json["subtitle"],
      imageSrc: Uri.parse(
        json["image"] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subtitle": subtitle,
      "image": imageSrc.toString(),
    };
  }
}
