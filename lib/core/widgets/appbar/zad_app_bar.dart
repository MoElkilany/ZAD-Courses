import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zad_test/core/config/app_font_size.dart';
import 'package:zad_test/core/config/app_sized_box.dart';
import 'package:zad_test/core/config/colors.dart';
import 'package:zad_test/features/app_parent/domain/entities/zad_notification.dart';
import 'package:zad_test/features/app_parent/presentation/providers/app_parent_states.dart';

import '../../../features/app_parent/presentation/providers/notifications.dart';
import '../../../router/router_utils.dart';


class ZADAppBar extends ConsumerWidget {
  const ZADAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(getZadNotificationProvider);
    final avatar = ref.read(AppParentStates.appUserInfo)?.image;

    return SliverAppBar(
      floating: true,
      title: Image.asset(
        'assets/logo.png',
        height: 55,
      ),
      centerTitle: true,
      actions: [
        // IconButton(
        //   splashRadius: 20,
        //   onPressed: () {},
        //   icon: badges.Badge(
        //     badgeContent: const Text(
        //       '1',
        //       style: TextStyle(
        //         fontSize: appFontSizeSmall,
        //         color: Colors.white,
        //       ),
        //     ),
        //     position: badges.BadgePosition.bottomStart(
        //       bottom: -4,
        //       start: -2,
        //     ),
        //     badgeStyle: const badges.BadgeStyle(
        //       badgeColor: Colors.blue,
        //     ),
        //     child: const Icon(Feather.shopping_cart),
        //   ),
        //   iconSize: 20,
        // ),
        notifications.when(
          data: (data) {
            final notifications = data.fold((l) => <ZadNotification>[], (r) => r);

            final unreadNum = notifications.map((e) => e.status == 'read' ? 0 : 1).reduce((value, element) => value + element);
            final hasNotifications = unreadNum > 0;

            return IconButton(
              onPressed: () {
                context.push(AppPages.profile.toPath);
              },
              icon: badges.Badge(
                showBadge: hasNotifications,
                position: badges.BadgePosition.bottomStart(
                  bottom: -2,
                  start: -6,
                ),
                badgeContent: Text(
                  //notifications.length for list of unread notifications
                  '$unreadNum',
                  style: const TextStyle(
                    fontSize: appFontSizeSmall,
                    color: Colors.white,
                  ),
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: kRed,
                ),
                child: Container(
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: avatar == null
                      ? const SizedBox.shrink()
                      : Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: CircleAvatar(
                              backgroundColor: kWhite,
                              backgroundImage: NetworkImage(
                                avatar,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            );
          },
          loading: () => Center(
            child: Shimmer.fromColors(
              baseColor: kGray.withOpacity(0.5),
              highlightColor: kGray.withOpacity(0.25),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kGray.withOpacity(0.5),
                ),
              ),
            ),
          ),
          error: (error, stack) => const Center(
            child: Text('Error'),
          ),
        ),

        appBoxW16,
      ],
    );
  }
}
