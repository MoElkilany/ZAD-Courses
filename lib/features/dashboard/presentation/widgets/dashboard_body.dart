import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../app_parent/data/models/user_info_model/hive.dart';
import '../../../app_parent/presentation/providers/app_parent_states.dart';
import 'parent/dashboard_body_parent.dart';
import 'student/dashboard_body_student.dart';
import 'teacher/dashboard_body_teacher.dart';

class DashboardBody extends ConsumerWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(AppParentStates.appUserInfo)?.role;

    return role == null
        ? appDefaultCircIndicator
        : role == UserType.teacher || role == UserType.assistant
            ? Padding(
                padding: appPaddingSymmetricWidth02,
                child: const DashboardBodyTeacher(),
              )
            : role == UserType.student
                ? Padding(
                    padding: appPaddingSymmetricWidth02,
                    child: const DashboardBodyStudent(),
                  )
                : const DashboardBodyParent();
  }
}
