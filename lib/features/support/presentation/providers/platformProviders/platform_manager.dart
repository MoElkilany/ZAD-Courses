import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/platform_ticket.dart';

import 'platform_filter.dart';
import 'platform_list_state.dart';

part 'platform_manager.g.dart';

@Riverpod(keepAlive: true)
class PlatformManager extends _$PlatformManager {
  @override
  PlatformListState build() {
    return const PlatformListState();
  }

  //how to read state
  List<PlatformTicket> get allTickets => state.allPlatformTickets;
  List<PlatformTicket> get filteredTickets => state.filteredPlatformTickets;

  void setFilteredTickets() {
    final filters = ref.watch(platformFilterProvider.notifier);
    List<PlatformTicket> newFilteredTickets = state.allPlatformTickets;
    //apply all filters one by one
    //if SelectedSession is not null, filter by it
    if (state.selectedDepartment != null) {
      newFilteredTickets = newFilteredTickets.where((e) => e.department == state.selectedDepartment).toList();
    }

    List<PlatformTicket> temp = [];
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
      newFilteredTickets = newFilteredTickets.where((e) => e.updatedAt!.isAfter(filters.firstSubmission!)).toList();
    }

    //if lastSubmission is not null, filter by it
    if (filters.lastSubmission != null) {
      newFilteredTickets = newFilteredTickets.where((e) => e.updatedAt!.isBefore(filters.lastSubmission!)).toList();
    }

    //sort by date (newest to oldest) and then by title
    newFilteredTickets.sort((a, b) {
      //sort by date
      int dateComparison = b.updatedAt!.compareTo(a.updatedAt!);
      if (dateComparison != 0) {
        return dateComparison;
      }
      //sort by title
      return a.title.compareTo(b.title);
    });

    state = state.copyWith(
      filteredPlatformTickets: newFilteredTickets,
      allPlatformTickets: allTickets,
      selectedDepartment: state.selectedDepartment,
      dropDownDepartments: state.dropDownDepartments,
    );
  }

  List<DropdownMenuItem<String>>? get dropDownDepartments {
    if (state.allPlatformTickets.isEmpty) {
      return null;
    }
    //order by course name
    final sortedDepartments = state.allPlatformTickets
      ..sort((a, b) {
        //sort only by course name
        return a.department.compareTo(b.department);
      });

    //get all sessions
    final sessions = sortedDepartments.map((e) {
      String session = e.department;
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

  String? get selectedDepartment {
    if (state.selectedDepartment == null) {
      return null;
    }
    String session = state.selectedDepartment!;
    return session;
  }

  //setters
  void setAllTickets(List<PlatformTicket> value) {
    state = state.copyWith(allPlatformTickets: value);
  }

  void initFilteredTickets(List<PlatformTicket> value) {
    //sort by date (newest to oldest) and then by title
    value.sort((a, b) {
      //sort by date
      int dateComparison = b.updatedAt!.compareTo(a.updatedAt!);
      if (dateComparison != 0) {
        return dateComparison;
      }
      //sort by title
      return a.title.compareTo(b.title);
    });
    state = state.copyWith(filteredPlatformTickets: value);
  }

  void setSelectedDepartment(String? value) {
    if (value == null) {
      state = state.copyWith(selectedDepartment: null);
      return;
    }
    state = state.copyWith(
      selectedDepartment: value,
    );
  }

  void resetSelectedDepartments() {
    state = state.copyWith(
      selectedDepartment: null,
    );
  }

  void resetFilteredTickets() {
    //sort by date (newest to oldest) and then by title
    allTickets.sort((a, b) {
      //sort by date
      int dateComparison = b.updatedAt!.compareTo(a.updatedAt!);
      if (dateComparison != 0) {
        return dateComparison;
      }
      //sort by title
      return a.title.compareTo(b.title);
    });
    state = state.copyWith(filteredPlatformTickets: allTickets);
  }
}
