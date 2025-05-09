import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
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
          'Course', //'evaluations.course'.tr(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.grey.withOpacity(0.2),
          title: Text(title),
          textColor: const Color(0xFF01ac88),
        ),
      ],
    );
  }
}
