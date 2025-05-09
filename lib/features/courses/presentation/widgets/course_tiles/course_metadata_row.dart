import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/app_border.dart';
import '../../../../../core/config/app_font_size.dart';
import '../../../../../core/config/app_padding.dart';
import '../../../../../core/config/app_sized_box.dart';
import '../../../../../core/config/colors.dart';
import '../../../../../main.dart';

class CourseMetadataRow extends StatelessWidget {
  const CourseMetadataRow({
    super.key,
    required this.classTitle,
    required this.classRating,
    required this.classYear,
  });

  final String classTitle;
  final double classRating;
  final String classYear;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isLandscape
          ? MediaQuery.of(context).size.width * 0.5 - 16
          : MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * 0.01 - 12,
      child: ClipRRect(
        borderRadius: appBordRadTLR8,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: appBordRadTLR8,
              color: kDark.withOpacity(0.6),
            ),
            child: Padding(
              padding: appPaddingSymH12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  appSizeBoxH01,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          classTitle,
                          maxLines: 2,
                          style: const TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: appFontSizeLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  appSizeBoxH01,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.star_rate_rounded, color: kZadOrange),
                      appSizeBoxW01,
                      AutoSizeText(
                        '${classRating.toStringAsPrecision(2)}/5.0',
                        maxLines: 1,
                        style: const TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      appSizeBoxW02,
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            classYear,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: appFontSizeMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  appSizeBoxH01,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
