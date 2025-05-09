import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_progress_indicators.dart';
import '../../../../core/config/app_size.dart';
import '../../../../core/config/app_sized_box.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/widgets/error/contents_none.dart';
import '../providers/app_parent_states.dart';
import '../providers/notifications.dart';
import 'notification_tile.dart';
import '../../../../main.dart';

class ProfileBody extends ConsumerStatefulWidget {
  const ProfileBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends ConsumerState<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(getZadNotificationProvider);
    var avatar = ref.read(AppParentStates.appUserInfo)?.image;
    log(avatar.toString());
    final userInfo = ref.read(AppParentStates.appUserInfo);
    return Column(
      children: [
        SizedBox(
          height: AppSize.height * 0.3,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: kSecondary,
                ),
              ),
              Center(
                child: SizedBox(
                  width: AppSize.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appSizeBoxH02,
                      avatar == null
                          ? const SizedBox.shrink()
                          : Expanded(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: CircleAvatar(
                                    radius: AppSize.width * 0.1,
                                    backgroundColor: kWhite,
                                    backgroundImage: NetworkImage(
                                      avatar,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      userInfo == null
                          ? const SizedBox.shrink()
                          //else list of user info
                          : Column(
                              children: [
                                appSizeBoxH02,
                                Text(
                                  //make first letter capital of each word in name
                                  userInfo.name.split(' ').map((e) => e[0].toUpperCase() + e.substring(1).toLowerCase()).join(' '),
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: appFontSizeHuge,
                                  ),
                                ),
                                appSizeBoxH02,
                                Text(
                                  userInfo.role.toString().split('.').last.toUpperCase(),
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: appFontSizeCompact,
                                  ),
                                ),
                                appSizeBoxH02,
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.topStart,
                child: SizedBox(
                  height: 25,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: BackButton(
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(getZadNotificationProvider);
            },
            backgroundColor: kSecondary,
            color: kWhite,
            child: notifications.when(
              skipLoadingOnRefresh: false,
              error: (error, stackTrace) {
                return Center(
                  child: const Text('errors.responseError').tr(),
                );
              },
              loading: () => const Center(
                child: appDefaultCircIndicator,
              ),
              data: (data) {
                final nots = ref.watch(notificationsListProvider);
                return nots.isEmpty
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              width: AppSize.width * 0.5,
                              height: AppSize.height * 0.3,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: ContentsNone(
                                    text: 'settings.notificationsNone'.tr(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            isLandscape ? appSizeBoxH02 : const SizedBox.shrink(),
                            isLandscape
                                ? SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: GridView.builder(
                                      itemCount: nots.length,
                                      shrinkWrap: true,
                                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 450,
                                        mainAxisExtent: 100,
                                      ),
                                      itemBuilder: (context, index) {
                                        return ZadNotificationTile(id: index);
                                      },
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: nots.length,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ZadNotificationTile(id: index);
                                    },
                                  ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
