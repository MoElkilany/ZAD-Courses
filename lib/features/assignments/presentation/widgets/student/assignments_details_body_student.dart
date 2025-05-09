import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_progress_indicators.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../providers/assignment_details.dart';
import 'responsiveness/assignments_details_grid.dart';
import '../../../../../main.dart';

class AssignmentDetailsBodyStudent extends ConsumerWidget {
  const AssignmentDetailsBodyStudent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final height = AppSize.height;
    final asg = ref.watch(studentAssignmentDetailsProvider);
    if (asg == null) {
      return const Center(
        child: appDefaultCircIndicator,
      );
    }
    return Padding(
      padding: appPaddingSymH12,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: height * 0.3,
              width: double.infinity,
              color: kSecondary,
              child: Padding(
                padding: appPaddingSymV20,
                child: isLandscape ? AsgDetailsGridDesktop(asg: asg) : AsgDetailsGridMobile(asg: asg),
              ),
            ),
            appBoxH20,
            Text(
              asg.title,
              style: const TextStyle(
                fontSize: appFontSizeVeryLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBoxH8,
            Text(
              asg.description,
              style: const TextStyle(
                fontSize: appFontSizeLarge,
              ),
            ),
            appBoxH8,
            const Divider(
              thickness: 2,
            ),
            appBoxH8,
            if (asg.attachments.isNotEmpty)
              Text(
                'assignments.attachments'.tr(),
                style: const TextStyle(
                  fontSize: appFontSizeVeryLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            appBoxH8,
            if (asg.attachments.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: asg.attachments.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      //uri for launch url
                      final uri = Uri.parse(asg.attachments[index].url);
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Padding(
                      padding: appPaddingAll8,
                      child: Row(
                        children: [
                          const Icon(Icons.attach_file),
                          appBoxW8,
                          Text(asg.attachments[index].name),
                          isLandscape
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.05,
                                )
                              : const Spacer(),
                          const Icon(Icons.download),
                        ],
                      ),
                    ),
                  );
                },
              ),
            appSizeBoxH05,
          ],
        ),
      ),
    );
  }
}
