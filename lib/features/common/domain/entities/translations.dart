import 'translation.dart';

class Translations {
  final Map<String, Translation> translations;

  Translations({required this.translations});
  String getName(String locale) {
    if (translations.containsKey(locale)) {
      return translations[locale]!.name;
    } else {
      return translations.entries.first.value.name;
    }
  }
}
