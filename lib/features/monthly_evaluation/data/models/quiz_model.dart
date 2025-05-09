import '../../../common/data/models/json/translation_model.dart';
import '../../domain/entities/quiz.dart';

class QuizModel extends Quiz {
  QuizModel({
    required super.translations,
    required super.grade,
    required super.status,
    required super.mark,
    required super.comment,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      translations: (json['translations'] as List).cast().asMap().map(
            (_, v) => MapEntry(
              v['locale'],
              TranslationModel.fromJson(v),
            ),
          ),
      grade: json['grade'] ?? '50',
      mark: json['mark'] ?? '100',
      status: json['status'] ?? 'Not Submitted',
      comment: json['comment'] ?? 'No comment',
    );
  }
}
