import 'package:flutter/foundation.dart';
import '../../domain/entities/student_assignment.dart';
import '../../domain/entities/teacher_assignment.dart';

/// A class that represents the state of a list of student assignments.
class StudentAssignmentsListState {
  /// A list of all student assignments.
  final List<StudentAssignment> allStudentAssignments;

  /// A list of filtered student assignments.
  final List<StudentAssignment> filteredStudentAssignments;

  /// A list of student assignments for a dropdown menu.
  final List<StudentAssignment> dropDownStudentAssignments;

  /// The currently selected student assignment.
  final StudentAssignment? selectedStudentAssignment;

  /// Creates a new instance of [StudentAssignmentsListState].
  const StudentAssignmentsListState({
    this.allStudentAssignments = const [],
    this.filteredStudentAssignments = const [],
    this.dropDownStudentAssignments = const [],
    this.selectedStudentAssignment,
  });

  /// Creates a new instance of [StudentAssignmentsListState] with updated values.
  ///
  /// [allStudentAssignments], [filteredStudentAssignments], [dropDownStudentAssignments], and [selectedStudentAssignment] can be updated.
  StudentAssignmentsListState copyWith({
    List<StudentAssignment>? allStudentAssignments,
    List<StudentAssignment>? filteredStudentAssignments,
    List<StudentAssignment>? dropDownStudentAssignments,
    StudentAssignment? selectedStudentAssignment,
  }) {
    return StudentAssignmentsListState(
      allStudentAssignments: allStudentAssignments ?? this.allStudentAssignments,
      filteredStudentAssignments: filteredStudentAssignments ?? this.filteredStudentAssignments,
      dropDownStudentAssignments: dropDownStudentAssignments ?? this.dropDownStudentAssignments,
      selectedStudentAssignment: selectedStudentAssignment,
    );
  }

  /// Returns a string representation of the [StudentAssignmentsListState] object.
  @override
  String toString() {
    return 'StudentAssignmentsListState(allStudentAssignments: $allStudentAssignments, filteredStudentAssignments: $filteredStudentAssignments, dropDownStudentAssignments: $dropDownStudentAssignments, selectedStudentAssignment: $selectedStudentAssignment)';
  }

  /// Checks if two [StudentAssignmentsListState] objects are equal.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentAssignmentsListState &&
        listEquals(other.allStudentAssignments, allStudentAssignments) &&
        listEquals(other.filteredStudentAssignments, filteredStudentAssignments) &&
        listEquals(other.dropDownStudentAssignments, dropDownStudentAssignments) &&
        other.selectedStudentAssignment == selectedStudentAssignment;
  }

  /// Returns the hash code of the [StudentAssignmentsListState] object.
  @override
  int get hashCode {
    return allStudentAssignments.hashCode ^
        filteredStudentAssignments.hashCode ^
        dropDownStudentAssignments.hashCode ^
        selectedStudentAssignment.hashCode;
  }
}

/// A class that represents the state of a list of teacher assignments.
class TeacherAssignmentsListState {
  /// A list of all Teacher assignments.
  final List<TeacherAssignment> allTeacherAssignments;

  /// A list of filtered Teacher assignments.
  final List<TeacherAssignment> filteredTeacherAssignments;

  /// A list of Teacher assignments for a dropdown menu.
  final List<TeacherAssignment> dropDownTeacherAssignments;

  /// The currently selected Teacher assignment.
  final TeacherAssignment? selectedTeacherAssignment;

  /// Creates a new instance of [TeacherAssignmentsListState].
  const TeacherAssignmentsListState({
    this.allTeacherAssignments = const [],
    this.filteredTeacherAssignments = const [],
    this.dropDownTeacherAssignments = const [],
    this.selectedTeacherAssignment,
  });

  /// Creates a new instance of [TeacherAssignmentsListState] with updated values.
  ///
  /// [allTeacherAssignments], [filteredTeacherAssignments], [dropDownTeacherAssignments], and [selectedTeacherAssignment] can be updated.
  TeacherAssignmentsListState copyWith({
    List<TeacherAssignment>? allTeacherAssignments,
    List<TeacherAssignment>? filteredTeacherAssignments,
    List<TeacherAssignment>? dropDownTeacherAssignments,
    TeacherAssignment? selectedTeacherAssignment,
  }) {
    return TeacherAssignmentsListState(
      allTeacherAssignments: allTeacherAssignments ?? this.allTeacherAssignments,
      filteredTeacherAssignments: filteredTeacherAssignments ?? this.filteredTeacherAssignments,
      dropDownTeacherAssignments: dropDownTeacherAssignments ?? this.dropDownTeacherAssignments,
      selectedTeacherAssignment: selectedTeacherAssignment,
    );
  }

  /// Returns a string representation of the [TeacherAssignmentsListState] object.
  @override
  String toString() {
    return 'TeacherAssignmentsListState(allTeacherAssignments: $allTeacherAssignments, filteredTeacherAssignments: $filteredTeacherAssignments, dropDownTeacherAssignments: $dropDownTeacherAssignments, selectedTeacherAssignment: $selectedTeacherAssignment)';
  }

  /// Checks if two [TeacherAssignmentsListState] objects are equal.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeacherAssignmentsListState &&
        listEquals(other.allTeacherAssignments, allTeacherAssignments) &&
        listEquals(other.filteredTeacherAssignments, filteredTeacherAssignments) &&
        listEquals(other.dropDownTeacherAssignments, dropDownTeacherAssignments) &&
        other.selectedTeacherAssignment == selectedTeacherAssignment;
  }

  /// Returns the hash code of the [TeacherAssignmentsListState] object.
  @override
  int get hashCode {
    return allTeacherAssignments.hashCode ^
        filteredTeacherAssignments.hashCode ^
        dropDownTeacherAssignments.hashCode ^
        selectedTeacherAssignment.hashCode;
  }
}
