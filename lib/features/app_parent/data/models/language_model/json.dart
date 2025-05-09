import '../../../domain/entities/language.dart';

extension LanguageJsonModel on Language {
  static Language fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
    };
  }
}
