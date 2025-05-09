import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ZadAutoSizeTextWithMaxLine extends StatelessWidget {
  const ZadAutoSizeTextWithMaxLine({
    super.key,
    required this.text,
    required this.maxlines,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final int maxlines;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.tr(),
      maxLines: maxlines,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
