import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/notice.dart';
import '../../../../../main.dart';

class NoticeboardExpansionTitle extends StatelessWidget {
  const NoticeboardExpansionTitle({
    super.key,
    required this.notice,
  });

  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    notice.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    notice.date == null ? '-' : DateFormat('dd MMM yyyy | h:mm a').format(notice.date!),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kGray.withOpacity(0.6),
                    ),
                    maxLines: 1,
                    maxFontSize: appMaxSubTitleFontSize,
                    minFontSize: appMinSubTitleFontSize,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    notice.course ?? '-',
                    style: const TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SizedBox(
              height: isLandscape ? MediaQuery.of(context).size.height * 0.03 : null,
              child: FittedBox(
                child: IconButton(
                  onPressed: () {
                    //Alert Dialog to show the notification Title and Message
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => AlertDialog(
                        contentPadding: appPaddingSymH20,
                        shape: const RoundedRectangleBorder(
                          borderRadius: appBordRadCir8,
                        ),
                        titlePadding: appPaddingAll16,
                        actionsPadding: appPaddingAll4,
                        title: Text(
                          notice.title,
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
                            notice.message,
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
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
