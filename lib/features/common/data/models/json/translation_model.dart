import '../../../domain/entities/translation.dart';

class TranslationModel extends Translation {
  TranslationModel({
    required super.name,
    required super.description,
  });

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      name: json['title'],
      description: json['translations'],
    );
  }
}
