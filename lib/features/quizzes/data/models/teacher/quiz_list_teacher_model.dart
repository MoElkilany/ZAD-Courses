import '../../../domain/entities/teacher/quiz_list_teacher.dart';
import 'quiz_submission_teacher_model.dart';
import 'quiz_submissions_list_teacher_model.dart';
import 'quiz_teacher_model.dart';

class QuizListTeacherModel extends QuizzesListTeacher {
  const QuizListTeacherModel({
    required List<QuizSubmissionsListTeacherModel> quizzesSubmissionsLists,
    required List<QuizTeacherModel> quizzesList,
  }) : super(
          quizzesSubmissionsLists: quizzesSubmissionsLists,
          quizzesList: quizzesList,
        );

  factory QuizListTeacherModel.fromJson(Map<String, dynamic> json) {
    //find unique quizzes ids
    final uniqueQuizzesIds = <int>{};
    for (final submission in json["quizzes_results"]) {
      uniqueQuizzesIds.add(submission['quiz']["id"]);
    }
    //create quizzes submissions lists
    final quizzesSubmissionsLists = <QuizSubmissionsListTeacherModel>[];
    for (final quizId in uniqueQuizzesIds) {
      final submissions = <QuizSubmissionTeacherModel>[];
      for (final submission in json["quizzes_results"]) {
        if (submission['quiz']['id'] == quizId) {
          submissions.add(
            QuizSubmissionTeacherModel.fromJson(submission),
          );
        }
      }
      quizzesSubmissionsLists.add(
        QuizSubmissionsListTeacherModel(
          quizId: quizId,
          submissions: submissions,
        ),
      );
    }

    return QuizListTeacherModel(
      quizzesSubmissionsLists: quizzesSubmissionsLists,
      quizzesList: List<QuizTeacherModel>.from(
        json["quizzes"].map(
          (x) => QuizTeacherModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "quizzes_submissions_lists": List<dynamic>.from(quizzesSubmissionsLists.map((x) {
        final model = QuizSubmissionsListTeacherModel(
          quizId: x.quizId,
          submissions: x.submissions,
        );
        return model.toJson();
      })),
      "quizzes_list": List<dynamic>.from(quizzesList.map((x) {
        final model = QuizTeacherModel(
          quizId: x.quizId,
          quizTitle: x.quizTitle,
          courseTitle: x.courseTitle,
          status: x.status,
          dueDate: x.dueDate,
          dateCreated: x.dateCreated,
          totalMark: x.totalMark,
          successRate: x.successRate,
        );
        return model.toJson();
      })),
    };
  }
}
