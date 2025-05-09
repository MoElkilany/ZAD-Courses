import 'package:easy_localization/easy_localization.dart';

import '../../../common/data/models/json/translations.dart';
import '../../domain/entities/quiz.dart';

class QuizModel extends Quiz {
  QuizModel({required super.name, required super.section, required super.status, required super.date});
  static final _formatter = DateFormat('yyyy-mm-dd');
  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      name: TranslationsModel.fromJson(json['translations']),
      section: TranslationsModel.fromJson(json['chapter']['translations']),
      status: json['status'],
      date: _formatter.parse(json['due_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'section': section,
      'status': status,
    };
  }
}
