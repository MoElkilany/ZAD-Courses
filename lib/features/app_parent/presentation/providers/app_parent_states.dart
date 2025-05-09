import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/types/app_types.dart';
import '../../domain/entities/language.dart';
import '../../domain/entities/user_info.dart';

class AppParentStates {
  static final appState = StateProvider<AppInitState>((ref) => AppInitState.init);

  static final appLanguage = StateProvider<Language>((ref) => Language(code: 'en', name: 'English'));

  static final appUserInfo = StateProvider<UserInfo?>((ref) => null);
}
