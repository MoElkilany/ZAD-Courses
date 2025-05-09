import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/app_font_size.dart';
import '../../domain/entities/student_assignment.dart';
import 'assignments_filter.dart';
import 'assignments_list_state.dart';

part 'assignment_lists_manager.g.dart';

@Riverpod(keepAlive: true)
class StudentAssignmentsListManager extends _$StudentAssignmentsListManager {
  @override
  StudentAssignmentsListState build() {
    return const StudentAssignmentsListState();
  }

  //how to read state
  List<StudentAssignment> get allAssignments => state.allStudentAssignments;
  List<StudentAssignment> get filteredAssignments => state.filteredStudentAssignments;

  void setFilteredAssignments() {
    final filters = ref.watch(studentAssignmentsFilterProvider.notifier);
    List<StudentAssignment> newFilteredAssignments = state.allStudentAssignments;

    //if query is not null, filter by it
    if (filters.query != null) {
      newFilteredAssignments = newFilteredAssignments
          .where(
            (e) => e.title.toLowerCase().contains(
                  filters.query!.toLowerCase(),
                ),
          )
          .toList();
    }
    // filters.resetQuery();

    //apply all filters one by one
    //if SelectedSession is not null, filter by it
    if (state.selectedStudentAssignment != null) {
      newFilteredAssignments = newFilteredAssignments
          .where((e) => e.courseName == state.selectedStudentAssignment!.courseName && e.className == state.selectedStudentAssignment!.className)
          .toList();
    }

    List<StudentAssignment> temp = [];
    //if isPending is true, add all pending assignments to temp
    if (filters.isPending || filters.isPassed || filters.isFailed || filters.isNotSubmitted) {
      if (filters.isPending) {
        temp.addAll(newFilteredAssignments.where((e) => e.status == 'pending'));
      }
      //if isPassed is true, add all passed assignments to temp
      if (filters.isPassed) {
        temp.addAll(newFilteredAssignments.where((e) => e.status == 'passed'));
      }
      //if isFailed is true, add all failed assignments to temp
      if (filters.isFailed) {
        temp.addAll(newFilteredAssignments.where((e) => e.status == 'failed'));
      }
      //if isNotSubmitted is true, add all not submitted assignments to temp
      if (filters.isNotSubmitted) {
        temp.addAll(newFilteredAssignments.where((e) => e.status == 'not_submitted' || e.status == 'notSubmitted'));
      }
    } else {
      temp.addAll(newFilteredAssignments);
    }

    newFilteredAssignments = temp;

    //if firstSubmission is not null, filter by it
    if (filters.firstSubmission != null) {
      newFilteredAssignments =
          newFilteredAssignments.where((e) => e.firstSubmission == null ? false : e.firstSubmission!.isAfter(filters.firstSubmission!)).toList();
    }

    //if lastSubmission is not null, filter by it
    if (filters.lastSubmission != null) {
      newFilteredAssignments =
          newFilteredAssignments.where((e) => e.lastSubmission == null ? false : e.lastSubmission!.isBefore(filters.lastSubmission!)).toList();
    }

    state = state.copyWith(
      filteredStudentAssignments: newFilteredAssignments,
      allStudentAssignments: allAssignments,
      selectedStudentAssignment: state.selectedStudentAssignment,
      dropDownStudentAssignments: state.dropDownStudentAssignments,
    );
  }

  List<DropdownMenuItem<String>>? get dropDownStudentAssignments {
    if (state.allStudentAssignments.isEmpty) {
      return null;
    }
    //order by course name then class name
    final sortedAssignments = state.allStudentAssignments
      ..sort((a, b) {
        final courseName = a.courseName.compareTo(b.courseName);
        if (courseName != 0) {
          return courseName;
        }
        return a.className.compareTo(b.className);
      });

    //get all sessions
    final sessions = sortedAssignments.map((e) {
      String session = e.courseName;
      session += '/${e.className}';
      return session;
    }).toList();

    //remove duplicates
    final uniqueSessions = sessions.toSet().toList();

    //before the start of every unique CourseName, add a disabled item  with CourseName in bold
    final dropDownItems = <DropdownMenuItem<String>>[];
    String? lastCourseName;
    for (final session in uniqueSessions) {
      final courseName = session.split('/')[0];
      if (lastCourseName != courseName) {
        dropDownItems.add(
          DropdownMenuItem(
            enabled: false,
            child: Text(
              courseName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: appFontSizeLarge,
              ),
            ),
          ),
        );
        lastCourseName = courseName;
      }
      dropDownItems.add(
        DropdownMenuItem(
          value: session,
          child: Text(session),
        ),
      );
    }
    return dropDownItems;
  }

  String? get selectedAssignment {
    if (state.selectedStudentAssignment == null) {
      return null;
    }
    String session = state.selectedStudentAssignment!.courseName;
    session += '/${state.selectedStudentAssignment!.className}';
    return session;
  }

  //setters
  void setAllAssignments(List<StudentAssignment> value) {
    state = state.copyWith(allStudentAssignments: value);
  }

  void initFilteredAssignments(List<StudentAssignment> value) {
    state = state.copyWith(filteredStudentAssignments: value);
  }

  void setSelectedAssignment(String? value) {
    // print('setSelectedAssignment: $value');
    if (value == null) {
      state = state.copyWith(selectedStudentAssignment: null);
      return;
    }
    //find the assignment with the same course name and class name
    StudentAssignment? assignment = state.allStudentAssignments.firstWhere((e) {
      String session = e.courseName;
      session += '/${e.className}';
      return session == value;
    });

    state = state.copyWith(selectedStudentAssignment: assignment);
  }

  void resetSelectedAssignment() {
    state = state.copyWith(selectedStudentAssignment: null);
  }

  void resetFilteredAssignments() {
    state = state.copyWith(filteredStudentAssignments: allAssignments);
  }
}
