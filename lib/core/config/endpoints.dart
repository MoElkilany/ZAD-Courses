/// This Class contains all the endpoints used in the app, including the base url,
/// and all requests endpoints, These endpoints are used in all remote data sources
/// and repositories to communicate with the backend.
///
/// ###   **Changes to the endpoints should be made here**
class Endpoints {
  ///Base Url: https://zad.mimocodes.com
  static const baseUrl = 'https://zadcourses.com';
  //  'https://zadcourses.com';  
  static const register = '/register/step/1';
  static const verify = '/register/step/2';
  static const blank = '/api/development/desktop/meeting/blank';
  //User
  /// Login endpoint, requires email and password in the body
  static const login = '/api/development/login';

  /// Refresh token endpoint, no body required
  static const refreshToken = '/api/development/refreshToken';

  /// Get user info endpoint
  static const userInfo = '/api/development/panel/profile-setting';

  /// Get user notifications endpoint
  static const notifications = '/api/development/panel/notifications/';
  static const markAsReadExtension = '/seen';

  // Courses
  /// Get all purchased courses endpoint
  static const purchases = '/api/development/panel/courses/purchases';

  /// my classes as a teacher
  static const myClassesTeacher = '/api/development/panel/classes/';

  /// Get all favourited courses endpoint
  static const favourites = '/api/development/panel/favorites/';

  ///Get Session Details for a certain Session ID
  static const sessionDetails = '/api/development/panel/meeting';

  ///Get Session Details for Desktop webview
  static const sessionDetailsDesktop = '/api/development/desktop/meeting';

  /// Get Course by ID endpoint, add id to the end of the string as in
  /// ```dart
  /// Endpoints.course + id
  /// print(Endpoints.course + id);
  /// ```
  /// Assuming id is 1, the output will be:
  /// ```dart
  /// /api/development/panel/courses/1
  /// ```
  static const course = '/api/development/panel/courses/'; //?" + id
  /// Toggle Course favourited, add course id to the end of the string as in
  /// ```dart
  /// Endpoints.toggleFav + id
  /// print(Endpoints.toggleFav + id);
  /// ```
  /// Assuming id is 1, the output will be:
  /// ```dart
  /// /api/development/panel/favorites/toggle/1
  /// ```
  static const toggleFav = '/api/development/panel/favorites/toggle/'; //?" + id

  // Assignments
  /// Get all student assignments endpoint
  static const studentAssignments = '/api/development/panel/my_assignments';

  /// Get all teacher assignments endpoint
  static const teacherAssignments = '/api/development/instructor/assignments';

  ///Get student submissions for a certain assignment
  static const studentSubmissionsPrefix = '/api/development/instructor/assignments/';
  static const studentSubmissionsSuffix = '/students';

  //Quizzes
  /// Get all student Quiz Results endpoint
  static const studentQuizResults = '/api/development/panel/quizzes/results/my-results';

  /// Get all student Quizzes Not Submitted endpoint
  static const studentQuizzesNotSubmitted = '/api/development/panel/quizzes/not_participated';

  /// Get all teacher Quizzes endpoint
  static const teacherQuizzes = '/api/development/instructor/quizzes/list';

  //Support
  /// Submit a ticket, requires a POST request with a form data body, refer to api
  /// collection for more info
  static const submitTicket = '/api/development/panel/support';

  /// Get new ticket options, which consists of courses, departments, and roles
  /// for a particular user.
  static const newTicketOptions = '/api/development/panel/support/create';

  /// Get all academic tickets
  static const academicSupportHistory = '/api/development/panel/support/class_support';

  /// Get all platform tickets
  static const platformSupportHistory = '/api/development/panel/support/tickets';

  //Dashboard
  /// Get student or teacher dashboard data
  static const dashboard = '/api/development/panel/dashboard';

  //Noticeboard
  /// Get noticeboard data
  static const allNoticeboard = '/api/development/panel/courses/allNoticeboards';

  /// Get Courses to post to for new Notice
  static const newNotice = '/api/development/panel/noticeboard/new';

  /// Post Noticeboard data for a course (teacher)
  static const postNotice = '/api/development/panel/noticeboard/store';

  //Financial
  /// Get student and Teacher financial data
  static const financialSummary = '/api/development/panel/financial/summary';

  static const evaluations = '/api/development/panel/evaluation';
  static const progress = '/api/development/panel/dependents/course/progress';
  static const progressFilters = '/api/development/panel/dependents/course/progressFilters';
}
