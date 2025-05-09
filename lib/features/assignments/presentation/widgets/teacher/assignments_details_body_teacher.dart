import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';

class AssignmentDetailsBodyTeacher extends StatelessWidget {
  const AssignmentDetailsBodyTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = AppSize.height;
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        appBoxW8,
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300]!.withOpacity(0.15),
                                      borderRadius: appBordRadCir50,
                                    ),
                                    padding: appPaddingAll8,
                                    child: const Icon(Icons.star_outline, color: kWhite, size: 30),
                                  ),
                                  appBoxW8,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Expired', style: TextStyle(color: kRed)),
                                      Text('assignments.deadline'.tr(), style: const TextStyle(color: kWhite)),
                                    ],
                                  ),
                                ],
                              ),
                              appBoxH8,
                            ],
                          ),
                        ),
                        appBoxW8,
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300]!.withOpacity(0.15),
                                      borderRadius: appBordRadCir50,
                                    ),
                                    padding: appPaddingAll8,
                                    child: const Icon(Icons.assignment_outlined, color: kWhite, size: 30),
                                  ),
                                  appBoxW8,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('0/1', style: TextStyle(color: kWhite)),
                                      FittedBox(
                                        child: AutoSizeText('assignments.submissions'.tr(), maxLines: 1, style: const TextStyle(color: kWhite)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              appBoxH8,
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        appBoxW8,
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300]!.withOpacity(0.15),
                                      borderRadius: appBordRadCir50,
                                    ),
                                    padding: appPaddingAll8,
                                    child: const Icon(Icons.calendar_today_outlined, color: kWhite, size: 30),
                                  ),
                                  appBoxW8,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('0/100', style: TextStyle(color: kWhite)),
                                      Text('assignments.studentGrade'.tr(), style: const TextStyle(color: kWhite)),
                                    ],
                                  ),
                                ],
                              ),
                              appBoxH8,
                            ],
                          ),
                        ),
                        appBoxW8,
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300]!.withOpacity(0.15),
                                      borderRadius: appBordRadCir50,
                                    ),
                                    padding: appPaddingAll8,
                                    child: const Icon(Icons.calendar_today_outlined, color: kWhite, size: 30),
                                  ),
                                  appBoxW8,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('50', style: TextStyle(color: kWhite)),
                                      Text('assignments.minGrade'.tr(), style: const TextStyle(color: kWhite)),
                                    ],
                                  ),
                                ],
                              ),
                              appBoxH8,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            appBoxH20,
            const Text(
              'Assignment Title',
              style: TextStyle(
                fontSize: appFontSizeVeryLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBoxH8,
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget nunc vitae tortor aliquam aliquet. Nulla facilisi. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam nisl nisl eget nisl. Nulla facilisi. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam nisl nisl eget nisl.',
              style: TextStyle(
                fontSize: appFontSizeLarge,
              ),
            ),
            appBoxH8,
            const Divider(
              thickness: 2,
            ),
            appBoxH8,
            Text(
              'assignments.attachments'.tr(),
              style: const TextStyle(
                fontSize: appFontSizeVeryLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            appBoxH8,
            //Downlaod Icon with attachment Name
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: appPaddingAll8,
                child: Row(
                  children: [
                    Icon(Icons.download),
                    appBoxW8,
                    Text('Attachment Name.pdf'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
