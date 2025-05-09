import '../../../common/domain/entities/translation.dart';

class Quiz {
  final Map<String, Translation> translations;
  final String status;
  final String mark;
  final String grade;
  final String comment;

  Quiz({
    required this.translations,
    required this.status,
    required this.mark,
    required this.grade,
    required this.comment,
  });

  String getName(String locale) {
    if (translations.containsKey(locale)) {
      return translations[locale]!.name;
    } else {
      return translations.entries.first.value.name;
    }
  }
}
