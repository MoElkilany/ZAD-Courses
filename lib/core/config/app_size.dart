import 'package:flutter/material.dart';

/// A class that provides the size of the app.
class AppSize {
  /// The Size (width, height) of the app in physical pixels ex: (1080, 1920).
  static final size =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;

  /// The device pixel ratio of the app.
  static final devicePixelRatio =
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  /// The width of the app. (physical width / devicePixelRatio)
  static final width = size.width / devicePixelRatio;

  /// The height of the app. (physical height / devicePixelRatio)
  static final height = size.height / devicePixelRatio;
}
