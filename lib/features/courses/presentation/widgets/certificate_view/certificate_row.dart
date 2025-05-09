import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../domain/entities/course_certificate.dart';

class CertificateRow extends StatelessWidget {
  const CertificateRow({
    super.key,
    required this.certificate,
  });

  final CourseCertificate certificate;

  @override
  Widget build(BuildContext context) {
    Future<void> launchUrlOnTap(uri) async {
      //check if another url is still loading

      if (!await launchUrl(
        uri!,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $uri');
      }
    }

    return Padding(
      padding: appPaddingAll16,
      child: Column(
        children: [
          InkWell(
            onTap: () => launchUrlOnTap(
              Uri.parse(certificate.url),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: kLightGray,
                  width: 2,
                ),
                borderRadius: appBordRadCir16,
              ),
              child: Padding(
                padding: appPaddingSymV16,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      appBoxW16,
                      const FaIcon(
                        FontAwesomeIcons.certificate,
                      ),
                      appBoxW16,
                      Expanded(
                        child: AutoSizeText(
                          // 'certificate.download.link'.tr(),
                          certificate.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.download_rounded,
                      ),
                      appBoxW16,
                    ],
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
