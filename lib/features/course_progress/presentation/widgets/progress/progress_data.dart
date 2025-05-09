import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/error/contents_none.dart';
import '../../providers/progress_provider.dart';
import 'assignment_tab.dart';
import 'attendance_tab.dart';
import 'quizzes_tab.dart';

class ProgressData extends ConsumerWidget {
  const ProgressData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(progressDataProvider).when(
          data: (d) => d.fold(
            (l) => Center(
              child: Text('Error occured: $l'),
            ),
            (data) {
              return data == null
                  ? ContentsNone(
                      text: 'progress.choose_inputs'.tr(),
                    )
                  : Center(
                      child: DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            // TabBar within the page
                            TabBar(
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.black,
                              indicatorColor: Colors.blue,
                              tabs: [
                                Tab(child: Text('Attendance')),
                                Tab(child: Text('Assignments')),
                                Tab(child: Text('Quizzes')),
                              ],
                            ),

                            // Expanded to take available space
                            Expanded(
                              child: TabBarView(
                                children: [
                                  AttendanceTab(
                                    data: data.sessions,
                                  ),
                                  AssignmentsTab(
                                    data: data.assignments,
                                  ),
                                  QuizzesTab(
                                    data: data.quizzes,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
          error: (_, __) => Center(
            child: Text('Error reaching server'),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
