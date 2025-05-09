import '../../../common/data/models/json/translations.dart';
import '../../domain/entities/assignment.dart';

class AssignmentModel extends Assignment {
  AssignmentModel({required super.name, required super.section, required super.status, required super.date});

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    final x = AssignmentModel(
      name: TranslationsModel.fromJson(json['translations']),
      section: TranslationsModel.fromJson(json['chapter']['translations']),
      status: json['status'],
      date: DateTime.fromMillisecondsSinceEpoch(json['deadline'] * 1000),
    );
    return x;
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
