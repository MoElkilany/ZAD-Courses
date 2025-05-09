import '../../../common/data/models/json/translations.dart';
import '../../domain/entities/assignment.dart';

class AssignmentModel extends Assignment {
  AssignmentModel({
    required super.translations,
    required super.status,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      translations: TranslationsModel.fromJson(json['translations']),
      status: json['status'] ?? '',
    );
  }
}
