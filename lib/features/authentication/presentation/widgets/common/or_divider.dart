import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Text('misc.or').tr(),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
