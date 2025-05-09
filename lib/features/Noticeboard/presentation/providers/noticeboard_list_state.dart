import 'package:flutter/foundation.dart';
import '../../domain/entities/notice.dart';

/// A class that represents the state of a list of Notices.
class NoticeboardListState {
  /// A list of all Notices.
  final List<Notice> allNotices;

  /// A list of filtered Notices.
  final List<Notice> filteredNotices;

  /// A list of Notices for a dropdown menu.
  final List<Notice> dropDownCourses;

  /// The currently selected Notices.
  final Notice? selectedCourse;

  /// Creates a new instance of [NoticeboardListState].
  const NoticeboardListState({
    this.allNotices = const [],
    this.filteredNotices = const [],
    this.dropDownCourses = const [],
    this.selectedCourse,
  });

  /// Creates a new instance of [NoticeboardListState] with updated values.
  ///
  /// [allStudentAssignments], [filteredNotices], [dropDownCourses], and [selectedCourse] can be updated.
  NoticeboardListState copyWith({
    List<Notice>? allNotices,
    List<Notice>? filteredNotices,
    List<Notice>? dropDownCourses,
    Notice? selectedCourse,
  }) {
    return NoticeboardListState(
      allNotices: allNotices ?? this.allNotices,
      filteredNotices: filteredNotices ?? this.filteredNotices,
      dropDownCourses: dropDownCourses ?? this.dropDownCourses,
      selectedCourse: selectedCourse,
    );
  }

  /// Returns a string representation of the [NoticeboardListState] object.
  @override
  String toString() {
    return 'NoticeboardListState(allNotices: $allNotices, filteredNotices: $filteredNotices, dropDownCourses: $dropDownCourses, selectedCourse: $selectedCourse)';
  }

  /// Checks if two [NoticeboardListState] objects are equal.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoticeboardListState &&
        listEquals(other.allNotices, allNotices) &&
        listEquals(other.filteredNotices, filteredNotices) &&
        listEquals(other.dropDownCourses, dropDownCourses) &&
        other.selectedCourse == selectedCourse;
  }

  /// Returns the hash code of the [NoticeboardListState] object.
  @override
  int get hashCode {
    return allNotices.hashCode ^ filteredNotices.hashCode ^ dropDownCourses.hashCode ^ selectedCourse.hashCode;
  }
}
