import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/config/colors.dart';
import '../../../domain/entities/session.dart';

class AttendanceTab extends StatelessWidget {
  final List<Session> data;
  const AttendanceTab({
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
                  width: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (v.status) ...[
                        Icon(
                          Icons.check_circle,
                          color: kGreen,
                          size: 32,
                        ),
                      ],
                      if (!v.status) ...[
                        Icon(
                          Icons.close,
                          color: kRed,
                          size: 32,
                        ),
                      ]
                    ],
                  ),
                ),
                title: Text(v.sessionName.getName(locale)),
                subtitle: Text(v.chapterName.getName(locale)),
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
