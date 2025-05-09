import 'dart:math';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';

import 'core/config/app_size.dart';
import 'di/app_settings.dart';
import 'di/assignments.dart';
import 'di/authentication.dart';
import 'di/courses.dart';
import 'features/app_parent/presentation/pages/app_parent.dart';
import 'features/common/presentation/widgets/restart.dart';

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

List<Override> overrides = [];

/// Indicates whether the current platform is desktop [Windows, macOS, linux] or not.
bool get isLandscape {
  if (kIsWeb) return false;
  bool desktop = [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);

  double shortestSide = min(AppSize.width, AppSize.height);
  bool tablet = shortestSide > 600.0;
  return desktop || tablet;
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (isDesktop) {
    if (runWebViewTitleBarWidget(args)) {
      return;
    }
  }

  String storageLocation = '${(await getApplicationSupportDirectory()).path}-data';
  Hive.init(storageLocation);

  if (isDesktop) {
    await WindowManager.instance.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      // size: Size(1280, 1024),
      center: true,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: true,
      backgroundColor: Colors.black,
      title: "Zad",
      minimumSize: Size(800, 600),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  final authOverrides = await AuthenticationDI.init();
  final coursesOverrides = await CoursesDI.init();
  final assignmentsOverrides = await AssignmentsDI.init();
  final settingsOverrides = await AppSettingsDI.init();

  overrides = [
    ...settingsOverrides,
    ...authOverrides,
    ...coursesOverrides,
    ...assignmentsOverrides,
  ];

  await EasyLocalization.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: overrides,
      child: const RestartWidget(child: AppParent()),
    ),
  );
}
