import 'package:flutter/rendering.dart';
import 'colors.dart';

/// A list of BoxShadow with a color of kDark with opacity of 0.2, blur radius of 8 and offset of (0, 2).
final appShadowKDark02 = [
  BoxShadow(
    color: kDark.withOpacity(0.2),
    blurRadius: 8,
    offset: const Offset(0, 2),
  ),
];

/// A list of BoxShadow with a color of kGray with opacity of 0.5, blur radius of 10 and offset of (0, 5).
final appShadowKgrey05 = [
  BoxShadow(
    color: kGray.withOpacity(0.5),
    blurRadius: 10,
    offset: const Offset(0, 5),
  ),
];

final appShadowKDark08 = [
  BoxShadow(
    color: kDark.withOpacity(0.8),
    blurRadius: 4,
    offset: const Offset(0, 1),
  ),
];
