import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/app_font_size.dart';
import '../../domain/entities/financial_document.dart';
import 'financial_filter.dart';
import 'financial_list_state.dart';

part 'financial_lists_manager.g.dart';

@Riverpod(keepAlive: true)
class FinancialListManager extends _$FinancialListManager {
  @override
  FinancialListState build() {
    return const FinancialListState();
  }

  //how to read state
  List<FinDoc> get allDocuments => state.allDocuments;
  List<FinDoc> get filteredDocuments => state.filteredDocuments;

  void setFilteredDocuments() {
    final filters = ref.watch(financialFilterProvider.notifier);
    List<FinDoc> newFilteredDocuments = state.allDocuments;

    //if query is not null, filter by it
    if (filters.query != null) {
      newFilteredDocuments = newFilteredDocuments
          .where(
            (e) => e.course.toLowerCase().contains(
                  filters.query!.toLowerCase(),
                ),
          )
          .toList();
    }

    //apply all filters one by one
    //if SelectedSession is not null, filter by it
    if (state.selectedCourse != null) {
      newFilteredDocuments = newFilteredDocuments.where((e) => e.course == state.selectedCourse!.course).toList();
    }

    List<FinDoc> temp = [];
    //if isPending is true, add all pending assignments to temp
    if (filters.isAddition || filters.isDeduction) {
      if (filters.isAddition) {
        temp.addAll(newFilteredDocuments.where((e) => e.amount > 0.0));
      }
      //if isPassed is true, add all passed assignments to temp
      if (filters.isDeduction) {
        temp.addAll(newFilteredDocuments.where((e) => e.amount < 0.0));
      }

      //add all 0 amount assignments to temp
      temp.addAll(newFilteredDocuments.where((e) => e.amount == 0.0));
    } else {
      temp.addAll(newFilteredDocuments);
    }

    newFilteredDocuments = temp;

    //if firstSubmission is not null, filter by it
    if (filters.firstSubmission != null) {
      newFilteredDocuments = newFilteredDocuments.where((e) => e.createdAt.isAfter(filters.firstSubmission!)).toList();
    }

    //if lastSubmission is not null, filter by it
    if (filters.lastSubmission != null) {
      newFilteredDocuments = newFilteredDocuments.where((e) => e.createdAt.isBefore(filters.lastSubmission!)).toList();
    }

    state = state.copyWith(
      filteredNotices: newFilteredDocuments,
      allNotices: allDocuments,
      dropDownCourses: state.dropDownCourses,
      selectedCourse: state.selectedCourse,
    );
  }

  List<DropdownMenuItem<String>>? get dropDownCourses {
    if (state.allDocuments.isEmpty) {
      return null;
    }
    //order by course name then class name
    final sortedCourses = state.allDocuments
      ..sort((a, b) {
        //if a or b is null, return 0
        final course = a.course.compareTo(b.course);
        if (course != 0) {
          return course;
        }
        return a.course.compareTo(b.course);
      });

    //get all sessions
    final sessions = sortedCourses.map((e) {
      String session = e.course.toString();
      return session;
    }).toList();

    //remove duplicates
    final uniqueDocuments = sessions.toSet().toList();

    //remove Nulls
    uniqueDocuments.removeWhere((element) => element == 'null');

    //if list is empty , return a disabled item with 'No Courses' in bold
    if (uniqueDocuments.isEmpty) {
      return [
        DropdownMenuItem(
          enabled: false,
          child: Text(
            'courses.noCourses'.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: appFontSizeLarge,
            ),
          ),
        ),
      ];
    }

    //before the start of every unique CourseName, add a disabled item  with CourseName in bold
    final dropDownItems = <DropdownMenuItem<String>>[];
    for (final finDoc in uniqueDocuments) {
      dropDownItems.add(
        DropdownMenuItem(
          value: finDoc,
          child: Text(finDoc),
        ),
      );
    }
    return dropDownItems;
  }

  String? get selectedCourse {
    if (state.selectedCourse == null) {
      return null;
    }
    return state.selectedCourse!.course;
  }

  //setters
  void setAllDocuments(List<FinDoc> value) {
    state = state.copyWith(allNotices: value);
  }

  void initFilteredDocuments(List<FinDoc> value) {
    state = state.copyWith(filteredNotices: value);
  }

  void setSelectedCoure(String? value) {
    // print('setSelectedAssignment: $value');
    if (value == null) {
      state = state.copyWith(selectedCourse: null);
      return;
    }
    //find the assignment with the same course name and class name
    FinDoc? finDoc = state.allDocuments.firstWhere((e) {
      return e.course == value;
    });

    state = state.copyWith(selectedCourse: finDoc);
  }

  void resetSelectedCourse() {
    state = state.copyWith(selectedCourse: null);
  }

  void resetFilteredDocuments() {
    state = state.copyWith(filteredNotices: allDocuments);
  }
}
