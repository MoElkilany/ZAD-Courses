import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'colors.dart';

/// Default circular progress indicator.
const appDefaultCircIndicator = SpinKitCircle(
  color: kPrimary,
);

/// Circular progress indicator with white color.
const appKWhiteCircIndicator = CircularProgressIndicator(
  color: kWhite,
);

/// Circular progress indicator with secondary color.
const appKSecondaryCircIndicator = CircularProgressIndicator(
  color: kSecondary,
);
