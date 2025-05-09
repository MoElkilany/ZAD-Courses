import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_settings.dart';
import '../features/app_parent/presentation/providers/app_parent_states.dart';
import '../router/providers/initialisation_listenable.dart';

import '../router/router.dart';

class AppServices {
  static final initializationListnable = ChangeNotifierProvider<InitializationListenable>(
    (ref) {
      final appState = ref.watch(AppParentStates.appState.notifier);
      final appLanguage = ref.watch(AppParentStates.appLanguage.notifier);
      final appUserInfo = ref.watch(AppParentStates.appUserInfo.notifier);

      return InitializationListenable(
        appState: appState,
        appLanguage: appLanguage,
        appUserInfo: appUserInfo,
        getAuthInfo: ref.read(AppSettingsDI.getAuthInfo),
        getLanguage: ref.read(AppSettingsDI.getLocale),
        getUserInfo: ref.read(AppSettingsDI.getUserInfo),
        tryLogin: ref.read(AppSettingsDI.tryLogin),
      );
    },
  );
  static final appRouter = Provider((ref) {
    final initAppListnable = ref.watch(initializationListnable);

    return AppRouter(
      initializationListnable: initAppListnable,
    );
  });
}
