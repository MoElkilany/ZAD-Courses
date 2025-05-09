import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/colors.dart';
import '../../../../Noticeboard/domain/entities/notice.dart';

class Notices extends StatelessWidget {
  Notices({
    super.key,
    required this.notices,
  });

  final List<Notice> notices;
  final formatter = DateFormat('dd MMM yyyy | hh:mm a');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Notices',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: notices.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Notice notice = notices[index];

            return Padding(
              padding: appPaddingB8,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: appBordRadCir8,
                ),
                tileColor: kGray.withOpacity(0.15),
                iconColor: kGray,
                trailing: null,
                textColor: kDark,
                title: Text(notice.title),
                subtitle: Row(
                  children: [
                    if (notice.date != null)
                      Expanded(
                        child: Text(formatter.format(notice.date!)),
                      ),
                    Text('By ${notice.sender}'),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
