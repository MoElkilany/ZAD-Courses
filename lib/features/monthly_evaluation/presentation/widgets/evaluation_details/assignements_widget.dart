import 'package:flutter/material.dart';

import '../../../domain/entities/assignment.dart';

class HomeworkWidget extends StatelessWidget {
  const HomeworkWidget({
    super.key,
    required this.assignments,
  });
  final List<Assignment> assignments;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Homework submissions', //'evaluations.course'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        ...assignments.map(
          (a) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Text(a.translations.getName(locale)),
              trailing: SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    'Not Submitted',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // isThreeLine: true,
              tileColor: Colors.grey.withOpacity(0.2),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        )
      ],
    );
  }
}
