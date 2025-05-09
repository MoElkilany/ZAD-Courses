import 'package:hive/hive.dart';

import '../../../domain/entities/language.dart';

part 'hive.g.dart';

@HiveType(typeId: 16)
class LanguageHiveModel extends Language {
  LanguageHiveModel({
    required super.code,
    required super.name,
  });
  @override
  @HiveField(0)
  String get code => super.code;
  @override
  @HiveField(1)
  String get name => super.name;

  factory LanguageHiveModel.of(Language language) {
    return LanguageHiveModel(
      code: language.code,
      name: language.name,
    );
  }
}
