import 'package:equatable/equatable.dart';
import 'teacher_assignment.dart';

/// A class that represents a list of teacher assignments.
class TeacherAssignmentsList extends Equatable {
  /// The total number of assignments in the list.
  final int numAssignments;

  /// The number of active assignments in the list.
  final int numActive;

  /// The number of expired assignments in the list.
  final int numExpired;

  /// The number of submitted assignments in the list.
  final int numSubmitted;

  /// The list of teacher assignments.
  final List<TeacherAssignment> assignments;

  /// Constructor for the TeacherAssignmentsList class.
  const TeacherAssignmentsList({
    required this.numAssignments,
    required this.numActive,
    required this.numExpired,
    required this.numSubmitted,
    required this.assignments,
  });

  @override
  List<Object?> get props => [
        numAssignments,
        numActive,
        numExpired,
        assignments,
      ];
}
