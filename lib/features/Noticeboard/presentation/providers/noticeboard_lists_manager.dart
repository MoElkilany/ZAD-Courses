import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/config/app_font_size.dart';
import '../../domain/entities/notice.dart';
import 'noticeboard_filter.dart';
import 'noticeboard_list_state.dart';

part 'noticeboard_lists_manager.g.dart';

@Riverpod(keepAlive: true)
class NoticeboardListManager extends _$NoticeboardListManager {
  @override
  NoticeboardListState build() {
    return const NoticeboardListState();
  }

  //how to read state
  List<Notice> get allNotices => state.allNotices;
  List<Notice> get filteredNotices => state.filteredNotices;

  void setFilteredNotices() {
    final filters = ref.watch(noticeboardFilterProvider.notifier);
    List<Notice> newFilteredNotices = state.allNotices;

    //if query is not null, filter by it
    if (filters.query != null) {
      newFilteredNotices = newFilteredNotices
          .where(
            (e) => e.title.toLowerCase().contains(
                  filters.query!.toLowerCase(),
                ),
          )
          .toList();
    }

    //apply all filters one by one
    //if SelectedSession is not null, filter by it
    if (state.selectedCourse != null) {
      newFilteredNotices = newFilteredNotices.where((e) => e.course == state.selectedCourse!.course).toList();
    }

    //if firstSubmission is not null, filter by it
    if (filters.firstSubmission != null) {
      newFilteredNotices = newFilteredNotices.where((e) => e.date == null ? false : e.date!.isAfter(filters.firstSubmission!)).toList();
    }

    //if lastSubmission is not null, filter by it
    if (filters.lastSubmission != null) {
      newFilteredNotices = newFilteredNotices.where((e) => e.date == null ? false : e.date!.isBefore(filters.lastSubmission!)).toList();
    }

    state = state.copyWith(
      filteredNotices: newFilteredNotices,
      allNotices: allNotices,
      dropDownCourses: state.dropDownCourses,
      selectedCourse: state.selectedCourse,
    );
  }

  List<DropdownMenuItem<String>>? get dropDownCourses {
    if (state.allNotices.isEmpty) {
      return null;
    }
    //order by course name then class name
    final sortedCourses = state.allNotices
      ..sort((a, b) {
        //if a or b is null, return 0
        if (a.course == null || b.course == null) {
          return 0;
        }
        final course = a.course!.compareTo(b.course!);
        if (course != 0) {
          return course;
        }
        return a.course!.compareTo(b.course!);
      });

    //get all sessions
    final sessions = sortedCourses.map((e) {
      String session = e.course.toString();
      return session;
    }).toList();

    //remove duplicates
    final uniqueNotices = sessions.toSet().toList();

    //remove Nulls
    uniqueNotices.removeWhere((element) => element == 'null');

    //if list is empty , return a disabled item with 'No Courses' in bold
    if (uniqueNotices.isEmpty) {
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
    for (final notice in uniqueNotices) {
      dropDownItems.add(
        DropdownMenuItem(
          value: notice,
          child: Text(notice),
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
  void setAllNotices(List<Notice> value) {
    state = state.copyWith(allNotices: value);
  }

  void initFilteredNotices(List<Notice> value) {
    state = state.copyWith(filteredNotices: value);
  }

  void setSelectedCoure(String? value) {
    // print('setSelectedAssignment: $value');
    if (value == null) {
      state = state.copyWith(selectedCourse: null);
      return;
    }
    //find the assignment with the same course name and class name
    Notice? notice = state.allNotices.firstWhere((e) {
      if (e.course == null) {
        return false;
      }
      return e.course == value;
    });

    state = state.copyWith(selectedCourse: notice);
  }

  void resetSelectedCourse() {
    state = state.copyWith(selectedCourse: null);
  }

  void resetFilteredNotices() {
    state = state.copyWith(filteredNotices: allNotices);
  }
}
