import 'package:flutter/material.dart';

class OtherNotesWidget extends StatelessWidget {
  const OtherNotesWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other notes', //'evaluations.OtherNotesWidget'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
