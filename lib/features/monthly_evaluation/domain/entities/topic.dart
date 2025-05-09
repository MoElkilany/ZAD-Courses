import '../../../common/domain/entities/translation.dart';

class Topic {
  final Map<String, Translation> translations;

  Topic({required this.translations});
  String getName(String locale) {
    if (translations.containsKey(locale)) {
      return translations[locale]!.name;
    } else {
      return translations.entries.first.value.name;
    }
  }
}
