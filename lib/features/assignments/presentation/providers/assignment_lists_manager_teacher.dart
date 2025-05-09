import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/teacher_assignment.dart';
import 'assignments_filter.dart';
import 'assignments_list_state.dart';

part 'assignment_lists_manager_teacher.g.dart';

@Riverpod(keepAlive: true)
class TeacherAssignmentsListManager extends _$TeacherAssignmentsListManager {
  @override
  TeacherAssignmentsListState build() {
    return const TeacherAssignmentsListState();
  }

  //how to read state
  List<TeacherAssignment> get allAssignments => state.allTeacherAssignments;
  List<TeacherAssignment> get filteredAssignments => state.filteredTeacherAssignments;

  void setFilteredAssignments() {
    final filters = ref.watch(teacherAssignmentsFilterProvider.notifier);
    List<TeacherAssignment> newFilteredAssignments = state.allTeacherAssignments;

    //if query is not null, filter by it
    if (filters.query != null) {
      newFilteredAssignments = newFilteredAssignments
          .where(
            (e) =>
                e.title.toLowerCase().contains(
                      filters.query!.toLowerCase(),
                    ) ||
                e.courseTitle.toLowerCase().contains(
                      filters.query!.toLowerCase(),
                    ),
          )
          .toList();
    }
    // filters.resetQuery();

    //apply all filters one by one
    if (state.selectedTeacherAssignment != null) {
      newFilteredAssignments = newFilteredAssignments.where((e) => e.courseTitle == state.selectedTeacherAssignment!.courseTitle).toList();
    }

    List<TeacherAssignment> temp = [];
    //if isActive is true, add all active assignments to temp
    if (filters.isActive || filters.isExpired) {
      if (filters.isActive) {
        temp.addAll(newFilteredAssignments.where((e) => e.status == 'active'));
      }
      //if isExpired is true, add all expired assignments to temp
      if (filters.isExpired) {
        temp.addAll(newFilteredAssignments.where((e) => e.status != 'active'));
      }
    } else {
      temp.addAll(newFilteredAssignments);
    }

    newFilteredAssignments = temp;

    state = state.copyWith(
      filteredTeacherAssignments: newFilteredAssignments,
      allTeacherAssignments: allAssignments,
      selectedTeacherAssignment: state.selectedTeacherAssignment,
      dropDownTeacherAssignments: state.dropDownTeacherAssignments,
    );
  }

  List<DropdownMenuItem<String>>? get dropDownTeacherAssignments {
    if (state.allTeacherAssignments.isEmpty) {
      return null;
    }

    final dropDownItems = <DropdownMenuItem<String>>[];

    //add all assignments to dropDownItems using courseTitle, dont add already added titles
    for (var e in state.allTeacherAssignments) {
      if (dropDownItems.where((element) => element.value == e.courseTitle).isEmpty) {
        dropDownItems.add(
          DropdownMenuItem<String>(
            value: e.courseTitle,
            child: Text(e.courseTitle),
          ),
        );
      }
    }

    return dropDownItems;
  }

  String? get selectedAssignment {
    if (state.selectedTeacherAssignment == null) {
      return null;
    }

    return state.selectedTeacherAssignment!.courseTitle;
  }

  //setters
  void setAllAssignments(List<TeacherAssignment> value) {
    state = state.copyWith(allTeacherAssignments: value);
  }

  void initFilteredAssignments(List<TeacherAssignment> value) {
    state = state.copyWith(filteredTeacherAssignments: value);
  }

  void setSelectedAssignment(String? value) {
    if (value == null) {
      state = state.copyWith(selectedTeacherAssignment: null);
      return;
    }
    //find the assignment with the same course name
    TeacherAssignment? assignment = state.allTeacherAssignments.firstWhere((e) {
      return e.courseTitle == value;
    });

    state = state.copyWith(selectedTeacherAssignment: assignment);
  }

  void resetSelectedAssignment() {
    state = state.copyWith(selectedTeacherAssignment: null);
  }

  void resetFilteredAssignments() {
    state = state.copyWith(filteredTeacherAssignments: allAssignments);
  }
}
