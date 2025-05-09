import '../../features/quizzes/presentation/pages/quizz_not_submitted_page.dart';
import '../../features/quizzes/presentation/pages/quizzes_details_student.dart';
import '../../features/quizzes/presentation/pages/quizz_results_page.dart';
import '../../features/quizzes/presentation/pages/quizzes_details_teacher.dart';

import '../router_utils.dart';

final quizzesRoutes = [
  buildRoute(AppPages.quizResults, const QuizResultsScreen()),
  buildRoute(AppPages.quizNotSubmitted, const QuizNotSubmittedScreen()),
  buildRoute(AppPages.quizzesDetailsStudent, const QuizzesDetailsStudentPage()),
  buildRoute(AppPages.quizzesDetailsTeacher, const QuizzesDetailsTeacherPage()),
];
