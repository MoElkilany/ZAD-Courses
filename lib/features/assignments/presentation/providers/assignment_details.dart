import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/student_assignment.dart';

part 'assignment_details.g.dart';

/// A Riverpod provider class for managing the details of a student assignment.
@Riverpod(keepAlive: true)
class StudentAssignmentDetails extends _$StudentAssignmentDetails {
  /// Overrides the default build method of the provider.
  /// Returns null as this provider does not have a UI representation.
  @override
  StudentAssignment? build() {
    return null;
  }

  /// Sets the current student assignment to the provided [assignment].
  void setAssignment(StudentAssignment assignment) {
    state = assignment;
  }

  /// Returns the current student assignment.
  get assignment => state;
}

/// A Riverpod provider class for managing the Submissions of a student assignment.
@Riverpod(keepAlive: true)
class StudentsAssignmentSubmissionsDetails extends _$StudentsAssignmentSubmissionsDetails {
  /// Overrides the default build method of the provider.
  /// Returns null as this provider does not have a UI representation.
  @override
  int? build() {
    return null;
  }

  /// Sets the current student assignment to the provided [assignment].
  void setAssignment(int assignment) {
    state = assignment;
  }

  /// Returns the current student assignment.
  get assignment => state;
}
