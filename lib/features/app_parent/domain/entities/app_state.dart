import 'package:equatable/equatable.dart';

import 'language.dart';
import 'user_info.dart';

class AppState extends Equatable {
  final Language? language;
  final String? token;
  final UserInfo? userInfo;

  const AppState({
    this.language,
    this.token,
    this.userInfo,
  });

  //props list
  @override
  List<Object?> get props => [
        language,
        token,
        userInfo,
      ];
}
