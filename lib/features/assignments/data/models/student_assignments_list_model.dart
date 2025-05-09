import 'student_assignment_model.dart';
import '../../domain/entities/student_assignment.dart';
import '../../domain/entities/student_assignments_list.dart';

/// A model class that represents a list of student assignments.
class StudentAssignmentsListModel extends StudentAssignmentsList {
  /// Constructor for the [StudentAssignmentsListModel] class.
  const StudentAssignmentsListModel({
    required super.numAssignments,
    required super.numActive,
    required super.numSubmitted,
    // required int numExpired,
    // required int numPassed,
    // required int numPending,
    // required int numFailed,
    required super.assignments,
  });

  /// A factory constructor that creates a [StudentAssignmentsListModel] instance from a JSON map.
  factory StudentAssignmentsListModel.fromJson(Map<String, dynamic> json) {
    // log(json.toString());
    return StudentAssignmentsListModel(
      numAssignments: json['numAssignments'] ?? -1,
      numActive: json['numActive'] ?? -1,
      //to get numSubmitted, count assignments with used_attempts_count > 0
      // asgs is a list of Map<String, dynamic>

      numSubmitted: json['assignments'].where((asg) {
        return asg['used_attempts_count'] as int > 0;
      }).length,
      // numExpired: json['numExpired'] ?? -1,
      // numPassed: json['numPassed'] ?? -1,
      // numPending: json['numPending'] ?? -1,
      // numFailed: json['numFailed'] ?? -1,
      assignments: json['assignments'].map<StudentAssignment>((e) {
        final model = StudentAssignmentModel.fromJson(e);
        return StudentAssignment(
          id: model.id,
          title: model.title,
          description: model.description,
          courseName: model.courseName,
          className: model.className,
          status: model.status,
          deadline: model.deadline,
          firstSubmission: model.firstSubmission,
          lastSubmission: model.lastSubmission,
          attempts: model.attempts,
          maxAttempts: model.maxAttempts,
          grade: model.grade,
          minGrade: model.minGrade,
          attachments: model.attachments,
          maxGrade: model.maxGrade,
        );
      }).toList(),
    );
  }

  /// A method that converts a [StudentAssignmentsListModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'numAssignments': numAssignments,
      'numActive': numActive,
      'numSubmitted': numSubmitted,
      // 'numExpired': numExpired,
      // 'numPassed': numPassed,
      // 'numPending': numPending,
      // 'numFailed': numFailed,
      'assignments': assignments.map((e) {
        final model = StudentAssignmentModel(
          id: e.id,
          title: e.title,
          description: e.description,
          courseName: e.courseName,
          className: e.className,
          status: e.status,
          deadline: e.deadline,
          firstSubmission: e.firstSubmission,
          lastSubmission: e.lastSubmission,
          attempts: e.attempts,
          maxAttempts: e.maxAttempts,
          grade: e.grade,
          minGrade: e.minGrade,
          attachments: e.attachments,
          maxGrade: e.maxGrade,
        );
        return model.toJson();
      }).toList(),
    };
  }
}
