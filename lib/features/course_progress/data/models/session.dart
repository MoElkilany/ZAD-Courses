import '../../../common/data/models/json/translations.dart';
import '../../domain/entities/session.dart';

class SessionModel extends Session {
  SessionModel({required super.sessionName, required super.chapterName, required super.status, required super.date});

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      sessionName: TranslationsModel.fromJson(json['translations']),
      chapterName: TranslationsModel.fromJson(json['chapter']['translations']),
      status: json['status'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': sessionName,
      'date': date,
      'section': chapterName,
      'status': status,
    };
  }
}
