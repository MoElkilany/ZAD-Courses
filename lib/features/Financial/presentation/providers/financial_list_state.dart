import 'package:flutter/foundation.dart';
import '../../domain/entities/financial_document.dart';

/// A class that represents the state of a list of Notices.
class FinancialListState {
  /// A list of all Notices.
  final List<FinDoc> allDocuments;

  /// A list of filtered Notices.
  final List<FinDoc> filteredDocuments;

  /// A list of Notices for a dropdown menu.
  final List<FinDoc> dropDownCourses;

  /// The currently selected Notices.
  final FinDoc? selectedCourse;

  /// Creates a new instance of [FinancialListState].
  const FinancialListState({
    this.allDocuments = const [],
    this.filteredDocuments = const [],
    this.dropDownCourses = const [],
    this.selectedCourse,
  });

  /// Creates a new instance of [FinancialListState] with updated values.
  ///
  /// [allStudentAssignments], [filteredNotices], [dropDownCourses], and [selectedCourse] can be updated.
  FinancialListState copyWith({
    List<FinDoc>? allNotices,
    List<FinDoc>? filteredNotices,
    List<FinDoc>? dropDownCourses,
    FinDoc? selectedCourse,
  }) {
    return FinancialListState(
      allDocuments: allNotices ?? allDocuments,
      filteredDocuments: filteredNotices ?? filteredDocuments,
      dropDownCourses: dropDownCourses ?? this.dropDownCourses,
      selectedCourse: selectedCourse,
    );
  }

  /// Returns a string representation of the [FinancialListState] object.
  @override
  String toString() {
    return 'NoticeboardListState(allNotices: $allDocuments, filteredNotices: $filteredDocuments, dropDownCourses: $dropDownCourses, selectedCourse: $selectedCourse)';
  }

  /// Checks if two [FinancialListState] objects are equal.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FinancialListState &&
        listEquals(other.allDocuments, allDocuments) &&
        listEquals(other.filteredDocuments, filteredDocuments) &&
        listEquals(other.dropDownCourses, dropDownCourses) &&
        other.selectedCourse == selectedCourse;
  }

  /// Returns the hash code of the [FinancialListState] object.
  @override
  int get hashCode {
    return allDocuments.hashCode ^ filteredDocuments.hashCode ^ dropDownCourses.hashCode ^ selectedCourse.hashCode;
  }
}
