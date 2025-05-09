import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

import '../../../di/app_settings.dart';
import '../../../di/initialisation.dart';
import '../../../features/app_parent/data/models/user_info_model/hive.dart';
import '../../../features/app_parent/presentation/providers/app_parent_states.dart';
import '../../../router/router_utils.dart';
import '../../usecase/no_parameters.dart';
import 'zad_drawer_item.dart';

class ZadDrawerItems extends ConsumerStatefulWidget {
  const ZadDrawerItems({super.key});

  @override
  ConsumerState<ZadDrawerItems> createState() => _ZadDrawerItemsState();
}

class _ZadDrawerItemsState extends ConsumerState<ZadDrawerItems> {
  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(AppParentStates.appUserInfo);

    return Column(
      children: [
        ZadDrawerItem(
          title: 'drawer.dashboard'.tr(),
          icon: MaterialCommunityIcons.view_dashboard,
          onTap: () {
            context.go(AppPages.dashboard.toPath);
          },
        ).toTile(),
        ZadDrawerItem(
          title: 'drawer.courses'.tr(),
          icon: FontAwesome.book,
          children: [
            ZadDrawerSubTile(
              title: 'drawer.myCourses'.tr(),
              onTap: () {
                context.go(AppPages.purchases.toPath);
              },
            ),
            ZadDrawerSubTile(
              title: 'drawer.favorites'.tr(),
              onTap: () {
                context.go(AppPages.favorites.toPath);
              },
            ),
          ],
        ).toTile(),
        if (userType != null && userType.role == UserType.parent) ...[
          ZadDrawerItem(
            title: 'drawer.progress'.tr(),
            icon: FontAwesome.bitbucket,
            onTap: () {
              context.go(AppPages.progress.toPath);
            },
          ).toTile(),
          ZadDrawerItem(
            title: 'drawer.monthly_evaluation'.tr(),
            icon: FontAwesome.laptop,
            onTap: () {
              context.go(AppPages.evaluations.toPath);
            },
          ).toTile(),
        ],
        if (userType != null && userType.role != UserType.parent)
          ZadDrawerItem(
            title: 'drawer.assignments'.tr(),
            icon: FontAwesome.pencil,
            onTap: () {
              context.go(AppPages.assignments.toPath);
            },
          ).toTile(),
        if (userType != null && userType.role != UserType.parent)
          ZadDrawerItem(
            title: 'drawer.quizzes'.tr(),
            icon: Icons.quiz_rounded,
            children: (userType.role == UserType.student)
                ? [
                    ZadDrawerSubTile(
                      title: 'drawer.myResults'.tr(),
                      onTap: () {
                        context.go(AppPages.quizResults.toPath);
                      },
                    ),
                    ZadDrawerSubTile(
                      title: 'drawer.notSubmitted'.tr(),
                      onTap: () {
                        context.go(AppPages.quizNotSubmitted.toPath);
                      },
                    ),
                  ]
                : [
                    ZadDrawerSubTile(
                      title: 'drawer.quizzesList'.tr(),
                      onTap: () {
                        context.go(AppPages.quizResults.toPath);
                      },
                    ),
                  ],
          ).toTile(),
        ZadDrawerItem(
          title: 'drawer.noticeboard'.tr(),
          icon: MaterialCommunityIcons.bulletin_board,
          children: (userType != null && userType.role == UserType.teacher)
              ? [
                  ZadDrawerSubTile(
                    title: 'drawer.postNotice'.tr(),
                    onTap: () {
                      context.go(AppPages.newNotice.toPath);
                    },
                  ),
                  ZadDrawerSubTile(
                    title: 'drawer.notices'.tr(),
                    onTap: () {
                      context.go(AppPages.noticeboard.toPath);
                    },
                  ),
                ]
              : [
                  ZadDrawerSubTile(
                    title: 'drawer.notices'.tr(),
                    onTap: () {
                      context.go(AppPages.noticeboard.toPath);
                    },
                  ),
                ],
        ).toTile(),
        ZadDrawerItem(
          title: 'drawer.financial'.tr(),
          icon: Icons.attach_money_rounded,
          onTap: () {
            context.go(AppPages.financial.toPath);
          },
        ).toTile(),
        ZadDrawerItem(
          title: 'drawer.support'.tr(),
          icon: FontAwesome.support,
          children: [
            ZadDrawerSubTile(
              title: 'drawer.newTicket'.tr(),
              onTap: () {
                context.go(AppPages.support.toPath);
              },
            ),
            ZadDrawerSubTile(
              title: 'drawer.myAcademicTickets'.tr(),
              onTap: () {
                context.go(AppPages.academicSupportHistory.toPath);
              },
            ),
            ZadDrawerSubTile(
              title: 'drawer.myPlatformTickets'.tr(),
              onTap: () {
                context.go(AppPages.platformSupportHistory.toPath);
              },
            ),
          ],
        ).toTile(),
        ZadDrawerItem(
          title: 'drawer.logout'.tr(),
          icon: Icons.logout,
          onTap: () async {
            await ref.read(AppSettingsDI.clearAuthInfo).call(NoParameters());
            await ref.read(AppSettingsDI.clearUserInfo).call(NoParameters()).then((value) {
              ref.read(AppServices.initializationListnable).authenticated = false;
              if (!mounted) return;
              // ignore: use_build_context_synchronously
              context.go(AppPages.login.toPath);
            });
          },
        ).toTile(),
      ],
    );
  }
}
