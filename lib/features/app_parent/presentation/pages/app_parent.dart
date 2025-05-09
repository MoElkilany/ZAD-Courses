import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/zad_app.dart';

class AppParent extends ConsumerWidget {
  const AppParent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EasyLocalization(
      // startLocale: getLocale(),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      saveLocale: true,
      child: const ZadApp(),
    );
  }
}
