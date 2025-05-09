import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HintsWidget extends StatelessWidget {
  const HintsWidget({
    super.key,
    required this.hints,
  });
  final List<String> hints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The problem might be facing', //'evaluations.course'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        ...hints.map(
          (h) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Icon(
                Icons.check_box,
                color: Color(0xFF01ac88),
              ),
              title: Text(h).tr(),
              textColor: Colors.black,
              // tileColor: Colors.grey.withOpacity(0.2),
              minLeadingWidth: 30,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        )
      ],
    );
  }
}
