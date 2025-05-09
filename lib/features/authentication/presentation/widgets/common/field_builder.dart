import 'package:flutter/material.dart';
import '../../../../../core/config/app_sized_box.dart';

Widget buildAuthenticationField(Widget label, Widget field) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appBoxH8,
      label,
      appBoxH8,
      field,
      appBoxH8,
    ],
  );
}
