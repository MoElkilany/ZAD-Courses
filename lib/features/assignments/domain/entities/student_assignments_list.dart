import 'package:equatable/equatable.dart';
import 'student_assignment.dart';

/// A class that represents a list of student assignments.
class StudentAssignmentsList extends Equatable {
  /// The total number of assignments in the list.
  final int numAssignments;

  /// The number of active assignments in the list.
  final int numActive;

  /// The number of submitted assignments in the list.
  final int numSubmitted;

  // /// The number of expired assignments in the list.
  // final int numExpired;

  // /// The number of passed assignments in the list.
  // final int numPassed;

  // /// The number of pending assignments in the list.
  // final int numPending;

  // /// The number of failed assignments in the list.
  // final int numFailed;

  /// The list of student assignments.
  final List<StudentAssignment> assignments;

  /// Creates a new instance of [StudentAssignmentsList].
  const StudentAssignmentsList({
    required this.numAssignments,
    required this.numActive,
    required this.numSubmitted,
    // required this.numExpired,
    // required this.numPassed,
    // required this.numPending,
    // required this.numFailed,
    required this.assignments,
  });

  @override
  List<Object?> get props => [
        numAssignments,
        numActive,
        numSubmitted,
        // numExpired,
        // numPassed,
        // numPending,
        // numFailed,
        assignments,
      ];
}
