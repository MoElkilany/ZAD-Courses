import 'package:flutter/material.dart';
import '../../../../core/widgets/appbar/zad_app_bar.dart';
import '../../../../core/widgets/drawer/zad_drawer.dart';
import '../widgets/student/quizzes_details_body_student.dart';

class QuizzesDetailsStudentPage extends StatelessWidget {
  const QuizzesDetailsStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: ZADDrawer(),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          ZADAppBar(),
          SliverFillRemaining(
            child: QuizzesDetailsBodyStudent(),
          ),
        ],
      ),
    );
  }
}
