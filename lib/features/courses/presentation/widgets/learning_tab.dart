import 'package:flutter/material.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/widgets/text/auto_size_text.dart';

class LearningTab extends StatelessWidget {
  const LearningTab({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Tab(
      height: 25,
      child: FittedBox(
        child: ZadAutoSizeTextWithMaxLine(
          text: text,
          maxlines: 1,
          color: kDark,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
