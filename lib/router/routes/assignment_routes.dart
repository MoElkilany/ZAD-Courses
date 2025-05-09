import '../../features/assignments/presentation/pages/assignments_details_student.dart';
import '../../features/assignments/presentation/pages/assignments_details_teacher.dart';
import '../../features/assignments/presentation/pages/assignments_page.dart';
import '../../features/assignments/presentation/pages/course_student_submissions_page.dart';

import '../router_utils.dart';

final assignmentRoutes = [
  buildRoute(AppPages.assignments, const AssignmentsScreen()),
  buildRoute(AppPages.courseSubmissions, const CourseStudentSubmissionsPage()),
  buildRoute(AppPages.assignmentDetailsStudent, const AssignmentDetailsStudentPage()),
  buildRoute(AppPages.assignmentSubmissionDetails, const CourseStudentSubmissionsPage()),
  buildRoute(AppPages.assignmentsDetailsTeacher, const AssignmentDetailsTeacherPage()),
];
