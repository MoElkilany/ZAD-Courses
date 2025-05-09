import 'package:flutter/material.dart';

import '../../config/colors.dart';

class HighlightedButtonWrapper extends StatelessWidget {
  const HighlightedButtonWrapper({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: theme.elevatedButtonTheme.style?.copyWith(
            backgroundColor: const WidgetStatePropertyAll(kZadDarkGreen),
          ),
        ),
      ),
      child: child,
    );
  }
}
