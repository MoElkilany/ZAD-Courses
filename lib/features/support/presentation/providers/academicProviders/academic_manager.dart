import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/academic_ticket.dart';

import 'academic_filter.dart';
import 'academic_list_state.dart';

part 'academic_manager.g.dart';

@Riverpod(keepAlive: true)
class AcademicManager extends _$AcademicManager {
  @override
  AcademicListState build() {
    return const AcademicListState();
  }

  //how to read state
  List<AcademicTicket> get allTickets => state.allAcademicTickets;
  List<AcademicTicket> get filteredTickets => state.filteredAcademicTickets;

  void setFilteredTickets() {
    final filters = ref.watch(academicFilterProvider.notifier);
    List<AcademicTicket> newFilteredTickets = state.allAcademicTickets;
    //apply all filters one by one
    //if SelectedSession is not null, filter by it
    if (state.selectedCourse != null) {
      newFilteredTickets = newFilteredTickets.where((e) => e.courseName == state.selectedCourse).toList();
    }
    if (state.selectedUserType != null) {
      newFilteredTickets = newFilteredTickets.where((e) => e.contactRole == state.selectedUserType).toList();
    }

    List<AcademicTicket> temp = [];
    //if isPending is true, add all pending assignments to temp
    if (filters.isReplied || filters.isOpen || filters.isClosed) {
      if (filters.isReplied) {
        temp.addAll(newFilteredTickets.where((e) => e.status == 'replied'));
      }
      //if isPassed is true, add all passed assignments to temp
      if (filters.isOpen) {
        temp.addAll(newFilteredTickets.where((e) => e.status == 'open'));
      }
      //if isFailed is true, add all failed assignments to temp
      if (filters.isClosed) {
        temp.addAll(newFilteredTickets.where((e) => e.status == 'closed'));
      }
      //if isNotSubmitted is true, add all not submitted assignments to temp
    } else {
      temp.addAll(newFilteredTickets);
    }

    newFilteredTickets = temp;

    //if firstSubmission is not null, filter by it
    if (filters.firstSubmission != null) {
      newFilteredTickets = newFilteredTickets.where((e) => e.createdAt!.isAfter(filters.firstSubmission!)).toList();
    }

    //if lastSubmission is not null, filter by it
    if (filters.lastSubmission != null) {
      newFilteredTickets = newFilteredTickets.where((e) => e.createdAt!.isBefore(filters.lastSubmission!)).toList();
    }

    //sort by date (newest to oldest) and then by title
    newFilteredTickets.sort((a, b) {
      //sort by date
      int dateComparison = b.createdAt!.compareTo(a.createdAt!);
      if (dateComparison != 0) {
        return dateComparison;
      }
      //sort by title
      return a.title.compareTo(b.title);
    });
    state = state.copyWith(
      filteredAcademicTickets: newFilteredTickets,
      allAcademicTickets: allTickets,
      selectedCourse: state.selectedCourse,
      dropDownCourses: state.dropDownCourses,
      selectedUserType: state.selectedUserType,
      dropDownUserTypes: state.dropDownUserTypes,
    );
  }

  List<DropdownMenuItem<String>>? get dropDownCourses {
    if (state.allAcademicTickets.isEmpty) {
      return null;
    }
    //order by course name
    final sortedCourses = state.allAcademicTickets
      ..sort((a, b) {
        //sort only by course name
        return a.courseName.compareTo(b.courseName);
      });

    //get all sessions
    final sessions = sortedCourses.map((e) {
      String session = e.courseName;
      return session;
    }).toList();

    //remove duplicates
    final uniqueSessions = sessions.toSet().toList();

    final dropDownItems = <DropdownMenuItem<String>>[];

    for (final session in uniqueSessions) {
      dropDownItems.add(
        DropdownMenuItem(
          value: session,
          child: Text(session),
        ),
      );
    }
    return dropDownItems;
  }

  List<DropdownMenuItem<String>>? get dropDownUserTypes {
    if (state.allAcademicTickets.isEmpty) {
      return null;
    }
    //order by course name
    final sortedCourses = state.allAcademicTickets
      ..sort((a, b) {
        //sort only by role
        return a.contactRole.compareTo(b.contactRole);
      });

    //get all sessions
    final sessions = sortedCourses.map((e) {
      String session = e.contactRole;
      return session;
    }).toList();

    //remove duplicates
    final uniqueSessions = sessions.toSet().toList();

    final dropDownItems = <DropdownMenuItem<String>>[];

    for (final session in uniqueSessions) {
      dropDownItems.add(
        DropdownMenuItem(
          value: session,
          child: Text(session),
        ),
      );
    }
    return dropDownItems;
  }

  String? get selectedCouse {
    if (state.selectedCourse == null) {
      return null;
    }
    String session = state.selectedCourse!;
    return session;
  }

  String? get selectedUserType {
    if (state.selectedUserType == null) {
      return null;
    }
    String session = state.selectedUserType!;
    return session;
  }

  //setters
  void setAllTickets(List<AcademicTicket> value) {
    state = state.copyWith(allAcademicTickets: value);
  }

  void initFilteredTickets(List<AcademicTicket> value) {
    //sort by date (newest to oldest) and then by title
    value.sort((a, b) {
      //sort by date
      int dateComparison = b.createdAt!.compareTo(a.createdAt!);
      if (dateComparison != 0) {
        return dateComparison;
      }
      //sort by title
      return a.title.compareTo(b.title);
    });
    state = state.copyWith(filteredAcademicTickets: value);
  }

  void setSelectedCourse(String? value) {
    if (value == null) {
      state = state.copyWith(selectedCourse: null, selectedUserType: state.selectedUserType);
      return;
    }
    state = state.copyWith(selectedCourse: value, selectedUserType: state.selectedUserType);
  }

  void setSelectedUserType(String? value) {
    if (value == null) {
      state = state.copyWith(selectedUserType: null, selectedCourse: state.selectedCourse);
      return;
    }
    state = state.copyWith(selectedUserType: value, selectedCourse: state.selectedCourse);
  }

  void resetSelectedCourse() {
    state = state.copyWith(selectedCourse: null, selectedUserType: state.selectedUserType);
  }

  void resetSelectedUserType() {
    state = state.copyWith(selectedUserType: null, selectedCourse: state.selectedCourse);
  }

  void resetFilteredTickets() {
    //sort by date (newest to oldest) and then by title
    allTickets.sort((a, b) {
      //sort by date
      int dateComparison = b.createdAt!.compareTo(a.createdAt!);
      if (dateComparison != 0) {
        return dateComparison;
      }
      //sort by title
      return a.title.compareTo(b.title);
    });
    state = state.copyWith(filteredAcademicTickets: allTickets);
  }
}
