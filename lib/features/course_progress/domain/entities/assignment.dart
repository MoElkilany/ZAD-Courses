import '../../../common/domain/entities/translations.dart';

class Assignment {
  final Translations name;
  final Translations section;
  final String status;
  final DateTime date;

  Assignment({
    required this.name,
    required this.section,
    required this.status,
    required this.date,
  });
}
