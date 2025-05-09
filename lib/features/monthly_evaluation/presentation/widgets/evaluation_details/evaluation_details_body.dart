import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/config/endpoints.dart';
import '../../../domain/entities/evaluation.dart';
import '../../../domain/entities/evaluation_details.dart';
import 'assignements_widget.dart';
import 'course_widget.dart';
import 'hints_widget.dart';
import 'month_widget.dart';
import 'other_notes_widget.dart';
import 'quizzes_widget.dart';
import 'topics_widget.dart';

class EvaluationDetailsBody extends StatelessWidget {
  const EvaluationDetailsBody({
    super.key,
    required this.data,
    required this.details,
  });
  final MonthlyEvaluation data;
  final EvaluationDetails details;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Evaluation Details', //  'evaluations.evaluation_details'.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 8),
          CourseWidget(title: details.courseTitle),
          SizedBox(height: 24),
          HomeworkWidget(assignments: details.assignments),
          SizedBox(height: 24),
          QuizzesWidget(quizzes: details.quizzes),
          SizedBox(height: 24),
          TopicsWidget(topics: details.topics),
          SizedBox(height: 24),
          MonthsWidget(month: details.month),
          SizedBox(height: 24),
          HintsWidget(hints: details.hints),
          SizedBox(height: 24),
          OtherNotesWidget(title: 'details.notes'),
          SizedBox(height: 24),
          Row(
            children: [
              // Expanded(
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Color(0xFFAB2522),
              //       foregroundColor: Colors.white,
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              //     ),
              //     onPressed: () {

              //     },
              //     child: Text('Cancel'),
              //   ),
              // ),
              // SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF01ac88),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse('${Endpoints.baseUrl}/panel/evaluation/downloadPDF/${data.id}'));
                  },
                  child: Text('Download Pdf'),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
