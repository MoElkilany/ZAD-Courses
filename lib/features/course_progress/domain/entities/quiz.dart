import '../../../common/domain/entities/translations.dart';

class Quiz {
  final Translations name;
  final Translations section;
  final String status;
  final DateTime date;

  Quiz({required this.name, required this.section, required this.status, required this.date});
}
