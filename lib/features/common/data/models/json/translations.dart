import '../../../domain/entities/translations.dart';
import 'translation_model.dart';

class TranslationsModel extends Translations {
  TranslationsModel({required super.translations});
  factory TranslationsModel.fromJson(List translations) {
    return TranslationsModel(
      translations: translations.cast().asMap().map(
            (_, v) => MapEntry(
              v['locale'],
              TranslationModel.fromJson(v),
            ),
          ),
    );
  }
}
