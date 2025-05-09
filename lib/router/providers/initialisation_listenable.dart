import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/types/app_types.dart';
import '../../core/usecase/no_parameters.dart';
import '../../features/app_parent/domain/entities/language.dart';
import '../../features/app_parent/domain/entities/user_info.dart';
import '../../features/app_parent/domain/usecases/get_auth_info.dart';
import '../../features/app_parent/domain/usecases/get_language_info.dart';
import '../../features/app_parent/domain/usecases/get_user_info.dart';
import '../../features/app_parent/domain/usecases/try_login.dart';

class InitializationListenable with ChangeNotifier {
  final StateController<AppInitState> appState;
  final StateController<Language> appLanguage;
  final StateController<UserInfo?> appUserInfo;
  final GetLanguage getLanguage;
  final GetAuthInfo getAuthInfo;
  final GetUserInfo getUserInfo;
  final TryLogin tryLogin;

  bool initialized = false;
  bool authenticated = false;
  InitializationListenable({
    required this.appState,
    required this.appLanguage,
    required this.appUserInfo,
    required this.getLanguage,
    required this.getAuthInfo,
    required this.getUserInfo,
    required this.tryLogin,
  }) {
    init();
  }

  // Method to refresh the list
  Future<void> init() async {
    appState.state = AppInitState.init;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 1000));
    final laguageRes = await getLanguage.call(NoParameters());
    final language = laguageRes.fold((l) => null, (r) => r);
    appLanguage.state = language ?? Language(code: 'en', name: 'English');
    try {
      appState.state = AppInitState.authenticating;
      await Future.delayed(const Duration(milliseconds: 500));
      final authInfoRes = await getAuthInfo.call(NoParameters());
      if (authInfoRes.isLeft()) {
        appState.state = AppInitState.authenticationFailed;
        authenticated = false;
      } else {
        final authInfo = authInfoRes.fold((l) => null, (r) => r);
        if (authInfo == null) {
          appState.state = AppInitState.authenticationFailed;
          authenticated = false;
        } else {
          final authResponse = await tryLogin.call(authInfo);
          if (authResponse.isLeft()) {
            appState.state = AppInitState.authenticationFailed;
            authenticated = false;
          } else {
            await Future.delayed(const Duration(milliseconds: 500));
            final userInfoRes = await getUserInfo.call(NoParameters());
            final userInfo = userInfoRes.fold((l) => null, (r) => r);
            if (userInfo == null) {
              appState.state = AppInitState.authenticationFailed;
              authenticated = false;
            } else {
              appUserInfo.state = userInfo;
              appState.state = AppInitState.authenticated;
              authenticated = true;
            }
          }
        }
      }
      await Future.delayed(const Duration(milliseconds: 2000));
      appState.state = AppInitState.initialized;
      initialized = true;
      notifyListeners();
    } catch (e) {
      appState.state = AppInitState.authenticationFailed;
    }
  }
}
