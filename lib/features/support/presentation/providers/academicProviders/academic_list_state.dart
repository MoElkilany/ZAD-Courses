import 'package:flutter/foundation.dart';

import '../../../domain/entities/academic_ticket.dart';

class AcademicListState {
  final List<AcademicTicket> allAcademicTickets;

  final List<AcademicTicket> filteredAcademicTickets;

  final List<String> dropDownCourses;

  final String? selectedCourse;

  final List<String> dropDownUserTypes;

  final String? selectedUserType;

  /// Creates a new instance of [AcademicListState].
  const AcademicListState({
    this.allAcademicTickets = const [],
    this.filteredAcademicTickets = const [],
    this.dropDownCourses = const [],
    this.selectedCourse,
    this.dropDownUserTypes = const [],
    this.selectedUserType,
  });

  /// Creates a new instance of [AcademicListState] with updated values.
  ///
  /// [allAcademicTickets], [filteredAcademicTickets], [dropDownCourses], and [selectedCourse] can be updated.
  AcademicListState copyWith({
    List<AcademicTicket>? allAcademicTickets,
    List<AcademicTicket>? filteredAcademicTickets,
    List<String>? dropDownCourses,
    String? selectedCourse,
    List<String>? dropDownUserTypes,
    String? selectedUserType,
  }) {
    return AcademicListState(
      allAcademicTickets: allAcademicTickets ?? this.allAcademicTickets,
      filteredAcademicTickets: filteredAcademicTickets ?? this.filteredAcademicTickets,
      dropDownCourses: dropDownCourses ?? this.dropDownCourses,
      selectedCourse: selectedCourse,
      dropDownUserTypes: dropDownUserTypes ?? this.dropDownUserTypes,
      selectedUserType: selectedUserType,
    );
  }

  /// Returns a string representation of the [AcademicListState] object.
  @override
  String toString() {
    return 'AcademicListState(allAcademicTickets: $allAcademicTickets, filteredAcademicTickets: $filteredAcademicTickets, dropDownCourses: $dropDownCourses, selectedCourse: $selectedCourse, dropDownUserTypes: $dropDownUserTypes, selectedUserType: $selectedUserType)';
  }

  /// Checks if two [AcademicListState] objects are equal.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcademicListState &&
        listEquals(other.allAcademicTickets, allAcademicTickets) &&
        listEquals(other.filteredAcademicTickets, filteredAcademicTickets) &&
        listEquals(other.dropDownCourses, dropDownCourses) &&
        other.selectedCourse == selectedCourse &&
        listEquals(other.dropDownUserTypes, dropDownUserTypes) &&
        other.selectedUserType == selectedUserType;
  }

  /// Returns the hash code of the [AcademicListState] object.
  @override
  int get hashCode {
    return allAcademicTickets.hashCode ^
        filteredAcademicTickets.hashCode ^
        dropDownCourses.hashCode ^
        selectedCourse.hashCode ^
        dropDownUserTypes.hashCode ^
        selectedUserType.hashCode;
  }
}
