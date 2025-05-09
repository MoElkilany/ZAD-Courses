/// App State used for Initialization and Authentication.
enum AppInitState {
  init,
  authenticating,
  authenticationFailed,
  authenticated,
  initialized,
}

// /// User type for currently logged in user.
// enum UserType {
//   student,
//   teacher,
// }

/// Assignment status type for assignment page.
enum AsgStatType {
  all,
  submitted,
  // pending,
  // failed,
}

/// Financial Card type for financial page.
enum FinancialCardType {
  balance,
  rechargeNum,
  enrolledNum,
  installmens,
}

/// Noticeboard Card type for financial page.
enum NoticeboardCardType {
  total,
  course,
  general,
}

/// Course Contnets Type used for different Row Styles in learning page.
enum ContentType {
  liveSession,
  files,
  text,
  assignments,
  video,
}

/// Assignment status type for learning page.
enum LearningAssignmentStatus {
  done,
  pending,
  missing,
}

///Quiz status type for quiz page.
enum QuizStatus {
  completed,
  pending,
  missing,
}

/// Quiz status type for Quiz card page
enum QuizStatType {
  all,
  passed,
  failed,
  open,
}

/// Support Ticket Type for support ticket page.
enum TicketType {
  plataform,
  academic,
}

/// New Notice Type for teacher post notice page.
enum NoticeType {
  course,
  general,
}

/// Support Ticket Status for support Hisory  pages.
enum TicketStatus {
  total,
  pending,
  closed,
}

/// Department Type for submit platform ticket page.
enum DepartmentType {
  financial,
  management,
}

/// Role Types for submit academic ticket page.
enum RoleType {
  teacher,
  headOfAssistants,
  courseCoordinator,
  assistant,
  organization,
  subAdmin,
}

/// Dashboard Types for dashboard page.
enum DashboardCardTypes {
  assignments,
  sessions,
  support,
  comments,
}

/// Dashboard Types for line chart.
enum LineChartType {
  thisYear,
  lastYear,
}
