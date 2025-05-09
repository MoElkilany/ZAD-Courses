import '../../domain/entities/topic.dart';
import '../../../common/data/models/json/translation_model.dart';

class TopicModel extends Topic {
  TopicModel({
    required super.translations,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      translations: (json['translations'] as List).cast().asMap().map(
            (_, v) => MapEntry(
              v['locale'],
              TranslationModel.fromJson(v),
            ),
          ),
    );
  }
}
