import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/app_border.dart';
import '../../../../core/config/app_font_size.dart';
import '../../../../core/config/app_padding.dart';
import '../../../../core/config/app_shadow.dart';
import '../../../../core/config/app_size.dart';
import '../../../../core/config/app_sized_box.dart';

import '../../../../core/config/colors.dart';
import '../../domain/entities/zad_notification.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../providers/notifications.dart';

class ZadNotificationTile extends ConsumerStatefulWidget {
  const ZadNotificationTile({
    super.key,
    required this.id,
  });
  final int id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZadNotificationTileState();
}

class _ZadNotificationTileState extends ConsumerState<ZadNotificationTile> {
  @override
  Widget build(BuildContext context) {
    final ZadNotification notification = ref.watch(notificationsListProvider)[widget.id];
    return Padding(
      padding: appPaddingBHeight02,
      child: Padding(
        padding: appPaddingSymmetricWidth02,
        child: SizedBox(
          height: AppSize.height * 0.1,
          child: Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: appBordRadCir16,
              boxShadow: appShadowKDark08,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (notification.status != 'read') {
                    ref
                        .read(
                      markNotificationReadProvider(
                        notificationId: notification.id,
                      ).future,
                    )
                        .then((value) {
                      final isRead = value.fold((l) => false, (r) => r);
                      if (isRead) {
                        setState(() {
                          //localy set the notification as read to avoid another request
                          ref.read(notificationsListProvider.notifier).setRead(
                                notification.id,
                              );
                        });
                      }
                    });
                  }
                  //Alert Dialog to show the notification Title and Message
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => AlertDialog(
                      contentPadding: appPaddingSymH20,
                      titlePadding: appPaddingAll16,
                      actionsPadding: appPaddingAll4,
                      title: Text(
                        notification.title,
                        style: const TextStyle(
                          color: kSecondary,
                          fontSize: appFontSizeLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        //msg is html text, use rich text to show it
                        child: HtmlWidget(
                          // the first parameter (`html`) is required
                          notification.message,
                          renderMode: RenderMode.column,
                          // set the default styling for text
                          textStyle: TextStyle(
                            color: kGray.withOpacity(0.8),
                            fontSize: appFontSizeMedium,
                          ),
                        ),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.check_sharp,
                            color: kDark,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Padding(
                  padding: appPaddingDirecS16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              notification.title,
                              style: const TextStyle(
                                color: kBlue,
                                fontSize: appFontSizeLarge,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          notification.status == 'read'
                              ? const SizedBox.shrink()
                              : const Icon(
                                  Icons.circle,
                                  color: kBlue,
                                  size: appFontSizeSmall,
                                ),
                          appSizeBoxW05,
                        ],
                      ),
                      Text(
                        // example: 13 Nov 2023 | 10:52
                        DateFormat('dd MMM yyyy | hh:mm').format(notification.createdAt),
                        style: TextStyle(
                          color: kGray.withOpacity(0.8),
                          fontSize: appFontSizeMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
