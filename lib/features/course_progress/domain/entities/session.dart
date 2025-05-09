import '../../../common/domain/entities/translations.dart';

class Session {
  final Translations sessionName;
  final Translations chapterName;
  final bool status;
  final DateTime date;

  Session({required this.sessionName, required this.chapterName, required this.status, required this.date});
}
