import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/colors.dart';
import '../../../domain/entities/assignment.dart';

class AssignmentsTab extends StatelessWidget {
  final List<Assignment> data;
  const AssignmentsTab({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final formatter = DateFormat('hh:mm a dd MMM yyyy');

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      children: data
          .map(
            (v) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: SizedBox(
                  width: 45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (v.status == 'pending') ...[
                        Icon(
                          Icons.check_circle,
                          color: Color(0xFFc99360),
                          size: 32,
                        ),
                        Text(v.status).tr(),
                      ],
                      if (v.status == 'not_submitted') ...[
                        Icon(
                          Icons.close,
                          color: kRed,
                          size: 32,
                        ),
                        Text(
                          'missing',
                        ),
                      ]
                    ],
                  ),
                ),
                title: Text(v.name.getName(locale)),
                subtitle: Text(v.section.getName(locale)),
                trailing: SizedBox(width: 55, child: Text(formatter.format(v.date))),
                tileColor: Colors.grey.withOpacity(0.2),
                textColor: Colors.black,
                horizontalTitleGap: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
