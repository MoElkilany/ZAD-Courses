import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/config/app_sized_box.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/entities/student.dart';
import '../../providers/filters_provider.dart';
import '../../providers/progress_provider.dart';

class ProgressSearchAndFilter extends ConsumerStatefulWidget {
  const ProgressSearchAndFilter({super.key});

  @override
  ConsumerState<ProgressSearchAndFilter> createState() => _ProgressSearchAndFilterState();
}

class _ProgressSearchAndFilterState extends ConsumerState<ProgressSearchAndFilter> {
  final searchController = TextEditingController();
  late final selectedCourseNotifier = ref.read(progressCourseFilterProvider.notifier);
  late final selectedChildNotifier = ref.read(progressStudentFilterProvider.notifier);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filtersProvider);
    final selectedCourse = ref.watch(progressCourseFilterProvider);
    final selectedChild = ref.watch(progressStudentFilterProvider);
    return filters.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            appBoxH8,
            //search bar and filter

            appBoxH8,
            //search bar and filter
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: data.fold(
                (left) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                  child: Text('Error getting children'),
                ),
                (f) => DropdownButtonHideUnderline(
                  child: DropdownButton<Student>(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    items: [
                      DropdownMenuItem(
                        child: Text('Select a child'),
                      ),
                      ...f.students.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                    ],
                    onChanged: (v) => selectedChildNotifier.update((_) => v),
                    value: selectedChild,
                  ),
                ),
              ),
            ),

            appBoxH8,
            if (selectedChild != null)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: data.fold(
                  (left) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                    child: Text('Error getting courses'),
                  ),
                  (f) => DropdownButtonHideUnderline(
                    child: DropdownButton<Course>(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      items: [
                        DropdownMenuItem(
                          child: Text('Select a course'),
                        ),
                        ...f.courses[selectedChild.studentId]!.map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                      ],
                      onChanged: (v) => selectedCourseNotifier.update((_) => v),
                      value: selectedCourse,
                    ),
                  ),
                ),
              ),
            appBoxH8
          ],
        );
      },
      error: (e, __) => Text('error $e'),
      loading: () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          appBoxH8,
          //search bar and filter
          Shimmer(
            enabled: true,
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.transparent, Colors.grey],
              stops: [0.4, 0.5, 0.6],
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Course>(
                  items: [DropdownMenuItem(child: Text('Loading courses'))],
                  onChanged: (_) {},
                ),
              ),
            ),
          ),
          appBoxH8,

          Shimmer(
            enabled: true,
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.transparent, Colors.grey],
              stops: [0.4, 0.5, 0.6],
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Course>(
                  items: [DropdownMenuItem(child: Text('Loading children'))],
                  onChanged: (_) {},
                ),
              ),
            ),
          ),
          appBoxH8
        ],
      ),
    );
  }
}
