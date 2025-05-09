import 'teacher_assignment_model.dart';
import '../../domain/entities/teacher_assignment.dart';
import '../../domain/entities/teacher_assignments_list.dart';

/// A model class that represents a list of teacher assignments.
class TeacherAssignmentsListModel extends TeacherAssignmentsList {
  /// Constructor for the [TeacherAssignmentsListModel] class.
  const TeacherAssignmentsListModel({
    required super.numAssignments,
    required super.numActive,
    required super.numExpired,
    required super.numSubmitted,
    required super.assignments,
  });

  /// A factory method that creates a [TeacherAssignmentsListModel] instance from a JSON map.
  factory TeacherAssignmentsListModel.fromJson(Map<String, dynamic> json) {
    return TeacherAssignmentsListModel(
      numAssignments: json['course_assignments_count'],
      //loop over assignments and count active, expired
      numActive: json['assignments'].where((asg) {
        return asg['status'] == 'active';
      }).length,
      numExpired: json['assignments'].where((asg) {
        return asg['status'] != 'active';
      }).length,
      //loop over assignments jsons and add "submissions_count" values together
      numSubmitted: json['assignments'].fold<int>(0, (int previousValue, dynamic asg) {
        return previousValue + (asg['submissions_count'] as int);
      }),
      assignments: json['assignments'].map<TeacherAssignment>((e) {
        final model = TeacherAssignmentModel.fromJson(e);
        return TeacherAssignment(
          id: model.id,
          title: model.title,
          courseTitle: model.courseTitle,
          numSubmissions: model.numSubmissions,
          status: model.status,
          dueDate: model.dueDate,
        );
      }).toList(),
    );
  }

  /// A method that converts a [TeacherAssignmentsListModel] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'numAssignments': numAssignments,
      'numActive': numActive,
      'numExpired': numExpired,
      'assignments': assignments.map((e) {
        final model = TeacherAssignmentModel(
          id: e.id,
          title: e.title,
          courseTitle: e.courseTitle,
          numSubmissions: e.numSubmissions,
          status: e.status,
          dueDate: e.dueDate,
        );
        return model.toJson();
      }).toList(),
    };
  }
}
