import 'package:flutter/material.dart';

class MonthsWidget extends StatelessWidget {
  const MonthsWidget({
    super.key,
    required this.month,
  });
  final String month;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Month', //'evaluations.course'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              month,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
