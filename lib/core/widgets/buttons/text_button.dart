import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../config/colors.dart';

class ZadTextButton extends StatelessWidget {
  const ZadTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: kDark,
          fontWeight: FontWeight.bold,
        ),
      ).tr(),
    );
  }
}
