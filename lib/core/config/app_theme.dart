import 'package:flutter/material.dart';
import 'app_border.dart';
import 'app_font_size.dart';

import 'colors.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: kPrimary,
    onPrimary: Colors.white,
    secondary: kSecondary,
    onSecondary: Colors.white,
    error: kRed,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: kDark,
  ),
  listTileTheme: const ListTileThemeData(
    horizontalTitleGap: 0,
    iconColor: Colors.white,
    textColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: appFontSizeMedium,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
    collapsedIconColor: Colors.white60,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: kSecondary,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: appBordRadCir4,
      borderSide: BorderSide(
        color: kLightGray,
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 8,
    ),
    floatingLabelAlignment: FloatingLabelAlignment.start,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.all(14),
      ),
    ),
  ),
);
