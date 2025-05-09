import 'package:flutter/material.dart';

import '../../../domain/entities/topic.dart';

class TopicsWidget extends StatelessWidget {
  const TopicsWidget({
    super.key,
    required this.topics,
  });
  final List<Topic> topics;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Topics which needs improvement', //'evaluations.course'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        ...topics.map(
          (t) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFF01ac88),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                t.getName(locale),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
