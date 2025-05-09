import 'package:flutter/material.dart';

import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/teacher/course_submissions_teacher/course_student_submissions_teacher.dart';

class CourseStudentSubmissionsPage extends StatelessWidget {
  const CourseStudentSubmissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ZADAppBar(),
          SliverFillRemaining(
            child: CourseStudentSubmissionsTeacher(),
          ),
        ],
      ),
    );
  }
}
